#!/bin/bash
cwd=$(pwd)
OUTPUT_DIR=output
SOURCE_DIR=./

if [ $# == 1 ]; then
    if [ $1 == "clean" ]; then
        echo "Deleting output files ..."
        rm -rf ${OUTPUT_DIR}
        cd ${SOURCE_DIR}
        make clean
        exit 0
    fi
fi

echo -e '\nBuilding target ...'
cd ${cwd}
cd ${SOURCE_DIR}
make

echo -e '\nBuilding testing suite ...'
cd ${cwd}
mkdir -p ${OUTPUT_DIR}
cd ${OUTPUT_DIR}
cmake ../
make

echo -e '\nRunning tests'
cd ${cwd}
./${OUTPUT_DIR}/test/ExampleTests


exit 0