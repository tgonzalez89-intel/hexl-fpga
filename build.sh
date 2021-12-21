#!/usr/bin/env bash

rm -rf build install

cmake -S . -B build \
-DCMAKE_C_COMPILER=gcc \
-DCMAKE_CXX_COMPILER=g++ \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=install \
-DENABLE_TESTS=ON \
-DENABLE_BENCHMARK=ON

cmake --build build --target emulation
cmake --build build -j
cmake --install build
