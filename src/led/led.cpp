/**
 * 
 * @file led.cpp
 * 
 * @brief led low level class management
 * 
 * @author fede (rouxfederico@gmail.com)
 * 
 */

#include <stdbool.h>
#include <stdint.h>


#ifdef __cplusplus
extern "C" {
#endif 

    #include "bsp.h"

#ifdef __cplusplus
}
#endif

#include "led.hpp"

bool led::hw_init = false;

void led::init_board(void) {
    bsp_board_init(BSP_INIT_LEDS);
    led::hw_init = true;
    return;
}