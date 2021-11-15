#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

set(VERSION_SDK_CMOCKA 1.1)
set(VERSION_SDK_CMOCKA_MINOR .5)

if (DEFINED ENV{PICO_SDK_VERSION})
    set(VERSION_SDK_PICO_SDK $ENV{PICO_SDK_VERSION})
else ()
    set(VERSION_SDK_PICO_SDK 1.3.0)
endif (DEFINED ENV{PICO_SDK_VERSION})

if (DEFINED ENV{PICO_SDK_EXTRAS_VERSION})
    set(VERSION_SDK_PICO_SDK_EXTRAS $ENV{PICO_SDK_EXTRAS_VERSION})
else ()
    set(VERSION_SDK_PICO_SDK_EXTRAS sdk-1.3.0)
endif (DEFINED ENV{PICO_SDK_EXTRAS_VERSION})

message(STATUS "SDK: CMocka version: ${VERSION_SDK_CMOCKA}${VERSION_SDK_CMOCKA_MINOR}")
message(STATUS "SDK: Raspberry Pi Pico SDK version: ${VERSION_SDK_PICO_SDK}")
message(STATUS "SDK: Raspberry Pi Pico SDK extras version: ${VERSION_SDK_PICO_SDK_EXTRAS}")
