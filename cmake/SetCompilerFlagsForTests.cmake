#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

add_definitions("-fno-common")
add_definitions("-pedantic")
add_definitions("-pedantic-errors")
add_definitions("-Wall")
add_definitions("-Wconversion")
add_definitions("-Wdouble-promotion")
add_definitions("-Werror")
add_definitions("-Wextra")
add_definitions("-Wshadow")
add_definitions("-Wunused-parameter")
