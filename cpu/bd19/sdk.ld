

















































  _local_irq_enable = ABSOLUTE(0x106d98);
  _local_irq_disable = ABSOLUTE(0x106d9c);
  lp_signature_set = ABSOLUTE(0x106da0);
  os_init = ABSOLUTE(0x106da4);
  os_start = ABSOLUTE(0x106da8);
  os_get_curr_tcb_var = ABSOLUTE(0x106dac);
  os_task_create_rom = ABSOLUTE(0x106db0);
  os_current_task_rom = ABSOLUTE(0x106db4);
  os_time_dly = ABSOLUTE(0x106db8);
  os_time_get = ABSOLUTE(0x106dbc);
  os_task_del_req = ABSOLUTE(0x106dc0);
  os_task_del_res = ABSOLUTE(0x106dc4);
  os_task_del = ABSOLUTE(0x106dc8);
  __os_taskq_pend = ABSOLUTE(0x106dcc);
  os_taskq_pend = ABSOLUTE(0x106dd0);
  os_task_pend = ABSOLUTE(0x106dd4);
  __os_taskq_post = ABSOLUTE(0x106dd8);
  os_taskq_post = ABSOLUTE(0x106ddc);
  os_taskq_post_type = ABSOLUTE(0x106de0);
  os_taskq_flush = ABSOLUTE(0x106de4);
  task_queue_post_event = ABSOLUTE(0x106de8);
  os_taskq_post_msg = ABSOLUTE(0x106dec);
  os_taskq_post_event = ABSOLUTE(0x106df0);
  os_taskq_accept = ABSOLUTE(0x106df4);
  os_taskq_del = ABSOLUTE(0x106df8);
  os_taskq_del_type = ABSOLUTE(0x106dfc);
  os_sem_create = ABSOLUTE(0x106e00);
  os_sem_del = ABSOLUTE(0x106e04);
  os_sem_pend = ABSOLUTE(0x106e08);
  os_sem_post = ABSOLUTE(0x106e0c);
  os_sem_set = ABSOLUTE(0x106e10);
  os_sem_valid = ABSOLUTE(0x106e14);
  os_sem_query = ABSOLUTE(0x106e18);
  os_mutex_create = ABSOLUTE(0x106e1c);
  os_mutex_del = ABSOLUTE(0x106e20);
  os_mutex_pend = ABSOLUTE(0x106e24);
  os_mutex_post = ABSOLUTE(0x106e28);
  os_mutex_valid = ABSOLUTE(0x106e2c);
  xTaskCreate = ABSOLUTE(0x106e30);
  xTaskGetCurrentTaskHandle = ABSOLUTE(0x106e34);
  xTaskGetTickCount = ABSOLUTE(0x106e38);
  xTaskGetHandle = ABSOLUTE(0x106e3c);
  vTaskDelete = ABSOLUTE(0x106e40);
  xTaskGetApplicationTaskTag = ABSOLUTE(0x106e44);
  vTaskSetApplicationTaskTag = ABSOLUTE(0x106e48);
  xQueueGenericCreateStatic = ABSOLUTE(0x106e4c);
  xQueueGenericReset = ABSOLUTE(0x106e50);
  xQueueGenericSend = ABSOLUTE(0x106e54);
  xQueueGenericSendFromISR = ABSOLUTE(0x106e58);
  xQueueGenericReceive = ABSOLUTE(0x106e5c);
  xQueueReceiveFromISR = ABSOLUTE(0x106e60);
  vQueueDelete = ABSOLUTE(0x106e64);
  uxQueueMessagesWaiting = ABSOLUTE(0x106e68);
  uxQueueMessagesWaitingFromISR = ABSOLUTE(0x106e6c);
  uxQueueSpacesAvailable = ABSOLUTE(0x106e70);
  pcTaskGetName = ABSOLUTE(0x106e74);
  prvGetExpectedIdleTime = ABSOLUTE(0x106e78);
  eTaskConfirmSleepModeStatus = ABSOLUTE(0x106e7c);
  vTaskStepTick = ABSOLUTE(0x106e80);
  pxPortInitialiseStack = ABSOLUTE(0x106e84);
  xPortStartScheduler = ABSOLUTE(0x106e88);
  vPortEndScheduler = ABSOLUTE(0x106e8c);
  vPortYield = ABSOLUTE(0x106e90);
  vPortExitCritical = ABSOLUTE(0x106e94);
  OS_ClrPending = ABSOLUTE(0x106e98);
  vTickISR = ABSOLUTE(0x106e9c);
  pmalloc_init = ABSOLUTE(0x106ea0);
  pmalloc = ABSOLUTE(0x106ea4);
  pfree = ABSOLUTE(0x106ea8);
  pmalloc_get_unused_pages = ABSOLUTE(0x106eac);
  get_physic_address = ABSOLUTE(0x106eb0);
  pmm_get_var = ABSOLUTE(0x106eb4);
  vmm_init_ = ABSOLUTE(0x106eb8);
  vmalloc_ = ABSOLUTE(0x106ebc);
  vfree_ = ABSOLUTE(0x106ec0);
  vmem_get_phy_adr = ABSOLUTE(0x106ec4);
  vmem_start = ABSOLUTE(0x106ec8);
  vmem_end = ABSOLUTE(0x106ecc);
  vmm_get_var = ABSOLUTE(0x106ed0);
  vmalloc_v2 = ABSOLUTE(0x106ed4);
  vfree_v2 = ABSOLUTE(0x106ed8);
  vcopy_ = ABSOLUTE(0x106edc);
  memmem = ABSOLUTE(0x106ee0);
  memcpy = ABSOLUTE(0x106ee4);
  memmove = ABSOLUTE(0x106ee8);
  memcmp = ABSOLUTE(0x106eec);
  memset = ABSOLUTE(0x106ef0);
  strcmp = ABSOLUTE(0x106ef4);
  strcpy = ABSOLUTE(0x106ef8);
  strlen = ABSOLUTE(0x106efc);
  strncmp = ABSOLUTE(0x106f00);
  strstr = ABSOLUTE(0x106f04);
  strchr = ABSOLUTE(0x106f08);
  IcuInitial = ABSOLUTE(0x106f0c);
  DcuInitial = ABSOLUTE(0x106f10);
  IcuCmdKst = ABSOLUTE(0x106f14);
  DcuCmdKst = ABSOLUTE(0x106f18);
  IcuCmdSend = ABSOLUTE(0x106f1c);
  DcuCmdSend = ABSOLUTE(0x106f20);
  sfc_resume = ABSOLUTE(0x106f28);
  sfc_drop_cache = ABSOLUTE(0x106f2c);
  chip_crc16 = ABSOLUTE(0x106f30);
  CrcDecode = ABSOLUTE(0x106f34);
  mask_init = ABSOLUTE(0x106f38);
  wdt_clr = ABSOLUTE(0x106f3c);
  nvram_set_boot_state = ABSOLUTE(0x106f40);
  chip_reset = ABSOLUTE(0x106f44);
  the_debug_isr = ABSOLUTE(0x106f48);
  doe = ABSOLUTE(0x106f4c);
  _pll_init = ABSOLUTE(0x106f50);
  flash_poweron = ABSOLUTE(0x106f54);
  spi_unmount = ABSOLUTE(0x106f58);
  spi_port_io_init = ABSOLUTE(0x106f5c);
  LZ4_setStreamDecode = ABSOLUTE(0x106f60);
  LZ4_decompress_safe_continue = ABSOLUTE(0x106f64);
  LZ4_decompress_safe_usingDict = ABSOLUTE(0x106f68);
  _sdk_mkey_lock = ABSOLUTE(0x106f6c);
  g_hash_function = ABSOLUTE(0x106f70);
  f1_hash_function = ABSOLUTE(0x106f74);
  f2_hash_function = ABSOLUTE(0x106f78);
  f3_hash_function = ABSOLUTE(0x106f7c);
  h2_hash_function = ABSOLUTE(0x106f80);
  h3_hash_function = ABSOLUTE(0x106f84);
  h4_hash_function = ABSOLUTE(0x106f88);
  h5_hash_function = ABSOLUTE(0x106f8c);
  g_function = ABSOLUTE(0x106f90);
  f1_function = ABSOLUTE(0x106f94);
  f2_function = ABSOLUTE(0x106f98);
  f3_function = ABSOLUTE(0x106f9c);
  sha256Compute = ABSOLUTE(0x106fa0);
  uECC_compute_public_key = ABSOLUTE(0x106fa4);
  uECC_valid_public_key = ABSOLUTE(0x106fa8);
  uECC_make_key = ABSOLUTE(0x106fac);
  uECC_shared_secret = ABSOLUTE(0x106fb0);
  bi_initialize = ABSOLUTE(0x106fb4);
  bi_read_from_byte = ABSOLUTE(0x106fb8);
  bi_poly_mod2 = ABSOLUTE(0x106fbc);
  bi_poly_mul = ABSOLUTE(0x106fc0);
  trim = ABSOLUTE(0x106fc4);
  bi_wirte_to_byte = ABSOLUTE(0x106fc8);
  bi_free = ABSOLUTE(0x106fcc);
  bi_terminate = ABSOLUTE(0x106fd0);
  uECC_vli_isZero = ABSOLUTE(0x106fd4);
  uECC_vli_modSquare_fast = ABSOLUTE(0x106fd8);
  uECC_vli_modMult_fast = ABSOLUTE(0x106fdc);
  uECC_vli_modAdd = ABSOLUTE(0x106fe0);
  uECC_vli_modSub = ABSOLUTE(0x106fe4);
  uECC_vli_testBit = ABSOLUTE(0x106fe8);
  uECC_vli_add = ABSOLUTE(0x106fec);
  uECC_vli_rshift1 = ABSOLUTE(0x106ff0);
  uECC_vli_set = ABSOLUTE(0x106ff4);
  uECC_vli_sub = ABSOLUTE(0x106ff8);
  uECC_vli_cmp_unsafe = ABSOLUTE(0x106ffc);
  boot_arg_list = ABSOLUTE(0xfc00);
  _IRQ_MEM_ADDR = ABSOLUTE(0xff00);
  _MASK_MEM_BEGIN = ABSOLUTE(0xfbe0);
  _MASK_MEM_SIZE = ABSOLUTE(0x294);


EXTERN(
_start

sdfile_vfs_ops
sbc_decoder





sbc_hwaccel
cvsd_decoder
pcm_decoder

);



UPDATA_SIZE = 0x80;
UPDATA_BEG = _MASK_MEM_BEGIN - UPDATA_SIZE;
UPDATA_BREDR_BASE_BEG = 0xeb60;

RAM_LIMIT_L = 0;
RAM_LIMIT_H = UPDATA_BEG;
PHY_RAM_SIZE = RAM_LIMIT_H - RAM_LIMIT_L;


ISR_BASE = _IRQ_MEM_ADDR;
ROM_RAM_SIZE = _MASK_MEM_SIZE;
ROM_RAM_BEG = _MASK_MEM_BEGIN;

RAM0_BEG = RAM_LIMIT_L;
RAM0_END = RAM_LIMIT_H;
RAM0_SIZE = RAM0_END - RAM0_BEG;







CODE_BEG = 0x1E00120;

MEMORY
{
 code0(rx) : ORIGIN = CODE_BEG, LENGTH = 0x100000
 ram0(rwx) : ORIGIN = RAM0_BEG, LENGTH = RAM0_SIZE
}


ENTRY(_start)

SECTIONS
{
    . = ORIGIN(code0);
    .text ALIGN(4):
    {
        PROVIDE(text_rodata_begin = .);

        *(.entry_text)
        *(.startup.text)

  *(.text)




        btstack_code_start = .;

        . = ALIGN(4);

        a2dp_source_media_codec_begin = .;
        KEEP(*(.a2dp_source_media_codec))
            a2dp_source_media_codec_end = .;
        a2dp_sink_media_probe_begin = .;
        KEEP(*(.a2dp_sink_media_probe))
            a2dp_sink_media_probe_end = .;

        a2dp_sink_media_codec_begin = .;
        KEEP(*(.a2dp_sink_media_codec))
            a2dp_sink_media_codec_end = .;

        a2dp_event_handler_begin = .;
        KEEP(*(.a2dp_event_handler))
            a2dp_event_handler_end = .;

        sdp_record_item_begin = .;
        KEEP(*(.sdp_record_item))
            sdp_record_item_end = .;

        bt_sleep_begin = .;
        KEEP(*(.bt_sleep))
            bt_sleep_end = .;

  *(.bt_stack_const)
  *(.bt_stack_code)
        *(.ble_db_const)
        *(.ble_db_code)
        *(.ble_sm_const)
        *(.ble_sm_code)
        *(.ble_att_const)
        *(.ble_att_code)
        *(.ble_gatt_const)
        *(.ble_gatt_code)


        BTSTACK_LE_HOST_MESH_CODE_START = .;
        *(.ble_mesh_code)
        *(.ble_mesh_tinycrypt_code)

        *(.ble_mesh_const)
        *(.ble_mesh_tinycrypt_const)
        BTSTACK_LE_HOST_MESH_CODE_SIZE = ABSOLUTE(. - BTSTACK_LE_HOST_MESH_CODE_START);

        _fmna_const_begin = .;
        *(.fmna_stack_const)
        *(.fmna_plaform_const)
        *(.fmna_crypto_const)
        _fmna_const_end = .;
        . = ALIGN(4);
        _fmna_code_begin = .;
        *(.fmna_stack_code)
        *(.fmna_plaform_code)
        *(.fmna_crypto_code)
        _fmna_code_end = .;
        btstack_fmna_const_size = _fmna_const_end - _fmna_const_begin;
        btstack_fmna_code_size = _fmna_code_end - _fmna_code_begin;
        . = ALIGN(4);


        btstack_code_end = .;
  . = ALIGN(4);


        BTSTACK_CODE_TOTAL_SIZE = btstack_code_end - btstack_code_start;


  . = ALIGN(4);
        system_text_start = .;

   _device_node_begin = .;
     PROVIDE(device_node_begin = .);
     KEEP(*(.device))
     _device_node_end = .;
     PROVIDE(device_node_end = .);

  config_target_begin = .;
     PROVIDE(config_target_begin = .);
     KEEP(*(.config_target))
  config_target_end = .;
     PROVIDE(config_target_end = .);

     system_code_begin = .;
     KEEP(*(.system.*.text))
     system_code_end = .;
  . = ALIGN(4);
  system_code_size = system_code_end - system_code_begin;

  vfs_ops_begin = .;
  KEEP(*(.vfs_operations))
  vfs_ops_end = .;

     _lib_version_begin = .;
     PROVIDE(lib_version_begin = .);
     KEEP(*(.lib_version))
     _lib_version_end = .;
     PROVIDE(lib_version_end = .);

  _initcall_begin = .;
  PROVIDE(initcall_begin = .);
     KEEP(*(.initcall))
  _initcall_end = .;
  PROVIDE(initcall_end = .);

  _early_initcall_begin = .;
  PROVIDE(early_initcall_begin = .);
  KEEP(*(.early.initcall))
  _early_initcall_end = .;
  PROVIDE(early_initcall_end = .);

  _late_initcall_begin = .;
  PROVIDE(late_initcall_begin = .);
  KEEP(*(.late.initcall))
  _late_initcall_end = .;
  PROVIDE(late_initcall_end = .);

  _platform_initcall_begin = .;
  PROVIDE(platform_initcall_begin = .);
  KEEP(*(.platform.initcall))
  _platform_initcall_end = .;
  PROVIDE(platform_initcall_end = .);

  _module_initcall_begin = .;
  PROVIDE(module_initcall_begin = .);
  KEEP(*(.module.initcall))
  _module_initcall_end = .;
  PROVIDE(module_initcall_end = .);

  _sys_event_handler_begin = .;
  PROVIDE(sys_event_handler_begin = .);
  KEEP(*(.sys_event.4.handler))
  KEEP(*(.sys_event.3.handler))
  KEEP(*(.sys_event.2.handler))
  KEEP(*(.sys_event.1.handler))
  KEEP(*(.sys_event.0.handler))
  _sys_event_handler_end = .;
  PROVIDE(sys_event_handler_end = .);

  _syscfg_arg_begin = .;
  PROVIDE(syscfg_arg_begin = .);
  KEEP(*(.syscfg.arg))
  _syscfg_arg_end = .;
  PROVIDE(syscfg_arg_end = .);

  _syscfg_handler_begin = .;
  PROVIDE(syscfg_handler_begin = .);
  KEEP(*(.syscfg.handler))
  _syscfg_handler_end = .;
  PROVIDE(syscfg_handler_end = .);

  _syscfg_ops_begin = .;
  PROVIDE(syscfg_ops_begin = .);
  KEEP(*(.syscfg.2.ops))
  KEEP(*(.syscfg.1.ops))
  KEEP(*(.syscfg.0.ops))
  _syscfg_ops_end = .;
  PROVIDE(syscfg_ops_end = .);

  _server_info_begin = .;
  PROVIDE(server_info_begin = .);
  KEEP(*(.server_info))
  _server_info_end = .;
  PROVIDE(server_info_end = .);

  _bus_device_begin = .;
  PROVIDE(bus_device_begin = .);
  KEEP(*(.bus_device))
  _bus_device_end = .;
  PROVIDE(bus_device_end = .);

     _sys_power_hal_ops_begin = .;
     PROVIDE(sys_power_hal_ops_begin = .);
     KEEP(*(.sys_power_hal_ops))
     _sys_power_hal_ops_end = .;
     PROVIDE(sys_power_hal_ops_end = .);


  . = ALIGN(4);
     lp_target_begin = .;
     PROVIDE(lp_target_begin = .);
     KEEP(*(.lp_target))
     lp_target_end = .;
     PROVIDE(lp_target_end = .);

  . = ALIGN(4);
        deepsleep_target_begin = .;
        PROVIDE(deepsleep_target_begin = .);
        KEEP(*(.deepsleep_target))
        deepsleep_target_end = .;
        PROVIDE(deepsleep_target_end = .);

     crypto_begin = .;
     *(.crypto_ecdh_code)
     *(.crypto_ecdh_const)

     *(.crypto_bigint_code)
     *(.crypto_bigint_const)

     *(.crypto_code)
     *(.crypto_const)

     *(.ECDH_sample_code)
     *(.ECDH_sample_const)

     *(.uECC_code)
     *(.uECC_const)

     *(.hmac_code)
     *(.hmac_const)

     *(.hash_sample_code)
     *(.hash_sample_const)

     *(.aes_cmac_sample_code)
     *(.aes_cmac_sample_const)
     crypto_end = .;
     crypto_size = . - crypto_begin;

        *(.mem_code)
        *(.mem_const)

        *(.os_port_code)
        *(.os_port_const)

        *(.math_fast_funtion_code)

        __movable_function_start = .;
        *(movable.text.*);
        *(movable.stub.*);
        *(movable.region.*);

        __movable_function_end = .;
        __movable_function_size = __movable_function_end - __movable_function_start;

        system_text_end = .;



        system_code_total_size = system_text_end - system_text_start;


  . = ALIGN(4);
     update_target_begin = .;
     PROVIDE(update_target_begin = .);
     KEEP(*(.update_target))
     update_target_end = .;
     PROVIDE(update_target_end = .);
  . = ALIGN(4);

  *(.LOG_TAG_CONST*)
        *(.rodata*)
        *(.fat_data_code_ex)

  . = ALIGN(4);
        PROVIDE(text_rodata_end = .);

        clock_critical_handler_begin = .;
        KEEP(*(.clock_critical_txt))
        clock_critical_handler_end = .;

        chargestore_handler_begin = .;
        KEEP(*(.chargestore_callback_txt))
        chargestore_handler_end = .;

        gsensor_dev_begin = .;
        KEEP(*(.gsensor_dev))
        gsensor_dev_end = .;

  . = ALIGN(4);

        OMSensor_dev_begin = .;
        KEEP(*(.omsensor_dev))
        OMSensor_dev_end = .;

        . = ALIGN(4);

        _bt_mesh_scene_entry_sig_list_start = .;
        KEEP(*(.bt_mesh_scene_entry_sig))
        _bt_mesh_scene_entry_sig_list_end = .;

        . = ALIGN(4);
        _bt_mesh_scene_entry_vnd_list_start = .;
        KEEP(*(.bt_mesh_scene_entry_vnd))
        _bt_mesh_scene_entry_vnd_list_end = .;

        storage_device_begin = .;
        KEEP(*(.storage_device))
        storage_device_end = .;


        *(.opcore_table_maskrom)
        *(.bfilt_table_maskroom)
        *(.opcore_maskrom)
        *(.bfilt_code)
        *(.bfilt_const)


        . = ALIGN(4);
  *(.audio_decoder_code)
  *(.audio_decoder_const)
  *(.audio_encoder_code)
  *(.audio_encoder_const)
  *(.audio_codec_code)
  . = ALIGN(4);
  *(.media.audio_decoder.text)
  *(.media.audio_encoder.text)
        . = ALIGN(4);
  *(.usbc_encoder_code)
  *(.usbc_decoder_code)
        *(.resample_fastcal_const)
        *(.resample_fastcal_code)
        *(.resample_fastcal_sparse_code)




        *(.adpcm_encode_sparse_code)
        *(.adpcm_encode_code)
        *(.adpcm_encode_const)
        *(.pcm_code)
        . = ALIGN(4);
  *(.wav_code)
  *(.wav_const)
  *(.wav_dec_sparse_code)
  *(.wav_dec_const)
  *(.wav_dec_code)
     *(.wtgv2_code)
  *(.wtgv2_const)
  *(.wtgv2dec_code)
  *(.wtgv2dec_const)
  *(.wtgv2dec_str)
  *(.wtg_decv2_sparse_code)
  *(.lc3_decoder_code)
  *(.msbc_codec_const)
  *(.msbc_codec_code)
  *(.msbc_const)
  *(.msbc_code)
        *(.audio_pwm_code)
  *(.opus_code)
     *(.opus_encoder_code)
  *(.opus_encoder_const)
  *(.opus_enc_const)
  *(.opus_enc_code)
  . = ALIGN(4);
     _audio_decoder_begin = .;
     PROVIDE(audio_decoder_begin = .);
         KEEP(*(.audio_decoder))
     _audio_decoder_end = .;
     PROVIDE(audio_decoder_end = .);

     _audio_encoder_begin = .;
     PROVIDE(audio_encoder_begin = .);
         KEEP(*(.audio_encoder))
     _audio_encoder_end = .;
     PROVIDE(audio_encoder_end = .);

        . = ALIGN(4);
        __VERSION_BEGIN = .;
        KEEP(*(.sys.version))
        __VERSION_END = .;

        *(.noop_version)


  . = ALIGN(32);
  m_code_addr = . ;
  *(.m.code*)
  *(.movable.code*)
   m_code_size = ABSOLUTE(. - m_code_addr) ;
  . = ALIGN(32);
   } > code0

    . = ORIGIN(ram0);

    .mmu_tlb ALIGN(0x4000):
    {
        *(.mmu_tlb_segment);
    } > ram0

 .boot_info ALIGN(32):
 {
  *(.boot_info)
        . = ALIGN(32);
 } > ram0


 .data ALIGN(32):
 {

        *(.data*)

        . = ALIGN(32);


        btstack_data_start = .;
        *(.bt_stack_data)
        *(.ble_db_data)
        *(.ble_sm_data)
        *(.ble_att_data)
        *(.ble_gatt_data)


        BTSTACK_LE_HOST_MESH_DATA_START = .;
  . = (. +3) & ~ 3;
        _net_buf_pool_list = .;
        *(._net_buf_pool.static.*)

        *(.ble_mesh_data)
        *(.ble_mesh_tinycrypt_data)
        BTSTACK_LE_HOST_MESH_DATA_SIZE = ABSOLUTE(. - BTSTACK_LE_HOST_MESH_DATA_START);

        _fmna_data_begin = .;
        *(.fmna_stack_data)
        *(.fmna_plaform_data)
        *(.fmna_crypto_data)
        _fmna_data_end = .;
        btstack_fmna_data_size = _fmna_data_end - _fmna_data_begin;
        . = ALIGN(4);


        btstack_data_end = .;

  . = ALIGN(4);


  . = ALIGN(4);
        system_data_start = .;

  _video_subdev_begin = .;
  PROVIDE(video_subdev_begin = .);
  KEEP(*(.video_subdev.0))
  KEEP(*(.video_subdev.1))
  KEEP(*(.video_subdev.2))
  KEEP(*(.video_subdev.3))
  KEEP(*(.video_subdev.4))
  KEEP(*(.video_subdev.5))
  _video_subdev_end = .;
  PROVIDE(video_subdev_end = .);

  _audio_subdev_begin = .;
  PROVIDE(audio_subdev_begin = .);
  KEEP(*(.audio_subdev.0))
  KEEP(*(.audio_subdev.1))
  KEEP(*(.audio_subdev.2))
  KEEP(*(.audio_subdev.3))
  _audio_subdev_end = .;
  PROVIDE(audio_subdev_end = .);

  _iic_device_begin = .;
  PROVIDE(iic_device_begin = .);
  KEEP(*(.iic))
  _iic_device_end = .;
  PROVIDE(iic_device_end = .);

        _avin_spi_device_begin = .;
  PROVIDE(avin_spi_device_begin = .);
  KEEP(*(.sw_spi))
  _avin_spi_device_end = .;
  PROVIDE(avin_spi_device_end = .);

  _video_dev_begin = .;
  PROVIDE(video_dev_begin = .);
  KEEP(*(.video_device))
  _video_dev_end = .;
  PROVIDE(video_dev_end = .);

  _key_driver_ops_begin = .;
  PROVIDE(key_driver_ops_begin = .);
  KEEP(*(.key_driver_ops))
  _key_driver_ops_end = .;
  PROVIDE(key_driver_ops_end = .);

  _touch_driver_begin = .;
  PROVIDE(touch_driver_begin = .);
  KEEP(*(.touch_driver))
  _touch_driver_end = .;
  PROVIDE(touch_driver_end = .);

  _static_hi_timer_begin = .;
  PROVIDE(static_hi_timer_begin = .);
  KEEP(*(.hi_timer))
  _static_hi_timer_end = .;
  PROVIDE(static_hi_timer_end = .);

  _sys_cpu_timer_begin = .;
  PROVIDE(sys_cpu_timer_begin = .);
  KEEP(*(.sys_cpu_timer))
  _sys_cpu_timer_end = .;
  PROVIDE(sys_cpu_timer_end = .);

     _sys_config_begin = .;
     PROVIDE(sys_config_begin = .);
     KEEP(*(.sys_cfg))
     _sys_config_end = .;
     PROVIDE(sys_config_end = .);

     _sys_fat_begin = .;
     PROVIDE(sys_fat_begin = .);
     KEEP(*(.fs_fat))
     _sys_fat_end = .;
     PROVIDE(sys_fat_end = .);

  _app_begin = .;
  PROVIDE(app_begin = .);
  KEEP(*(.app))
  _app_end = .;
  PROVIDE(app_end = .);

  _os_begin = .;
  PROVIDE(os_begin = .);




     *(.os_str)
     *(.os_data)
  _os_end = .;
  PROVIDE(os_end = .);

     *(.crypto_ecdh_data)
     *(.crypto_data)

     *(.mem_data)
        *(.os_port_data)

     *(.uECC_data)
     *(.ECDH_sample_data)

         __movable_slot_start = .;
         *(movable.slot.*);
         __movable_slot_end = .;

        system_data_end = .;

  . = ALIGN(4);
  *(.wav_data)
  *(.usbc_encoder_data)
  *(.usbc_decoder_data)
        *(.resample_fastcal_data)
     *(.wtgv2_data)
  *(.wtgv2dec_data)
  *(.opus_encoder_data)
        *(.opus_enc_data)




        *(.msbc_data)
        *(.msbc_codec_data)
  . = ALIGN(4);




  . = ALIGN(4);
 } > ram0

 .irq_stack ALIGN(32):
    {
  *(.stack_magic)
        _cpu0_sstack_begin = .;
        PROVIDE(cpu0_sstack_begin = .);
        *(.stack)
        _cpu0_sstack_end = .;
        PROVIDE(cpu0_sstack_end = .);
     _stack_end = . ;
  *(.stack_magic0)
  . = ALIGN(4);

    } > ram0

 .bss ALIGN(32):
    {
            *(.usb_audio_play_dma)
            *(.usb_audio_rec_dma)
            *(.uac_rx)
            *(.mass_storage)
            *(.usb_h_dma)

            *(.usb_ep0)
            *(.usb_msd_dma)
            *(.usb_hid_dma)
            *(.usb_iso_dma)
            *(.usb_cdc_dma)
            *(.uac_var)
            *(.usb_config_var)
            *(.cdc_var)
        . = ALIGN(4);
         *(.wav_bss)
   *(.wtgv2_bss)
   *(.wtgv2dec_bss)
   *(.opus_encoder_bss)
   *(.opus_enc_bss)
            *(.resample_fastcal_bss)






        *(.msbc_bss)
        *(.msbc_codec_bss)
        . = ALIGN(4);


        btstack_bss_start = .;
        *(.bt_stack_bss)
        *(.ble_db_bss)
        *(.ble_sm_bss)
        *(.ble_att_bss)
        *(.ble_gatt_bss)
        *(.btstack_pool)


        BTSTACK_LE_HOST_MESH_BSS_START = .;
        *(.ble_mesh_bss)
        *(.ble_mesh_tinycrypt_bss)
        BTSTACK_LE_HOST_MESH_BSS_SIZE = ABSOLUTE(. - BTSTACK_LE_HOST_MESH_BSS_START);

        . = ALIGN(4);
        _fmna_bss_begin = .;
        *(.fmna_stack_bss)
        *(.fmna_plaform_bss)
        *(.fmna_crypto_bss)
        _fmna_bss_end = .;
        btstack_fmna_bss_size = _fmna_bss_end - _fmna_bss_begin;
        . = ALIGN(4);

        btstack_bss_end = .;

        . = ALIGN(4);


        system_bss_start = .;
        . = ALIGN(4);
        *(.os_bss)
        *(.mem_heap)
  *(.memp_memory_x)
        *(.mem_bss)
        *(.os_port_bss)

        *(.uECC_bss)
        *(.ECDH_sample_bss)

        system_bss_end = .;

        . = ALIGN(4);
        *(.bss)
        . = ALIGN(4);
        *(.os_bss)
        *(.volatile_ram)
  *(.btstack_pool)

        *(.mem_heap)
  *(.memp_memory_x)


        . = ALIGN(32);

    } > ram0

 .data_code ALIGN(32):
 {
  data_code_pc_limit_begin = .;
  *(.flushinv_icache)
        *(.cache)
        *(.os_critical_code)
        *(.volatile_ram_code)
        *(.chargebox_code)
  *(.os_code)
  *(.os_str)

        *(.fat_data_code)

  . = ALIGN(4);
        _SPI_CODE_START = . ;
        *(.spi_code)
  . = ALIGN(4);
        _SPI_CODE_END = . ;
  . = ALIGN(4);

 } > ram0





    .nv_bss ALIGN(32) :
 {
  NVRAM_DATA_START = .;
  *(.non_volatile_ram)
  NVRAM_DATA_SIZE = ABSOLUTE(. - NVRAM_DATA_START);
  . = ALIGN(4);
  NVRAM_END = .;
  _nv_pre_begin = . ;
    } > ram0

 __report_overlay_begin = .;
 OVERLAY : AT(0x200000) SUBALIGN(4)
    {
  .overlay_aec
  {
            . = ALIGN(4);
   aec_code_begin = . ;
   *(.text._*)
   *(.data._*)
   *(.aec_code)
   *(.aec_const)
   *(.res_code)
   *(.res_const)
   *(.ns_code)
   *(.ns_const)
   *(.fft_code)
   *(.fft_const)
   *(.nlp_code)
   *(.nlp_const)
   *(.der_code)
   *(.der_const)
   *(.qmf_code)
   *(.qmf_const)
   *(.aec_data)
   *(.res_data)
   *(.ns_data)
   *(.nlp_data)
         *(.der_data)
         *(.qmf_data)
         *(.fft_data)
   *(.dms_code)
   *(.dms_const)
   *(.dms_data)
            . = ALIGN(4);
   *(.aec_mux)
            . = ALIGN(4);
   aec_code_end = . ;
   aec_code_size = aec_code_end - aec_code_begin ;
  }

  .overlay_aac
  {
   . = ALIGN(4);
   aac_dec_code_begin = .;
   *(.bt_aac_dec_code)
            *(.bt_aac_dec_sparse_code)
   aac_dec_code_end = .;
   aac_dec_code_size = aac_dec_code_end - aac_dec_code_begin ;

   . = ALIGN(4);
   bt_aac_dec_const_begin = .;
   *(.bt_aac_dec_const)
            *(.bt_aac_dec_sparse_const)
   . = ALIGN(4);
   bt_aac_dec_const_end = .;
   bt_aac_dec_const_size = bt_aac_dec_const_end - bt_aac_dec_const_begin ;

   *(.bt_aac_dec_data)
   . = ALIGN(4);
  }

    } > ram0


    .ram0_empty0 ALIGN(4) :
 {
        . = . + 4;
    } > ram0


 OVERLAY : AT(0x210000) SUBALIGN(4)
    {
  .overlay_aec_ram
  {
            . = ALIGN(4);
   *(.msbc_enc)
   *(.cvsd_codec)
   *(.aec_bss)
   *(.res_bss)
   *(.ns_bss)
   *(.nlp_bss)
         *(.der_bss)
         *(.qmf_bss)
         *(.fft_bss)
   *(.aec_mem)
   *(.dms_bss)
  }

  .overlay_aac_ram
  {
            . = ALIGN(4);
   *(.bt_aac_dec_bss)

   . = ALIGN(4);
   *(.aac_mem)
   *(.aac_ctrl_mem)


  }

  .overlay_mp3
  {
   *(.mp3_mem)
   *(.mp3_ctrl_mem)
   *(.mp3pick_mem)
   *(.mp3pick_ctrl_mem)
   *(.dec2tws_mem)
  }
  .overlay_wma
  {
   *(.wma_mem)
   *(.wma_ctrl_mem)
   *(.wmapick_mem)
   *(.wmapick_ctrl_mem)
  }
  .overlay_ape
        {
            *(.ape_mem)
            *(.ape_ctrl_mem)
  }
  .overlay_flac
        {
            *(.flac_mem)
            *(.flac_ctrl_mem)
  }
  .overlay_m4a
        {
            *(.m4a_mem)
            *(.m4a_ctrl_mem)
  }
  .overlay_amr
        {
            *(.amr_mem)
            *(.amr_ctrl_mem)
  }
  .overlay_dts
        {
            *(.dts_mem)
            *(.dts_ctrl_mem)
  }
  .overlay_fm
  {
   *(.fm_mem)
  }
        .overlay_pc
  {
  }




    } > ram0
    NVRAM_LIMIT = 0xc000 - 0x100 - 0x400;
    _nv_pre_end = 0xc000 - 0x100 - 0x400;
    ASSERT(NVRAM_END <= NVRAM_LIMIT, "NVRAM space overflow!")

 data_code_pc_limit_end = .;
 __report_overlay_end = .;

 _HEAP_BEGIN = . ;
 _HEAP_END = RAM0_END;
}


SECTIONS
{
    .data : ALIGN(4)
    {
        btctler_data_start = .;

        BTCTLER_CONTROLLER_DATA_START = .;
        *(.bt_rf_data)
  *(.vendor_manager_data)
  *(.device_manager_data)
  *(.hci_controller_data)
  *(.hci_interface_data)
        BTCTLER_CONTROLLER_DATA_SIZE = ABSOLUTE(. - BTCTLER_CONTROLLER_DATA_START);

        BTCTLER_LE_CONTROLLER_DATA_START = .;
        *(.ble_ll_data)
        *(.ble_hci_data)
        *(.classic_hci_data)
        *(.ble_rf_data)
        BTCTLER_LE_CONTROLLER_DATA_SIZE = ABSOLUTE(. - BTCTLER_LE_CONTROLLER_DATA_START);

        BTCTLER_CL_DATA_START = .;
        *(.classic_lmp_data)
        *(.classic_lmp_auth_data)
        *(.classic_lmp_bigint_data)
        *(.classic_lmp_crypt_data)
        *(.classic_lmp_ecdh_data)
        *(.classic_lmp_linkbulk_data)
        *(.classic_lmp_hmac_data)
        *(.classic_rf_data)
        *(.classic_bb_data)
        BTCTLER_CL_DATA_SIZE = ABSOLUTE(. - BTCTLER_CL_DATA_START);

        btctler_data_end = .;

  . = ALIGN(4);
    } > ram0

    .bss (NOLOAD) :ALIGN(4)
    {
        btctler_bss_start = .;

        BTCTLER_CONTROLLER_BSS_START = .;

        *(.bd_base)
        *(.bredr_rxtx_bulk)
        acl_tx_pool = .;
        *(.bredr_tx_bulk)

        acl_tx_pool_end = acl_tx_pool + (0);



        . = acl_tx_pool_end;

        acl_rx_pool = .;
        *(.bredr_rx_bulk)

        acl_rx_pool_end = acl_rx_pool + (0);



        . = acl_rx_pool_end;

        tws_bulk_pool = .;



        tws_bulk_pool_end = tws_bulk_pool;

        . = tws_bulk_pool_end;

        *(.bt_rf_bss)
  *(.hci_controller_bss)
  *(.hci_interface_bss)
  *(.device_manager_bss)
  *(.vendor_manager_bss)
        BTCTLER_CONTROLLER_BSS_SIZE = ABSOLUTE(. - BTCTLER_CONTROLLER_BSS_START);

        BTCTLER_LE_CONTROLLER_BSS_START = .;
        *(.ble_hci_bss)
        *(.ble_ll_bss)
        *(.ble_rf_bss)
        BTCTLER_LE_CONTROLLER_BSS_SIZE = ABSOLUTE(. - BTCTLER_LE_CONTROLLER_BSS_START);

        BTCTLER_CL_BSS_START = .;
        *(.classic_rf_bss)
        *(.classic_lmp_bss)
        *(.classic_lmp_auth_bss)
        *(.classic_lmp_bigint_bss)
        *(.classic_lmp_crypt_bss)
        *(.classic_lmp_ecdh_bss)
        *(.classic_lmp_linkbulk_bss)
        *(.classic_lmp_hmac_bss)
        *(.classic_bb_bss)
        *(.classic_hci_bss)
        BTCTLER_CL_BSS_SIZE = ABSOLUTE(. - BTCTLER_CL_BSS_START);

        btctler_bss_end = .;

  . = ALIGN(4);
    } > ram0

    .text : ALIGN(4)
    {
        btctler_code_start = .;

        BTCTLER_CONTROLLER_CODE_START = .;
  *(.bt_rf_const)
  *(.bt_rf_code)
  *(.vendor_manager_const)
  *(.vendor_manager_code)
  *(.device_manager_const)
  *(.device_manager_code)
  *(.hci_controller_const)
  *(.hci_controller_code)
  *(.hci_interface_const)
  *(.hci_interface_code)
        BTCTLER_CONTROLLER_CODE_SIZE = ABSOLUTE(. - BTCTLER_CONTROLLER_CODE_START);

        BTCTLER_LE_CONTROLLER_CODE_START = .;
        *(.ble_rf_const)
        *(.ble_rf_code)

     *(.ble_ll_const)
     *(.ble_ll_code)
  *(.ble_hci_const)
  *(.ble_hci_code)
  *(.classic_hci_const)
  *(.classic_hci_code)
        BTCTLER_LE_CONTROLLER_CODE_SIZE = ABSOLUTE(. - BTCTLER_LE_CONTROLLER_CODE_START);

        BTCTLER_CL_CODE_START = .;
        *(.bredr_irq)
        *(.bredr_irq_code)
        *(.bredr_irq_const)

        *(.classic_lmp_const)
        *(.classic_lmp_auth_const)
        *(.classic_lmp_bigint_const)
        *(.classic_lmp_crypt_const)
        *(.classic_lmp_ecdh_const)
        *(.classic_lmp_hmac_const)
        *(.classic_lmp_code)
        *(.classic_lmp_auth_code)
        *(.classic_lmp_bigint_code)
        *(.classic_lmp_crypt_code)
        *(.classic_lmp_ecdh_code)
        *(.classic_lmp_hmac_code)
        *(.classic_rf_const)
        *(.classic_rf_code)
        *(.classic_bb_const)
        *(.classic_bb_code)
        BTCTLER_CL_CODE_SIZE = ABSOLUTE(. - BTCTLER_CL_CODE_START);



  . = ALIGN(4);
        *(.classic_tws_const)
        *(.classic_tws_code)
        *(.classic_tws_code.esco)

        btctler_code_end = .;

  . = ALIGN(4);
    } > code0


 .data_code ALIGN(32):
 {
        btctler_ram_code_start = .;

        *(.lmp_irq_code)
        *(.link_bulk_code)
        *(.frame_irq_code)

  . = ALIGN(4);
        *(.link_task_const)
        *(.link_task_code)

  . = ALIGN(4);
        *(.classic_irq_const)
        *(.classic_irq_code)


  . = ALIGN(4);
        *(.tws_irq_code)

  . = ALIGN(4);
        tws_sync_call_begin = .;
        KEEP(*(.tws_sync_call))
        tws_sync_call_end = .;

  . = ALIGN(4);
        tws_func_stub_begin = .;
        KEEP(*(.tws_func_stub))
        tws_func_stub_end = .;

        *(.tws_media_sync_code)
        *(.tws_media_sync_const)

        *(.tws_data_forward_code)
        *(.tws_data_forward_const)

  . = ALIGN(4);
        tws_sync_channel_begin = .;
        KEEP(*(.tws_sync_channel.0))
        KEEP(*(.tws_sync_channel.1))
        KEEP(*(.tws_sync_channel.2))
        KEEP(*(.tws_sync_channel.3))
        KEEP(*(.tws_sync_channel.4))
        KEEP(*(.tws_sync_channel.5))
        KEEP(*(.tws_sync_channel.6))
        KEEP(*(.tws_sync_channel.7))
        KEEP(*(.tws_sync_channel.8))
        KEEP(*(.tws_sync_channel.9))
        KEEP(*(.tws_sync_channel.10))
        KEEP(*(.tws_sync_channel.11))
        KEEP(*(.tws_sync_channel.12))
        KEEP(*(.tws_sync_channel.13))
        tws_sync_channel_end = .;

        btctler_ram_code_end = .;

  . = ALIGN(4);
    } > ram0


    BTCTLER_LE_RAM_TOTAL = BTCTLER_LE_CONTROLLER_DATA_SIZE + BTCTLER_LE_CONTROLLER_BSS_SIZE;
    BTCTLER_LE_CODE_TOTAL = BTCTLER_LE_CONTROLLER_CODE_SIZE;

    BTCTLER_CL_RAM_TOTAL = BTCTLER_CL_DATA_SIZE + BTCTLER_CL_BSS_SIZE;
    BTCTLER_CL_CODE_TOTAL = BTCTLER_CL_CODE_SIZE;

    BTCTLER_COMMON_RAM_TOTAL = BTCTLER_CONTROLLER_BSS_SIZE + BTCTLER_CONTROLLER_DATA_SIZE;
    BTCTLER_COMMON_CODE_TOTAL = BTCTLER_CONTROLLER_CODE_SIZE ;

    BTCTLER_RAM_TOTAL = (btctler_data_end - btctler_data_start) + (btctler_bss_end - btctler_bss_start);
    BTCTLER_CODE_TOTAL = (btctler_code_end - btctler_code_start) + (btctler_ram_code_end - btctler_ram_code_start);
}



SECTIONS
{
    .data : ALIGN(4)
    {
        update_data_start = .;

        update_data_end = .;
  . = ALIGN(4);
    } > ram0

    .bss (NOLOAD) :ALIGN(4)
    {
        update_bss_start = .;

        *(.update_bss)

        update_bss_end = .;
  . = ALIGN(4);
    } > ram0

    .text : ALIGN(4)
    {
  update_code_start = .;

  *(.bt_updata_ram_code)
  *(.update_const)
  *(.update_code)

  update_code_end = .;
  . = ALIGN(4);
    } > code0


    UPDATE_CODE_TOTAL_SIZE = update_code_end - update_code_start;
}

SECTIONS
{
    .data : ALIGN(4)
    {
        driver_data_start = .;


        CLOCK_DATA_START = .;
        *(.clock_data)
        CLOCK_DATA_SIZE = ABSOLUTE(. - CLOCK_DATA_START);

        *(.debug_data)
        *(.power_data)

        *(.uart_data)

        driver_data_end = .;
        . = ALIGN(32);
    } > ram0

    .bss (NOLOAD) :ALIGN(4)
    {
        driver_bss_start = .;

        CLOCK_BSS_START = .;
        *(.clock_bss)
        CLOCK_BSS_SIZE = ABSOLUTE(. - CLOCK_BSS_START);

        *(.debug_bss)
        *(.power_bss)

        *(.uart_bss)

        *(.sd_var)
        driver_bss_end = .;
  . = ALIGN(4);
    } > ram0

    .text : ALIGN(4)
    {
        driver_code_start = .;

        *(.fm_code)

        CLOCK_CODE_START = .;
        *(.clock_code)
        *(.clock_const)
        CLOCK_CODE_SIZE = ABSOLUTE(. - CLOCK_CODE_START);

        *(.debug_code)
        *(.debug_const)

        *(.power_code)
        *(.power_const)

        *(.uart_code)
        *(.uart_const)

        driver_code_end = .;
  . = ALIGN(4);
    } > code0


    DRIVER_RAM_TOTAL = (driver_data_end - driver_data_start) + (driver_bss_end - driver_bss_start);
    DRIVER_CODE_TOTAL = (driver_code_end - driver_code_start);
}


text_begin = ADDR(.text);
text_size = SIZEOF(.text);
text_end = text_begin + text_size;
ASSERT((text_size % 4) == 0,"!!! text_size Not Align 4 Bytes !!!");

bss_begin = ADDR(.bss);
bss_size = SIZEOF(.bss);
bss_end = bss_begin + bss_size;
ASSERT((bss_size % 4) == 0,"!!! bss_size Not Align 4 Bytes !!!");

nvbss_begin = NVRAM_DATA_START;
nvbss_size = NVRAM_LIMIT - nvbss_begin;
ASSERT((nvbss_size % 4) == 0,"!!! nvbss_size Not Align 4 Bytes !!!");

data_addr = ADDR(.data);
data_begin = text_begin + text_size;
data_size = SIZEOF(.data);
ASSERT((data_size % 4) == 0,"!!! data_size Not Align 4 Bytes !!!");





data_code_addr = ADDR(.data_code);
data_code_begin = data_begin + data_size;
data_code_size = SIZEOF(.data_code);
ASSERT((data_code_size % 4) == 0,"!!! data_code_size Not Align 4 Bytes !!!");


aec_addr = ADDR(.overlay_aec);
aec_begin = data_code_begin + data_code_size;
aec_size = SIZEOF(.overlay_aec);

aac_addr = ADDR(.overlay_aac);
aac_begin = aec_begin + aec_size;
aac_size = SIZEOF(.overlay_aac);



bank_code_load_addr = aac_begin + aac_size;




PROVIDE(HEAP_BEGIN = _HEAP_BEGIN);
PROVIDE(HEAP_END = _HEAP_END);
_MALLOC_SIZE = _HEAP_END - _HEAP_BEGIN;
PROVIDE(MALLOC_SIZE = _HEAP_END - _HEAP_BEGIN);






report_text_beign = ADDR(.text);
report_text_size = SIZEOF(.text);
report_text_end = report_text_beign + report_text_size;

report_mmu_tlb_begin = ADDR(.mmu_tlb);
report_mmu_tlb_size = SIZEOF(.mmu_tlb);
report_mmu_tlb_end = report_mmu_tlb_begin + report_mmu_tlb_size;

report_boot_info_begin = ADDR(.boot_info);
report_boot_info_size = SIZEOF(.boot_info);
report_boot_info_end = report_boot_info_begin + report_boot_info_size;

report_irq_stack_begin = ADDR(.irq_stack);
report_irq_stack_size = SIZEOF(.irq_stack);
report_irq_stack_end = report_irq_stack_begin + report_irq_stack_size;

report_data_begin = ADDR(.data);
report_data_size = SIZEOF(.data);
report_data_end = report_data_begin + report_data_size;

report_bss_begin = ADDR(.bss);
report_bss_size = SIZEOF(.bss);
report_bss_end = report_bss_begin + report_bss_size;

report_data_code_begin = ADDR(.data_code);
report_data_code_size = SIZEOF(.data_code);
report_data_code_end = report_data_code_begin + report_data_code_size;

report_overlay_begin = __report_overlay_begin;
report_overlay_size = __report_overlay_end - __report_overlay_begin;
report_overlay_end = __report_overlay_end;

report_heap_beign = _HEAP_BEGIN;
report_heap_size = _HEAP_END - _HEAP_BEGIN;
report_heap_end = _HEAP_END;

BD19_PHY_RAM_SIZE = PHY_RAM_SIZE;
BD19_SDK_RAM_SIZE = report_mmu_tlb_size + report_boot_info_size + report_irq_stack_size + report_data_size + report_bss_size + report_overlay_size + report_data_code_size + report_heap_size;
