#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

if (BUILD_BEECONTROLLER_FOR_TARGET)
    add_executable(beecontroller
        ${CMAKE_CURRENT_SOURCE_DIR}/main.c)
    target_link_libraries(beecontroller
        pico_stdlib)
    pico_enable_stdio_uart(beecontroller 0)
    pico_enable_stdio_usb(beecontroller 0)
    pico_add_extra_outputs(beecontroller)
endif (BUILD_BEECONTROLLER_FOR_TARGET)

if (BUILD_BEEROUTER_FOR_TARGET)
    add_executable(beerouter
        ${CMAKE_CURRENT_SOURCE_DIR}/main.c)
    target_link_libraries(beerouter
        pico_stdlib)
    pico_enable_stdio_uart(beerouter 0)
    pico_enable_stdio_usb(beerouter 0)
    pico_add_extra_outputs(beerouter)
endif (BUILD_BEEROUTER_FOR_TARGET)
