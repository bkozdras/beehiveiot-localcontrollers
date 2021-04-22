#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

set(STDOUT_USB_ENABLED 0)
if (USB_SERIAL_CONSOLE)
    set(STDOUT_USB_ENABLED 1)
endif (USB_SERIAL_CONSOLE)

if (BUILD_BEECONTROLLER_FOR_TARGET)
    add_executable(beecontroller
        ${CMAKE_CURRENT_SOURCE_DIR}/main.c)
    target_link_libraries(beecontroller
        pico_stdlib)
    pico_enable_stdio_uart(beecontroller 0)
    pico_enable_stdio_usb(beecontroller ${STDOUT_USB_ENABLED})
    pico_add_extra_outputs(beecontroller)
endif (BUILD_BEECONTROLLER_FOR_TARGET)

if (BUILD_BEEROUTER_FOR_TARGET)
    add_executable(beerouter
        ${CMAKE_CURRENT_SOURCE_DIR}/main.c)
    target_link_libraries(beerouter
        pico_stdlib)
    pico_enable_stdio_uart(beerouter 0)
    pico_enable_stdio_usb(beerouter ${STDOUT_USB_ENABLED})
    pico_add_extra_outputs(beerouter)
endif (BUILD_BEEROUTER_FOR_TARGET)
