#include <catch.hpp>

#include <FreeRTOS.h>
#include <led.hpp>


TEST_CASE("led test", "[led]") {

    void*param;
    led::toggle_task_function(param);

    REQUIRE(1 == 1);
}
