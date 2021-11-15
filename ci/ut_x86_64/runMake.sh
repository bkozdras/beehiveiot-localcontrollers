#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

#!/bin/bash

if ! make --version &> /dev/null
then
    echo "Make is not found!"
    exit -1
fi

THIS_DIR_NAME=${PWD##*/}
if [ "$THIS_DIR_NAME" != "build_UT_x86_64" ]
then
    echo "ERROR: CI pipeline issue! This script (runMake.sh) should be executed from build_UT_x86_64 directory!"
    echo "This directory: $THIS_DIR_NAME"
    exit -1
fi

make -j$(nproc --all)

if [ $? -ne 0 ]
then
    echo "Failure in make. Cleaning up directory..."
    rm -r -f *
    exit -1
fi

exit 0
