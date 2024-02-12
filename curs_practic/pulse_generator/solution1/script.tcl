############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project pulse_generator
set_top pulse_generator
add_files pulse_generator/pulse_generator.cpp
add_files pulse_generator/pulse_generator.h
add_files -tb pulse_generator/pulse_generator-tb.cpp
add_files -tb pulse_generator/pulse_generator-tb.h
open_solution "solution1" -flow_target vivado
set_part {xc7a100tcsg324-1}
create_clock -period 10 -name default
#source "./pulse_generator/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
