/*
 * Copyright (c) 2020 Nordic Semiconductor ASA
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "adaptation.h"
#include "net.h"
#include "proxy.h"
#include "foundation.h"
#include "beacon.h"
#include "cfg.h"
#include "settings.h"

#define LOG_TAG             "[MESH-privbeaconsrv]"
/* #define LOG_INFO_ENABLE */
/* #define LOG_DEBUG_ENABLE */
#define LOG_WARN_ENABLE
#define LOG_ERROR_ENABLE
#define LOG_DUMP_ENABLE
#include "mesh_log.h"

#if MESH_RAM_AND_CODE_MAP_DETAIL
#ifdef SUPPORT_MS_EXTENSIONS
#pragma bss_seg(".ble_mesh_privbeaconsrv_bss")
#pragma data_seg(".ble_mesh_privbeaconsrv_data")
#pragma const_seg(".ble_mesh_privbeaconsrv_const")
#pragma code_seg(".ble_mesh_privbeaconsrv_code")
#endif
#else /* MESH_RAM_AND_CODE_MAP_DETAIL */
#pragma bss_seg(".ble_mesh_bss")
#pragma data_seg(".ble_mesh_data")
#pragma const_seg(".ble_mesh_const")
#pragma code_seg(".ble_mesh_code")
#endif /* MESH_RAM_AND_CODE_MAP_DETAIL */
static const struct bt_mesh_model *priv_beacon_srv;

/* Private Beacon configuration server model states */
struct {
    u8_t state;
    u8_t interval;
    u8_t proxy_state;
} priv_beacon_state;

static int priv_beacon_store(bool delete)
{
    if (!IS_ENABLED(CONFIG_BT_SETTINGS)) {
        return 0;
    }

    const void *data = delete ? NULL : &priv_beacon_state;
    size_t len = delete ? 0 : sizeof(priv_beacon_state);

    return bt_mesh_model_data_store(priv_beacon_srv, false, "pb", data, len);
}

static int beacon_status_rsp(const struct bt_mesh_model *mod,
                             struct bt_mesh_msg_ctx *ctx)
{
    BT_MESH_MODEL_BUF_DEFINE(buf, OP_PRIV_BEACON_STATUS, 2);
    bt_mesh_model_msg_init(&buf, OP_PRIV_BEACON_STATUS);

    net_buf_simple_add_u8(&buf, bt_mesh_priv_beacon_get());
    net_buf_simple_add_u8(&buf, bt_mesh_priv_beacon_update_interval_get());

    bt_mesh_model_send(mod, ctx, &buf, NULL, NULL);

    return 0;
}

static int handle_beacon_get(const struct bt_mesh_model *mod,
                             struct bt_mesh_msg_ctx *ctx,
                             struct net_buf_simple *buf)
{
    LOG_DBG("");

    beacon_status_rsp(mod, ctx);

    return 0;
}

static int handle_beacon_set(const struct bt_mesh_model *mod,
                             struct bt_mesh_msg_ctx *ctx,
                             struct net_buf_simple *buf)
{
    u8_t beacon;

    if (buf->len > 2U) {
        return -EMSGSIZE;
    }

    beacon = net_buf_simple_pull_u8(buf);
    if (beacon != BT_MESH_BEACON_DISABLED &&
        beacon != BT_MESH_BEACON_ENABLED) {
        LOG_WRN("Invalid beacon value %u", beacon);
        return -EINVAL;
    }

    if (buf->len == 1U) {
        bt_mesh_priv_beacon_update_interval_set(net_buf_simple_pull_u8(buf));
    }

    (void)bt_mesh_priv_beacon_set(beacon);
    beacon_status_rsp(mod, ctx);

    return 0;
}

static void gatt_proxy_status_rsp(const struct bt_mesh_model *mod,
                                  struct bt_mesh_msg_ctx *ctx)
{
    BT_MESH_MODEL_BUF_DEFINE(buf, OP_PRIV_GATT_PROXY_STATUS, 1);
    bt_mesh_model_msg_init(&buf, OP_PRIV_GATT_PROXY_STATUS);

    net_buf_simple_add_u8(&buf, bt_mesh_priv_gatt_proxy_get());

    bt_mesh_model_send(mod, ctx, &buf, NULL, NULL);
}

static int handle_gatt_proxy_get(const struct bt_mesh_model *mod,
                                 struct bt_mesh_msg_ctx *ctx,
                                 struct net_buf_simple *buf)
{
    LOG_DBG("");

    gatt_proxy_status_rsp(mod, ctx);

    return 0;
}

static int handle_gatt_proxy_set(const struct bt_mesh_model *mod,
                                 struct bt_mesh_msg_ctx *ctx,
                                 struct net_buf_simple *buf)
{
    u8_t gatt_proxy;

    gatt_proxy = net_buf_simple_pull_u8(buf);
    if (gatt_proxy != BT_MESH_GATT_PROXY_DISABLED &&
        gatt_proxy != BT_MESH_GATT_PROXY_ENABLED) {
        LOG_WRN("Invalid GATT proxy value %u", gatt_proxy);
        return -EINVAL;
    }

    LOG_DBG("%u", gatt_proxy);

    bt_mesh_priv_gatt_proxy_set(gatt_proxy);

    gatt_proxy_status_rsp(mod, ctx);

    return 0;
}

static void node_id_status_rsp(const struct bt_mesh_model *mod,
                               struct bt_mesh_msg_ctx *ctx, u8_t status,
                               u16_t net_idx, u8_t node_id)
{
    BT_MESH_MODEL_BUF_DEFINE(buf, OP_PRIV_NODE_ID_STATUS, 4);
    bt_mesh_model_msg_init(&buf, OP_PRIV_NODE_ID_STATUS);

    net_buf_simple_add_u8(&buf, status);
    net_buf_simple_add_le16(&buf, net_idx);
    net_buf_simple_add_u8(&buf, node_id);

    bt_mesh_model_send(mod, ctx, &buf, NULL, NULL);
}

static int handle_node_id_get(const struct bt_mesh_model *mod,
                              struct bt_mesh_msg_ctx *ctx,
                              struct net_buf_simple *buf)
{
    u8_t node_id, status;
    u16_t net_idx;

    net_idx = net_buf_simple_pull_le16(buf) & 0xfff;

    status = bt_mesh_subnet_priv_node_id_get(net_idx, (enum bt_mesh_feat_state *)&node_id);
    node_id_status_rsp(mod, ctx, status, net_idx, node_id);

    return 0;
}

static int handle_node_id_set(const struct bt_mesh_model *mod,
                              struct bt_mesh_msg_ctx *ctx,
                              struct net_buf_simple *buf)
{
    u8_t node_id, status;
    u16_t net_idx;

    net_idx = net_buf_simple_pull_le16(buf) & 0xfff;
    node_id = net_buf_simple_pull_u8(buf);
    if (node_id != BT_MESH_NODE_IDENTITY_RUNNING &&
        node_id != BT_MESH_NODE_IDENTITY_STOPPED) {
        LOG_ERR("Invalid node ID value 0x%02x", node_id);
        return -EINVAL;
    }

    status = bt_mesh_subnet_priv_node_id_set(net_idx, node_id);
    node_id_status_rsp(mod, ctx, status, net_idx, node_id);

    return 0;
}

const struct bt_mesh_model_op bt_mesh_priv_beacon_srv_op[] = {
    { OP_PRIV_BEACON_GET, BT_MESH_LEN_EXACT(0), handle_beacon_get },
    { OP_PRIV_BEACON_SET, BT_MESH_LEN_MIN(1), handle_beacon_set },
    { OP_PRIV_GATT_PROXY_GET, BT_MESH_LEN_EXACT(0), handle_gatt_proxy_get },
    { OP_PRIV_GATT_PROXY_SET, BT_MESH_LEN_EXACT(1), handle_gatt_proxy_set },
    { OP_PRIV_NODE_ID_GET, BT_MESH_LEN_EXACT(2), handle_node_id_get },
    { OP_PRIV_NODE_ID_SET, BT_MESH_LEN_EXACT(3), handle_node_id_set },
    BT_MESH_MODEL_OP_END
};

static int priv_beacon_srv_init(const struct bt_mesh_model *mod)
{
    if (!bt_mesh_model_in_primary(mod)) {
        LOG_ERR("Priv beacon server not in primary element");
        return -EINVAL;
    }

    priv_beacon_srv = mod;
    mod->keys[0] = BT_MESH_KEY_DEV_LOCAL;

    return 0;
}

static void priv_beacon_srv_reset(const struct bt_mesh_model *model)
{
    (void)memset(&priv_beacon_state, 0, sizeof(priv_beacon_state));
    priv_beacon_store(true);
}

#if CONFIG_BT_SETTINGS
static int priv_beacon_srv_settings_set(const struct bt_mesh_model *model, const char *name,
                                        size_t len_rd, settings_read_cb read_cb, void *cb_data)
{
    int err;

    err = node_info_load(PRIV_BEACON_STATE_INDEX, &priv_beacon_state, sizeof(priv_beacon_state));
    if (err) {
        LOG_ERR("Failed to set Private Beacon state");
        return err;
    }

    bt_mesh_priv_beacon_set(priv_beacon_state.state);
    bt_mesh_priv_beacon_update_interval_set(priv_beacon_state.interval);
    bt_mesh_priv_gatt_proxy_set(priv_beacon_state.proxy_state);
    return 0;
}

static void priv_beacon_srv_pending_store(const struct bt_mesh_model *model)
{
    priv_beacon_state.state = bt_mesh_priv_beacon_get();
    priv_beacon_state.interval = bt_mesh_priv_beacon_update_interval_get();
    priv_beacon_state.proxy_state = bt_mesh_priv_gatt_proxy_get();

    priv_beacon_store(false);
}
#endif

const struct bt_mesh_model_cb bt_mesh_priv_beacon_srv_cb = {
    .init = priv_beacon_srv_init,
    .reset = priv_beacon_srv_reset,
#if CONFIG_BT_SETTINGS
    .settings_set = priv_beacon_srv_settings_set,
    .pending_store = priv_beacon_srv_pending_store,
#endif
};

void bt_mesh_priv_beacon_srv_store_schedule(void)
{
    if (IS_ENABLED(CONFIG_BT_SETTINGS)) {
        bt_mesh_model_data_store_schedule(priv_beacon_srv);
    }
}
