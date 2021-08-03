/**
 * 
 * @file led.hpp
 * 
 * @brief led low level class
 * 
 * @author fede (rouxfederico@gmail.com)
 * 
 */

#ifndef __LED_HPP
#define __LED_HPP

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif 

#include "bsp.h"


#ifdef __cplusplus
}
#endif 

// todo: validate led gpio from bsp file

class led {

    led() = delete;
    
    led(int led_id): led_id(led_id) {
        if(!hw_init)
            init_board();
    }

    ~led() {}

    void toggle(void) {
        if(hw_init)
            bsp_board_led_invert(led_id);
    }

private:

    uint32_t led_id;
    static void init_board(void);
    static bool hw_init;
};

#endif // __LED_HPP