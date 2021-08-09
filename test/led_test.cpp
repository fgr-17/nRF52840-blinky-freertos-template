/**
 * @file led_test.cpp
 * 
 * @brief led test file
 * 
 * @author fede (rouxfederico@gmail.com)
 */

#include <catch.hpp>
#include <fakeit.hpp>


#include <led.hpp>
led l1(BSP_BOARD_LED_0);
led l2(BSP_BOARD_LED_1);

#include "led_instances.hpp"
#include <led_task.cpp>

using namespace fakeit;

// TEST_CASE("led cb test", "[led]") {

//     void*param;

//     SECTION("low level toggle called") {
//         led_task::toggle_timer_callback(param);  
//     }
//     REQUIRE(1 == 1);
// }

// TEST_CASE("spy obj", "[led]") {

//     Mock<led> spy(l2);
//     Fake(Method(spy, toggle));

//     void*p;

//     led&l = spy.get();

//     led_task::toggle_timer_callback(p);

//     Verify(Method(spy, toggle)).AtLeastOnce();


// }


// TEST_CASE("led mock test", "[led]") {

//     Mock<led> mock_led;
//     Fake(Method(mock_led, toggle));
    
//     void*p;
//     led&lx = mock_led.get();

//     // i.toggle();

//     lx.toggle();

//     led_task::toggle_timer_callback(p);  

//     Verify(Method(mock_led, toggle)).AtLeastOnce();
// }


// SCENARIO("Led cb calls toggle low level function", "[led]") {
//     GIVEN("A cb function") {

//         void*param;

//         WHEN("is called once") {
//             led_task::toggle_timer_callback(param);  
//             THEN("low level fc is called") {
//                 led_task::toggle_timer_callback(param);  
//                 REQUIRE(1 == 1);
//             }
//         }
//     }
// }