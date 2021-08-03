/**
 * 
 * @file led.cpp
 * 
 * @brief led management class
 * 
 * @author fede (rouxfederico@gmail.com)
 * 
 */

#include <cstddef>

#ifdef __cplusplus
extern "C" {
#endif 

#include <stdint.h>

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "bsp.h"
#include "nordic_common.h"
#include "nrf_drv_clock.h"
#include "sdk_errors.h"
#include "app_error.h"

#ifdef __cplusplus
}
#endif 

#include "led.hpp"
#include "led_task.hpp"

namespace led_task {

    TaskHandle_t  toggle_task_handle = NULL;   /**< Reference to LED0 toggling FreeRTOS task. */
    TimerHandle_t toggle_timer_handle = NULL;  /**< Reference to LED1 toggling FreeRTOS timer. */


     int32_t task_delay = 200;           /**< Task delay. Delays a LED0 task for 200 ms */
     int32_t timer_period = 1000;          /**< Timer period. LED1 timer will expire after 1000 ms */


    

    /**
     * 
     * @brief LED0 task entry function.
     *
     * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
     */

    void toggle_task_function (void * pvParameter)
    {
        UNUSED_PARAMETER(pvParameter);
        while (true)
        {
            bsp_board_led_invert(BSP_BOARD_LED_0);

            /* Delay a task for a given number of ticks */
            vTaskDelay(task_delay);

            /* Tasks must be implemented to never return... */
        }
    }

    /**@brief The function to call when the LED1 FreeRTOS timer expires.
     *
     * @param[in] pvParameter   Pointer that will be used as the parameter for the timer.
     */
    void toggle_timer_callback (void * pvParameter)
    {
        UNUSED_PARAMETER(pvParameter);
        bsp_board_led_invert(BSP_BOARD_LED_1);
    }

};