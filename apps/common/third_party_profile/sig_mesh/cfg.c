/*
 * Copyright (c) 2020 Nordic Semiconductor ASA
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "adaptation.h"
#include "mesh.h"
#include "net.h"
#include "rpl.h"
#include "beacon.h"
#include "settings.h"
#include "heartbeat.h"
#include "friend.h"
#include "cfg.h"
#include "od_priv_proxy.h"
#include "priv_beacon.h"

#define LOG_TAG             "[MESH-cfg]"
#define LOG_INFO_ENABLE
#define LOG_DEBUG_ENABLE
#define LOG_WARN_ENABLE
#define LOG_ERROR_ENABLE
#define LOG_DUMP_ENABLE
#include "mesh_log.h"

#if MESH_RAM_AND_CODE_MAP_DETAIL
#ifdef SUPPORT_MS_EXTENSIONS
#pragma bss_seg(".ble_mesh_cfg_bss")
#pragma data_seg(".ble_mesh_cfg_data")
#pragma const_seg(".ble_mesh_cfg_const")
#pragma code_seg(".ble_mesh_cfg_code")
#endif
#else /* MESH_RAM_AND_CODE_MAP_DETAIL */
#pragma bss_seg(".ble_mesh_bss")
#pragma data_seg(".ble_mesh_data")
#pragma const_seg(".ble_mesh_const")
#pragma code_seg(".ble_mesh_code")
#endif /* MESH_RAM_AND_CODE_MAP_DETAIL */


void bt_mesh_beacon_set(bool beacon)
{
    if (atomic_test_bit(bt_mesh.flags, BT_MESH_BEACON) == beacon) {
        return;
    }

    atomic_set_bit_to(bt_mesh.flags, BT_MESH_BEACON, beacon);

    if (beacon) {
        bt_mesh_beacon_enable();
    } else {
        /* Beacon timer will stop automatically when all beacons are disabled. */
    }

    if (IS_ENABLED(CONFIG_BT_SETTINGS) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_settings_store_schedule(BT_MESH_SETTINGS_CFG_PENDING);
    }
}

bool bt_mesh_beacon_enabled(void)
{
    return atomic_test_bit(bt_mesh.flags, BT_MESH_BEACON);
}

static int feature_set(int feature_flag, enum bt_mesh_feat_state state)
{
    if (state != BT_MESH_FEATURE_DISABLED &&
        state != BT_MESH_FEATURE_ENABLED) {
        return -EINVAL;
    }

    if (atomic_test_bit(bt_mesh.flags, feature_flag) ==
        (state == BT_MESH_FEATURE_ENABLED)) {
        return -EALREADY;
    }

    atomic_set_bit_to(bt_mesh.flags, feature_flag,
                      (state == BT_MESH_FEATURE_ENABLED));

    return 0;
}

static enum bt_mesh_feat_state feature_get(int feature_flag)
{
    return atomic_test_bit(bt_mesh.flags, feature_flag) ?
           BT_MESH_FEATURE_ENABLED :
           BT_MESH_FEATURE_DISABLED;
}

int bt_mesh_priv_beacon_set(enum bt_mesh_feat_state priv_beacon)
{
    int err;

    if (!IS_ENABLED(CONFIG_BT_MESH_PRIV_BEACONS)) {
        return -ENOTSUP;
    }

    err = feature_set(BT_MESH_PRIV_BEACON, priv_beacon);
    if (err) {
        return err;
    }

    if (priv_beacon == BT_MESH_FEATURE_ENABLED) {
        bt_mesh_beacon_enable();
    } else {
        /* Beacon timer will stop automatically when all beacons are disabled. */
    }

    if (IS_ENABLED(CONFIG_BT_SETTINGS) && IS_ENABLED(CONFIG_BT_MESH_PRIV_BEACON_SRV) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_priv_beacon_srv_store_schedule();
    }

    return 0;
}

enum bt_mesh_feat_state bt_mesh_priv_beacon_get(void)
{
    if (!IS_ENABLED(CONFIG_BT_MESH_PRIV_BEACONS)) {
        return BT_MESH_FEATURE_NOT_SUPPORTED;
    }

    return feature_get(BT_MESH_PRIV_BEACON);
}

void bt_mesh_priv_beacon_update_interval_set(u8_t interval)
{
#if defined(CONFIG_BT_MESH_PRIV_BEACONS)
    bt_mesh.priv_beacon_int = interval;
#endif
}

u8_t bt_mesh_priv_beacon_update_interval_get(void)
{
#if defined(CONFIG_BT_MESH_PRIV_BEACONS)
    return bt_mesh.priv_beacon_int;
#else
    return 0;
#endif
}

int bt_mesh_od_priv_proxy_get(void)
{
#if IS_ENABLED(CONFIG_BT_MESH_OD_PRIV_PROXY_SRV)
    return bt_mesh.on_demand_state;
#else
    return -ENOTSUP;
#endif
}

int bt_mesh_od_priv_proxy_set(u8_t on_demand_proxy)
{
#if !IS_ENABLED(CONFIG_BT_MESH_OD_PRIV_PROXY_SRV)
    return -ENOTSUP;
#else

    if (bt_mesh_priv_gatt_proxy_get() != BT_MESH_FEATURE_NOT_SUPPORTED) {
        bt_mesh.on_demand_state = on_demand_proxy;
    }

    if (IS_ENABLED(CONFIG_BT_SETTINGS) && IS_ENABLED(CONFIG_BT_MESH_OD_PRIV_PROXY_SRV) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_od_priv_proxy_srv_store_schedule();
    }
    return 0;
#endif
}

static bool node_id_is_running(struct bt_mesh_subnet *sub, void *cb_data)
{
    return sub->node_id == BT_MESH_NODE_IDENTITY_RUNNING;
}

int bt_mesh_gatt_proxy_set(enum bt_mesh_feat_state gatt_proxy)
{
    int err;

    if (!IS_ENABLED(CONFIG_BT_MESH_GATT_PROXY)) {
        return -ENOTSUP;
    }

    err = feature_set(BT_MESH_GATT_PROXY, gatt_proxy);
    if (err) {
        return err;
    }

    /* The binding from section 4.2.45.1 disables Private GATT Proxy state when non-private
     * state is enabled.
     */
    if (gatt_proxy == BT_MESH_FEATURE_ENABLED) {
        feature_set(BT_MESH_PRIV_GATT_PROXY, BT_MESH_FEATURE_DISABLED);
    }

    if ((gatt_proxy == BT_MESH_FEATURE_ENABLED) ||
        (gatt_proxy == BT_MESH_FEATURE_DISABLED &&
         !bt_mesh_subnet_find(node_id_is_running, NULL))) {
        bt_mesh_adv_gatt_update();
    }

    bt_mesh_hb_feature_changed(BT_MESH_FEAT_PROXY);

    if (IS_ENABLED(CONFIG_BT_SETTINGS) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_settings_store_schedule(BT_MESH_SETTINGS_CFG_PENDING);
    }

    return 0;
}

enum bt_mesh_feat_state bt_mesh_gatt_proxy_get(void)
{
    if (!IS_ENABLED(CONFIG_BT_MESH_GATT_PROXY)) {
        return BT_MESH_FEATURE_NOT_SUPPORTED;
    }

    return feature_get(BT_MESH_GATT_PROXY);
}

int bt_mesh_priv_gatt_proxy_set(enum bt_mesh_feat_state priv_gatt_proxy)
{
    int err;

    if (!IS_ENABLED(CONFIG_BT_MESH_GATT_PROXY) || !IS_ENABLED(CONFIG_BT_MESH_PRIV_BEACONS)) {
        return BT_MESH_FEATURE_NOT_SUPPORTED;
    }

    /* Reverse binding from section 4.2.45.1 doesn't allow to enable private state if
     * non-private state is enabled.
     */
    if (bt_mesh_gatt_proxy_get() == BT_MESH_FEATURE_ENABLED) {
        return BT_MESH_FEATURE_DISABLED;
    }

    err = feature_set(BT_MESH_PRIV_GATT_PROXY, priv_gatt_proxy);
    if (err) {
        return err;
    }

    if (priv_gatt_proxy == BT_MESH_FEATURE_ENABLED) {
        /* Re-generate proxy beacon */
        bt_mesh_adv_gatt_update();
    }

    if (IS_ENABLED(CONFIG_BT_SETTINGS) && IS_ENABLED(CONFIG_BT_MESH_PRIV_BEACON_SRV) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_priv_beacon_srv_store_schedule();
    }

    return 0;
}

enum bt_mesh_feat_state bt_mesh_priv_gatt_proxy_get(void)
{
    if (!IS_ENABLED(CONFIG_BT_MESH_GATT_PROXY) || !IS_ENABLED(CONFIG_BT_MESH_PRIV_BEACONS)) {
        return BT_MESH_FEATURE_NOT_SUPPORTED;
    }

    return feature_get(BT_MESH_PRIV_GATT_PROXY);
}

int bt_mesh_default_ttl_set(u8_t default_ttl)
{
    if (default_ttl == 1 || default_ttl > BT_MESH_TTL_MAX) {
        return -EINVAL;
    }

    if (default_ttl == bt_mesh.default_ttl) {
        return 0;
    }

    bt_mesh.default_ttl = default_ttl;

    if (IS_ENABLED(CONFIG_BT_SETTINGS) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_settings_store_schedule(BT_MESH_SETTINGS_CFG_PENDING);
    }

    return 0;
}

u8_t bt_mesh_default_ttl_get(void)
{
    return bt_mesh.default_ttl;
}

int bt_mesh_friend_set(enum bt_mesh_feat_state friendship)
{
    int err;

    if (!IS_ENABLED(CONFIG_BT_MESH_FRIEND)) {
        return -ENOTSUP;
    }

    err = feature_set(BT_MESH_FRIEND, friendship);
    if (err) {
        return err;
    }

    bt_mesh_hb_feature_changed(BT_MESH_FEAT_FRIEND);

    if (IS_ENABLED(CONFIG_BT_SETTINGS) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_settings_store_schedule(BT_MESH_SETTINGS_CFG_PENDING);
    }

    if (friendship == BT_MESH_FEATURE_DISABLED) {
        bt_mesh_friends_clear();
    }

    return 0;
}

enum bt_mesh_feat_state bt_mesh_friend_get(void)
{
    if (!IS_ENABLED(CONFIG_BT_MESH_FRIEND)) {
        return BT_MESH_FEATURE_NOT_SUPPORTED;
    }

    return feature_get(BT_MESH_FRIEND);
}

void bt_mesh_net_transmit_set(u8_t xmit)
{
    if (bt_mesh.net_xmit == xmit) {
        return;
    }

    bt_mesh.net_xmit = xmit;

    if (IS_ENABLED(CONFIG_BT_SETTINGS) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_settings_store_schedule(BT_MESH_SETTINGS_CFG_PENDING);
    }
}

u8_t bt_mesh_net_transmit_get(void)
{
    return bt_mesh.net_xmit;
}

int bt_mesh_relay_set(enum bt_mesh_feat_state relay, u8_t xmit)
{
    int err;

    if (!IS_ENABLED(CONFIG_BT_MESH_RELAY)) {
        return -ENOTSUP;
    }

    err = feature_set(BT_MESH_RELAY, relay);
    if (err == -EINVAL) {
        return err;
    }

    if (err == -EALREADY && bt_mesh.relay_xmit == xmit) {
        return -EALREADY;
    }

    bt_mesh.relay_xmit = xmit;
    bt_mesh_hb_feature_changed(BT_MESH_FEAT_RELAY);

    if (IS_ENABLED(CONFIG_BT_SETTINGS) &&
        atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        bt_mesh_settings_store_schedule(BT_MESH_SETTINGS_CFG_PENDING);
    }

    return 0;
}

enum bt_mesh_feat_state bt_mesh_relay_get(void)
{
    return feature_get(BT_MESH_RELAY);
}

u8_t bt_mesh_relay_retransmit_get(void)
{
    if (!IS_ENABLED(CONFIG_BT_MESH_RELAY)) {
        return 0;
    }

    return bt_mesh.relay_xmit;
}

bool bt_mesh_fixed_group_match(u16_t addr)
{
    /* Check for fixed group addresses */
    switch (addr) {
    case BT_MESH_ADDR_ALL_NODES:
        return true;
    case BT_MESH_ADDR_PROXIES:
        return (bt_mesh_gatt_proxy_get() == BT_MESH_FEATURE_ENABLED);
    case BT_MESH_ADDR_FRIENDS:
        return (bt_mesh_friend_get() == BT_MESH_FEATURE_ENABLED);
    case BT_MESH_ADDR_RELAYS:
        return (bt_mesh_relay_get() == BT_MESH_FEATURE_ENABLED);
    default:
        return false;
    }
}

void bt_mesh_cfg_default_set(void)
{
    bt_mesh.default_ttl = CONFIG_BT_MESH_DEFAULT_TTL;
    bt_mesh.net_xmit =
        BT_MESH_TRANSMIT(CONFIG_BT_MESH_NETWORK_TRANSMIT_COUNT,
                         CONFIG_BT_MESH_NETWORK_TRANSMIT_INTERVAL);

#if (CONFIG_BT_MESH_RELAY)
    bt_mesh.relay_xmit =
        BT_MESH_TRANSMIT(CONFIG_BT_MESH_RELAY_RETRANSMIT_COUNT,
                         CONFIG_BT_MESH_RELAY_RETRANSMIT_INTERVAL);
#endif

    if (IS_ENABLED(CONFIG_BT_MESH_RELAY_ENABLED)) {
        atomic_set_bit(bt_mesh.flags, BT_MESH_RELAY);
    }

    if (IS_ENABLED(CONFIG_BT_MESH_BEACON_ENABLED)) {
        atomic_set_bit(bt_mesh.flags, BT_MESH_BEACON);
    }

    if (IS_ENABLED(CONFIG_BT_MESH_GATT_PROXY_ENABLED)) {
        atomic_set_bit(bt_mesh.flags, BT_MESH_GATT_PROXY);
    }

    if (IS_ENABLED(CONFIG_BT_MESH_FRIEND_ENABLED)) {
        atomic_set_bit(bt_mesh.flags, BT_MESH_FRIEND);
    }
}

void bt_mesh_cfg_pending_store(void)
{
    if (atomic_test_bit(bt_mesh.flags, BT_MESH_VALID)) {
        store_pending_cfg();
    } else {
        clear_cfg();
    }
}
