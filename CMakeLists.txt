#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

execute_process(COMMAND uname -m
    COMMAND tr -d '\n'
    OUTPUT_VARIABLE THIS_ARCH)

include(cmake/ParseOptions.cmake)
include(cmake/SdkVersion.cmake)
if (BUILD_FOR_TARGET OR BUILD_DEVELOPMENT_BINARIES_FOR_TARGET)
    set(PICO_SDK_FETCH_FROM_GIT ON)
    include(cmake/FetchAndInitializePicoSdk.cmake)
    set(PICO_EXTRAS_FETCH_FROM_GIT ON)
    include(cmake/FetchAndInitializePicoSdkExtras.cmake)
    include(cmake/CopyPicoSdk.cmake)
    include(cmake/CopyPicoExtras.cmake)
endif (BUILD_FOR_TARGET OR BUILD_DEVELOPMENT_BINARIES_FOR_TARGET)

set(PROJECT_NAME BeehiveIoT-LocalControllers)

project(${PROJECT_NAME} VERSION 1.0)

message(STATUS "Project name: ${PROJECT_NAME}")
message(STATUS "Target architecture: ARM32")
message(STATUS "This architecture \(used for tests only\): ${THIS_ARCH}")

enable_language(C)

set(CMAKE_C_STANDARD 11)

if (BUILD_FOR_TARGET OR BUILD_DEVELOPMENT_BINARIES_FOR_TARGET)
    message(STATUS "Initializing pico-sdk...")
    pico_sdk_init()
endif (BUILD_FOR_TARGET OR BUILD_DEVELOPMENT_BINARIES_FOR_TARGET)

if (BUILD_MODULE_TESTS OR BUILD_UNIT_TESTS)
    include(cmake/FetchAndInitializeCMocka.cmake)
    include(cmake/SetCompilerFlagsForTests.cmake)
endif (BUILD_MODULE_TESTS OR BUILD_UNIT_TESTS)

include_directories(include)

if (BUILD_FOR_TARGET)
    add_subdirectory(app)
endif (BUILD_FOR_TARGET)

if (BUILD_DEVELOPMENT_BINARIES_FOR_TARGET)
    add_subdirectory(development)
endif (BUILD_DEVELOPMENT_BINARIES_FOR_TARGET)

add_subdirectory(src)

if (BUILD_MODULE_TESTS OR BUILD_UNIT_TESTS)
    enable_testing()
    add_subdirectory(test)
endif (BUILD_MODULE_TESTS OR BUILD_UNIT_TESTS)
