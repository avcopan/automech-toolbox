#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PREFIX=${SCRIPT_DIR}/../static

(
    cd ${SCRIPT_DIR}
    mkdir -p build
    cd build
    
    cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX}
    
    make VERBOSE=1
    make install

    mkdir -p ${PREFIX}/share/pac99
    cp ${SCRIPT_DIR}/share/new.groups ${PREFIX}/share/pac99/.
)
