#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

add_executable(development-helloworld
    main.c
)

target_link_libraries(development-helloworld
    pico_stdlib)

pico_enable_stdio_usb(development-helloworld 1)
pico_enable_stdio_uart(development-helloworld 0)

pico_add_extra_outputs(development-helloworld)
