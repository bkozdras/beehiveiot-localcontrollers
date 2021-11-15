# Beehive-IoT local controllers

[![License](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)
[![LibraryLanguage](https://img.shields.io/badge/Language-C-lightgrey)](LIBRARYLANGUAGE)
[![TestFramework](https://img.shields.io/badge/TestFramework-CMocka-lightgrey)](TESTFRAMEWORK)

[![OS](https://img.shields.io/badge/OS-Linux-lightgrey)](OS)
[![Distribution](https://img.shields.io/badge/Distribution-Ubuntu-lightgrey)](DISTRIBUTION)
[![BuildEnvironment](https://img.shields.io/badge/BuildEnvironment-Docker-lightgrey)](SOURCELANGUAGE)

The repo contains two applications:
- BeeRouter,
- BeeController.

Both applications are deployed on Raspberry Pi Pico RP2040 ARM-Cortex M0+ MCU.
Connection between BeeMaster and BeeRouter: Zigbee based on Xbee modules.
Connection between BeeRouter and BeeControllers: WiFi based on ESP-01s modules.
BeeRouter is local master for connected BeeControllers and is responsible for routing
data between BeeMaster and controllers with the use of pushing data received from Xbee
to ESP-01s network (and vice versa).
BeeController is responsible for collecting measurements from local BeeHive.
One Beehive - one BeeController.

BeeMaster repo: TODO

# CI Dashboard

[![CIStatus](https://img.shields.io/github/workflow/status/bkozdras/beehiveiot-localcontrollers/beehiveiot-localcontrollers-ci?label=CI%20Status)](CISTATUS)

[![JobBuildDockerImage](https://img.shields.io/badge/Job-Build--Docker--Image-lightgrey)](JOBBUILDOCKERIMAGE)
![badgeBuildDockerImage](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bkozdras/4bdea638e561aa2bdf13fad3c052a8e7/raw/badgeBuildDockerImage.json?service=github)

[![JobUTX8664](https://img.shields.io/badge/Job-UT--x86--64-lightgrey)](JOBUTX8664)

![badgeUTX8664CMake](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bkozdras/4bdea638e561aa2bdf13fad3c052a8e7/raw/badgeUTX8664Cmake.json?service=github)
![badgeUTX8664Build](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bkozdras/4bdea638e561aa2bdf13fad3c052a8e7/raw/badgeUTX8664Build.json?service=github)
![badgeUTX8664CTest](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bkozdras/4bdea638e561aa2bdf13fad3c052a8e7/raw/badgeUTX8664CTest.json?service=github)

# Preparing of local build environment

All build commands should be executed from docker image attached to this repo as submodule: dockerimage.
It is assumed that Unix OS is used by user.

Build docker image named: nemuuser/avr-build-env with tag: latest:
```sh
bash dockerimage/buildImage.sh
```
Run and connect to the command interface:
```sh
bash dockerimage/runImage.sh
```

All next steps should be executed from running docker image.

TODO next steps
