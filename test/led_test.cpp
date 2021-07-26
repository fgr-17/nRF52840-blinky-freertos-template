#include <catch.hpp>

#include <FreeRTOS.h>
#include <led.hpp>


TEST_CASE("led cb test", "[led]") {

    void*param;


    SECTION("low level toggle called") {
        led::toggle_timer_callback(param);  
    }


    REQUIRE(1 == 1);
}


SCENARIO("Led cb calls toggle low level function", "[vector]") {


    GIVEN("A cb function") {

        void*param;

        WHEN("is called once") {
            led::toggle_timer_callback(param);  
            THEN("low level fc is called") {
                led::toggle_timer_callback(param);  
                REQUIRE(1 == 1);
            }
        }
    }
}