#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Purpose: To build and run unit tests for BeeHive local controllers project.      #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

#!/bin/bash

if [[ "$RASPBERRY_PI_PICO_BUILD_ENVIRONMENT_CONTAINER" != "1" ]]
then
    echo "This script should be called from docker container - see dockerimage submodule!"
    exit -1
fi

if ! cmake --version &> /dev/null
then
    echo "CMake is not found!"
    exit -1
fi

if ! make --version &> /dev/null
then
    echo "Make is not found!"
    exit -1
fi

THIS_DIR=$(pwd)
EXPECTED_DIR=$(git rev-parse --show-toplevel)

if [[ "$THIS_DIR" != "$EXPECTED_DIR" ]]
then
    echo "This script should be called from git repo root directory!"
    exit -1
fi

mkdir -p build
cd build

THIS_ARCH=$(uname -m | tr -d '\n')
BUILD_DIR=ut_$THIS_ARCH

mkdir -p $BUILD_DIR
cd $BUILD_DIR

cmake \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_C_COMPILER=gcc-$GCC_VERSION \
    -DBEEHIVEIOT_LC_BUILD_UNIT_TESTS=ON ../.. \
    && make -j$(nproc --all) \
    && ctest -j$(nproc --all) --output-on-failure --timeout 5

exit 0
