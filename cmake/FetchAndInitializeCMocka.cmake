#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

include(FetchContent)

FetchContent_Declare(
    cmocka
    URL https://cmocka.org/files/${VERSION_SDK_CMOCKA}/cmocka-${VERSION_SDK_CMOCKA}${VERSION_SDK_CMOCKA_MINOR}.tar.xz
)

set(WITH_SHARED_LIB OFF CACHE BOOL "CMocka: Build with a shared library")
set(WITH_STATIC_LIB ON CACHE BOOL "CMocka: Build with a static library")
set(WITH_CMOCKERY_SUPPORT ON CACHE BOOL "CMocka: Install a cmockery header")
set(WITH_EXAMPLES OFF CACHE BOOL "CMocka: Build examples")
set(UNIT_TESTING OFF CACHE BOOL "CMocka: Build with unit testing")
set(PICKY_DEVELOPER OFF CACHE BOOL "CMocka: Build with picky developer flags")

FetchContent_MakeAvailable(cmocka)
