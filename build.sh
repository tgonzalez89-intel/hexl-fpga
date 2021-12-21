#!/usr/bin/env bash

rm -rf build install

cmake -S . -B build \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=install \
-DCMAKE_CXX_COMPILER=g++ \
-DCMAKE_C_COMPILER=gcc

cmake --build build -j
cmake --build build -j --target emulation
cmake --install build
