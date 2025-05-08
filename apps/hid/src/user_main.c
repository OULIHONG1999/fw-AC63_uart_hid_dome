#include "user_uart/user_uart.h"
#include "system/includes.h"

extern int ble_hid_data_send(u8 report_id, u8 *data, u16 len);

u8 tr_dbuff[6] = {
    0x4f, // right      右
    0x50, // left      左
    0x51, // down      后
    0x52, // up        前
    0x4b, // pageup    上拉
    0x4e, // pagedown  下压
    // 0x00,//          上拉下压后手松开
    // 0x00//          悬停
};

void usr_main_uart_recevie_callback(unsigned char *buf, unsigned short len)
{
    static int count = 0;
    u8 pre_key[8] = {0x00, 0x00, tr_dbuff[buf[0]], 0x00, 0x00, 0x00, 0x00, 0x00};
    u8 up_key[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
    static const u8 key_a_big_press[3] = {0x00, 0x02, 0x00};
    put_buf(buf, len);

    ble_hid_data_send(1, key_a_big_press, 3);

    switch (buf[0])
    {
        case 0: // right
        case 1: // left
        case 2: // down
        case 3: // up
        case 4: // 上拉
        case 5: // 下压
            ble_hid_data_send(1, pre_key, 8);
            ble_hid_data_send(1, up_key, 8);
            break;
        default:
            break;
    }
}

void uaer_main()
{
    // 初始化串口
    user_uart_init(115200);
    // 注册回调函数
    uart_callback_register(usr_main_uart_recevie_callback);
}