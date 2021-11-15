#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

add_cmocka_test(TEST_UT_DUMMY_TEST
    SOURCES DummyTest.c
    COMPILE_OPTIONS -D_DEFAULT_SOURCE
    LINK_LIBRARIES
        ${CMOCKA_STATIC_LIBRARY})
