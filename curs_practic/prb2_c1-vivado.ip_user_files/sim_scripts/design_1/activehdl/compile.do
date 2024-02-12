transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib \
"../../../../prb2_c1-vivado.gen/sources_1/bd/design_1/ipshared/6615/hdl/verilog/sc2.v" \
"../../../bd/design_1/ip/design_1_sc2_0_0/sim/design_1_sc2_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

