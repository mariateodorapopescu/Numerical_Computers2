vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../prb2_c1-vivado.gen/sources_1/bd/design_1/ipshared/6615/hdl/verilog/sc2.v" \
"../../../bd/design_1/ip/design_1_sc2_0_0/sim/design_1_sc2_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

