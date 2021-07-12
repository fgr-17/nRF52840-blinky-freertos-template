#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include <mock-bsp.hpp>

mock_bsp mock_bsp0;

int bsp_board_led_invert(int a) {
    // mock_bsp0::bsp_board_led_invert(a);
    mock_bsp0.bsp_board_led_invert(a);
    return 0;
}