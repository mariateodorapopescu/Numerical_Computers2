//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Thu Jan  4 14:40:37 2024
//Host        : DESKTOP-91RNSVG running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (in1,
    out1);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IN1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IN1, LAYERED_METADATA undef" *) input [7:0]in1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT1, LAYERED_METADATA undef" *) output [7:0]out1;

  wire [7:0]in1_0_1;
  wire [7:0]sc1_0_out1;

  assign in1_0_1 = in1[7:0];
  assign out1[7:0] = sc1_0_out1;
  design_1_sc1_0_0 sc1_0
       (.in1(in1_0_1),
        .out1(sc1_0_out1));
endmodule
