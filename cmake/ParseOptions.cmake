#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

option(BEEHIVEIOT_LC_BUILD_FOR_TARGET OFF, "Build binary for ARM32 target")
option(BEEHIVEIOT_LC_BUILD_DEVELOPMENT_BINARIES_FOR_TARGET OFF, "Build development binaries for ARM32 target")

set(BUILD_FOR_TARGET OFF)
if (BEEHIVEIOT_LC_BUILD_FOR_TARGET)
    set(BUILD_FOR_TARGET ON)
endif (BEEHIVEIOT_LC_BUILD_FOR_TARGET)

set(BUILD_DEVELOPMENT_BINARIES_FOR_TARGET OFF)
if (BEEHIVEIOT_LC_BUILD_DEVELOPMENT_BINARIES_FOR_TARGET)
    set(BUILD_DEVELOPMENT_BINARIES_FOR_TARGET ON)
endif (BEEHIVEIOT_LC_BUILD_DEVELOPMENT_BINARIES_FOR_TARGET)

message(STATUS "BUILD_FOR_TARGET: " ${BUILD_FOR_TARGET})
message(STATUS "BUILD_DEVELOPMENT_BINARIES_FOR_TARGET: " ${BUILD_DEVELOPMENT_BINARIES_FOR_TARGET})
