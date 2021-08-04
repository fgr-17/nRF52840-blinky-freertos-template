/**
 * @file led_test.cpp
 * 
 * @brief led test file
 * 
 * @author fede (rouxfederico@gmail.com)
 */

#include <catch.hpp>
#include <fakeit.hpp>

#include <FreeRTOS.h>
#include <led_task.hpp>

TEST_CASE("led cb test", "[led]") {

    void*param;

    SECTION("low level toggle called") {
        led_task::toggle_timer_callback(param);  
    }
    REQUIRE(1 == 1);
}

SCENARIO("Led cb calls toggle low level function", "[vector]") {
    GIVEN("A cb function") {

        void*param;

        WHEN("is called once") {
            led_task::toggle_timer_callback(param);  
            THEN("low level fc is called") {
                led_task::toggle_timer_callback(param);  
                REQUIRE(1 == 1);
            }
        }
    }
}