#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

add_subdirectory(mock)
add_subdirectory(stub)

if (BUILD_UNIT_TESTS)
    add_subdirectory(ut)
endif (BUILD_UNIT_TESTS)
