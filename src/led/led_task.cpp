/**
 * @file led.cpp
 * 
 * @brief led management class
 * 
 * @author fede (rouxfederico@gmail.com)
 */

#include <cstddef>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif 


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
#include "led_instances.hpp"
#include "led_task.hpp"


namespace led_task {

    TaskHandle_t  toggle_task_handle = NULL;   /**< Reference to LED0 toggling FreeRTOS task. */
    TimerHandle_t toggle_timer_handle = NULL;  /**< Reference to LED1 toggling FreeRTOS timer. */

    int32_t task_delay = 100;               /**< Task delay. Delays a LED0 task for 200 ms */
    int32_t timer_period = 1000;            /**< Timer period. LED1 timer will expire after 1000 ms */

    /**
     * @brief toggle leds tasks
     *
     * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
     */

    void toggle_task_function (void * pvParameter)
    {
        led*l = (led*) pvParameter;

        while (true)
        {
            l->toggle();
            vTaskDelay(task_delay);
        }
    }

    /**
     * @brief The function to call when the LED1 FreeRTOS timer expires.
     *
     * @param[in] pvParameter   Pointer that will be used as the parameter for the timer.
     */
    void toggle_timer_callback (void * pvParameter)
    {
        UNUSED_PARAMETER(pvParameter);
        l2.toggle();
    }

    /**
     * @brief hardware init
     *
     * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
     */
    void init(void) {
        
        /* todo: move this call one stage down ----- */
        bsp_board_init(BSP_INIT_LEDS);

        /* Create task for LED0 blinking with priority set to 2 */
        xTaskCreate(toggle_task_function, "LED0", configMINIMAL_STACK_SIZE + 200, &l1, 2, &toggle_task_handle);

        /* Start timer for LED1 blinking */
        toggle_timer_handle = xTimerCreate( "LED1", timer_period, pdTRUE, NULL, toggle_timer_callback);

        xTimerStart(toggle_timer_handle, 0);
    }

};