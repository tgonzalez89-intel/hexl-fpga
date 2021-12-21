# Copyright (C) 2020-2021 Intel Corporation
# SPDX-License-Identifier: Apache-2.0

add_subdirectory(lib/hls)

add_custom_target(emulation
    COMMENT "Compiling for emulation"
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/compile.sh -march=emulator ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR}
)
add_dependencies(emulation hls)

add_custom_target(fpga
    COMMENT "Compiling FPGA bitstream"
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/compile.sh -board=pac_s10_usm ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR}
)
add_dependencies(fpga hls)

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/dyadic_multiply.aocx
    ${CMAKE_CURRENT_BINARY_DIR}/fwd_ntt.aocx
    ${CMAKE_CURRENT_BINARY_DIR}/inv_ntt.aocx
    ${CMAKE_CURRENT_BINARY_DIR}/hexl_fpga.aocx
    DESTINATION fpga
    PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ)
