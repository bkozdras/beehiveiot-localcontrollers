#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

message(STATUS "Processing: ${CMAKE_CURRENT_LIST_FILE}")

set(PICO_EXTRAS_ROOT_PATH $ENV{PICO_EXTRAS_PATH})

if (NOT PICO_EXTRAS_ROOT_PATH)
    message(FATAL_ERROR
        "Not set environment variable PICO_EXTRAS_ROOT_PATH. Call cmake for build target from docker container!")
endif (NOT PICO_EXTRAS_ROOT_PATH)

set(INPUT_DIR ${PICO_EXTRAS_ROOT_PATH}/src)
set(OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/pico-extras-copied)

if (NOT EXISTS ${OUTPUT_DIR})
    message(STATUS "Copying pico-extras files from ${INPUT_DIR} to ${OUTPUT_DIR}")
    execute_process(
        COMMAND cp -r ${INPUT_DIR} ${OUTPUT_DIR}
        OUTPUT_VARIABLE COPY_RESULT)
else ()
    message(STATUS "Already copied pico-extras files from ${INPUT_DIR} to ${OUTPUT_DIR}")
endif (NOT EXISTS ${OUTPUT_DIR})
