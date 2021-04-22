#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

add_executable(development-flashcontent
    ${CMAKE_CURRENT_SOURCE_DIR}/main.c)

target_link_libraries(development-flashcontent
    pico_stdlib
    hardware_flash)

pico_enable_stdio_uart(development-flashcontent 0)
pico_enable_stdio_usb(development-flashcontent 1)

pico_add_extra_outputs(development-flashcontent)
