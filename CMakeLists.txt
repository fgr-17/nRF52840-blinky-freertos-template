cmake_minimum_required(VERSION 3.13)

set(This test_suite)
project(${This})

### C++ ############################
enable_language(CXX)
set(CMAKE_CXX_STANDARD 17 CACHE STRING "C++ standard required for build")
set(CMAKE_CXX_STANDARD_REQUIRED ON CACHE BOOL "is C++ stndard a requirement")
SET(CMAKE_CXX_EXTENSIONS OFF CACHE BOOL "enable/disable compiler specific extensions")
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

### External Libraries ##############
set(FindModuleDir ${PROJECT_SOURCE_DIR}/CMake CACHE STRING "path to directory containing the Find<Module>.cmake modules")
mark_as_advanced(FindModuleDir)
list(APPEND CMAKE_MODULE_PATH ${FindModuleDir})
find_package(Catch2 REQUIRED MODULE)

### Testing #########################
ENABLE_TESTING()
include(CTest)

set(SRC_DIR src)
set(TEST_DIR test)

set(INC_DIR 
    ${CMAKE_SOURCE_DIR}/${SRC_DIR}/config
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
    ${CMAKE_SOURCE_DIR}/${SRC_DIR}/led 
  )


include_directories(
  ${CMAKE_SOURCE_DIR}/${TEST_DIR}/doubles
  ${INC_DIR}
)

# processor definition
add_compile_definitions(NRF52840_XXAA)
add_compile_definitions(BOARD_PCA10056)


set(Sources
  ${CMAKE_SOURCE_DIR}/${SRC_DIR}/led/led.cpp
#   ${CMAKE_SOURCE_DIR}/${TEST_DIR}/doubles/bsp.c
)


add_library(${This} STATIC ${Sources})


### Main Body #######################
add_subdirectory(test)