set(TEST_NAME basic_test)

# include_directories(
#   ${CMAKE_SOURCE_DIR}/${TEST_DIR}/doubles
#   )
  
  
  # target_sources(${TEST_NAME}
  #   PRIVATE
  #     main_test.cpp
  #     basic.cpp
  #     doubles/bsp.cpp
  #     doubles/FreeRTOS.c
  #     ${CMAKE_SOURCE_DIR}/${SRC_DIR}/led/led.cpp
  #   )
  
  set(Sources 
    main_test.cpp
    basic_test.cpp
    led_test.cpp
    doubles/bsp.c
    doubles/FreeRTOS.c
  )
  
# get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
# foreach(dir ${dirs})
#   message(STATUS "${dir}")
# endforeach()


add_executable(${TEST_NAME} ${Sources})

target_link_libraries(${TEST_NAME}
  PUBLIC
  # $<TARGET_OBJECTS:helloworld>
  ::Catch2
  test_suite
  )
  


# add_test(
# NAME
#   "basic_test"
# COMMAND
#   ${TEST_NAME}
# )