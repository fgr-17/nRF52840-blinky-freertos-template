cmake_minimum_required(VERSION 3.8)

set(This Example)

project(${This} C CXX)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_subdirectory(ext/googletest)

set(SRC_DIR /src)

set(INC_DIR 
    ${CMAKE_CURRENT_SOURCE_DIR}/${SRC_DIR}/config
    $ENV{NORDIC_SDK_PATH}/components
    $ENV{NORDIC_SDK_PATH}/modules/nrfx/mdk
    $ENV{NORDIC_SDK_PATH}/components/libraries/timer
    $ENV{NORDIC_SDK_PATH}/components/libraries/strerror
    $ENV{NORDIC_SDK_PATH}/components/toolchain/cmsis/include
    $ENV{NORDIC_SDK_PATH}/external/freertos/source/include
    $ENV{NORDIC_SDK_PATH}/external/freertos/config
    $ENV{NORDIC_SDK_PATH}/components/libraries/util
    $ENV{NORDIC_SDK_PATH}/components/libraries/balloc
    $ENV{NORDIC_SDK_PATH}/components/libraries/ringbuf
    $ENV{NORDIC_SDK_PATH}/modules/nrfx/hal 
    $ENV{NORDIC_SDK_PATH}/components/libraries/bsp 
    $ENV{NORDIC_SDK_PATH}/components/libraries/log 
    $ENV{NORDIC_SDK_PATH}/components/libraries/button 
    $ENV{NORDIC_SDK_PATH}/modules/nrfx 
    $ENV{NORDIC_SDK_PATH}/components/libraries/experimental_section_vars 
    $ENV{NORDIC_SDK_PATH}/integration/nrfx/legacy 
    $ENV{NORDIC_SDK_PATH}/external/freertos/portable/CMSIS/nrf52 
    $ENV{NORDIC_SDK_PATH}/integration/nrfx 
    $ENV{NORDIC_SDK_PATH}/components/drivers_nrf/nrf_soc_nosd 
    $ENV{NORDIC_SDK_PATH}/components/libraries/atomic 
    $ENV{NORDIC_SDK_PATH}/components/boards 
    $ENV{NORDIC_SDK_PATH}/components/libraries/memobj 
    $ENV{NORDIC_SDK_PATH}/external/freertos/portable/GCC/nrf52 
    $ENV{NORDIC_SDK_PATH}/modules/nrfx/drivers/include 
    $ENV{NORDIC_SDK_PATH}/external/fprintf 
    $ENV{NORDIC_SDK_PATH}/components/libraries/log/src 
    ${CMAKE_CURRENT_SOURCE_DIR}/${SRC_DIR}/led 
  )

include_directories(
  test/doubles
  ${INC_DIR}
)

# message()

# message(WARNING "----- dirs: ${CMAKE_CURRENT_SOURCE_DIR}")

# processor definition
add_compile_definitions(NRF52840_XXAA)
add_compile_definitions(BOARD_PCA10056)


set(Sources
    src/led/led.cpp
)

add_library(${This} STATIC ${Sources})

add_subdirectory(test)