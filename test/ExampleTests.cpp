#include <gtest/gtest.h>
#include <gmock/gmock.h>

// #include <fff.h>

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "bsp.h"
#include "nordic_common.h"
#include "nrf_drv_clock.h"
#include "sdk_errors.h"
#include "app_error.h"

#include <led.hpp>

#include <mock-bsp.h>


TEST(led_test, true_test) {
    EXPECT_TRUE(true);
}

TEST(led_test, timer_cb_test) {
    void*param;
    led::toggle_timer_callback(param);
    EXPECT_TRUE(true);
}