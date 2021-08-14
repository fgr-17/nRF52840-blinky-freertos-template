#!/bin/bash
cwd=$(pwd)
OUTPUT_DIR=build
SOURCE_DIR=./
TEST_DIR=./test


if [ $# == 1 ]; then
    if [ $1 == "clean" ]; then
        echo "Deleting output files ..."
        rm -rf ${OUTPUT_DIR}
        rm *.gcov
        cd ${SOURCE_DIR}
        make clean
        exit 0
    elif [ $1 == "lint" ]; then 
        echo "Running super-linter"
        
        LOG_FILE="${OUTPUT_DIR}/super-linter.log"
        sudo docker run \
            -e RUN_LOCAL=true \
            -e FILTER_REGEX_EXCLUDE="/tmp/lint/(lib|test)" \
            -e VALIDATE_BASH=true \
            -e VALIDATE_CPP=true \
            -e LOG_FILE=${LOG_FILE} \
            -e LOG_LEVEL=ERROR \
            -v $PWD:/tmp/lint \
            github/super-linter

        echo "Lint log created at ${LOG_FILE}"
        #  exit
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
# ./${OUTPUT_DIR}/test/test_suite -s --reporter compact
./${OUTPUT_DIR}/test/test_suite -s # bdd complete style
# ./${OUTPUT_DIR}/test/test_suite

echo -e '\nBuilding coverage report output'
cd ${cwd}
COVERAGE_FILE_PATH=./${OUTPUT_DIR}/gcovr_output.html
gcovr -r ./${TEST_DIR} ./${OUTPUT_DIR}/${TEST_DIR}/CMakeFiles/test_suite.dir/ --branches --html --html-details -o ${COVERAGE_FILE_PATH}
echo -e "\nCoverage report file created on ${COVERAGE_FILE_PATH}"
exit 0