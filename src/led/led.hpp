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

public:

    led() = delete;
    
    led(int led_id): led_id(led_id) {}
    ~led() {}

    void toggle(void) {
        bsp_board_led_invert(led_id);
    }
    
private:

    uint32_t led_id;
};

#endif // __LED_HPP