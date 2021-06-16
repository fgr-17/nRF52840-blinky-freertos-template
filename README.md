# blinky_freertos

Firmware repo for nRF52840-DK using freeRTOS and arm gcc builder, based on the Nordic example.

### author: **fede** *(rouxfederico@gmail.com)*

## Installation

The project has been developed in Ubuntu 20.02. It should run on any OS, but this was not tested.
This project uses the gcc arm builder and is not bounded to any IDE. It has been developed under VSC but any code editor can be used.

After downloading the repository, download the submodules:

```git
git submodule update --init
```

The following tools are necessary:

1. [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads):

    The project has been developed under the 10.2 2020 q4 version, but any version should be used. 
    Download and install the complete toolchain. Take note of the installation directory (on Linux it can be something like: usr/local/gcc-arm-none-eabi-10-2020-q4-major/bin/ - on macOS, something like: /Applications/ARM/bin). The installation process should add the installation path/bin to the system PATH. If not, add it manually. This can be checked typing in a terminal: **arm-none-eabi-gcc --version**. The following output should be shown:

        arm-none-eabi-gcc (GNU Arm Embedded Toolchain 10-2020-q4-major) 10.2.1 20201103 (release)
        Copyright (C) 2020 Free Software Foundation, Inc.
        This is free software; see the source for copying conditions.  There is NO
        warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


2. [nRF Command Line Tools](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Command-Line-Tools):

    This tools must be installed and added to the system PATH. Check the correct installation typing on a terminal: **nrfjprog -v**. You should be something similar:

        nrfjprog version: 10.12.1 
        JLinkARM.dll version: 6.98

3. [nRF5 SDK](https://www.nordicsemi.com/Software-and-tools/Software/nRF5-SDK):

    Download and unzip. Take note of the destination folder.
    The SDK must point to the compiler folder. To do this, it's necessary to modify the file: **/nRF5_SDK_17.0.0_9d13099/components/toolchain/gcc/Makefile.posix** with the current path and version (don't use the ~ sign on the path, it doesn't work :( ). For example:

        GNU_INSTALL_ROOT ?= /usr/local/gcc-arm-none-eabi-10-2020-q4-major/bin/
        GNU_VERSION ?= 10.2.0
        GNU_PREFIX ?= arm-none-eabi

4. Make:

    On Linux it's usually installed by default. But if not, it can be installed typing:

        sudo apt-get install make

5. Java:

    Java is used to generate the sdk_config.h file using the sdk_config target on the Makefile. If this file is not modified, then Java is not necessary at all. It can be installed typing:

        sudo apt install default-jre

## Usage

Before compiling the project, is necessary to set the environment variable NORDIC_SDK_PATH to the installation path of the SDK. On linux, it can be added on the ~/.bashrc file. On macOS, .zshrc and .bashrc. On Windows, it can be done searching for "Environment Variables" on "Start".

After that, the makefile has the following targets:

- make: compile the whole project.

- make clean: cleans all the compilation files.

- make flash: download the binary to the target

- make erase: erase the target flash

- make sdk_config: opens a GUI to generate ./src/config/sdk_config.h

## Documentation 

To generate all the docs, it's necessary to install Doxygen and GraphViz

	sudo apt-get install doxygen-gui
	sudo apt-get install graphviz

 ## License

 GNU General Public License v3.0