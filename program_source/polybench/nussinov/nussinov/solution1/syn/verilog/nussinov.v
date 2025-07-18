// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="nussinov_nussinov,hls_ip_2022_2_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu55c-fsvh2892-2L-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.611000,HLS_SYN_LAT=174781,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=483,HLS_SYN_LUT=1042,HLS_VERSION=2022_2_2}" *)

module nussinov (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        seq_address0,
        seq_ce0,
        seq_q0,
        table_r_address0,
        table_r_ce0,
        table_r_we0,
        table_r_d0,
        table_r_q0,
        table_r_address1,
        table_r_ce1,
        table_r_q1
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [5:0] seq_address0;
output   seq_ce0;
input  [7:0] seq_q0;
output  [11:0] table_r_address0;
output   table_r_ce0;
output   table_r_we0;
output  [31:0] table_r_d0;
input  [31:0] table_r_q0;
output  [11:0] table_r_address1;
output   table_r_ce1;
input  [31:0] table_r_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[5:0] seq_address0;
reg seq_ce0;
reg[11:0] table_r_address0;
reg table_r_ce0;
reg table_r_we0;
reg[11:0] table_r_address1;
reg table_r_ce1;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [5:0] trunc_ln9_fu_183_p1;
reg   [5:0] trunc_ln9_reg_474;
wire    ap_CS_fsm_state2;
wire   [0:0] tmp_4_fu_187_p3;
wire   [11:0] sub_ln16_fu_218_p2;
reg   [11:0] sub_ln16_reg_488;
wire    ap_CS_fsm_state3;
wire   [11:0] zext_ln9_1_fu_224_p1;
wire   [11:0] zext_ln9_2_fu_228_p1;
reg   [11:0] zext_ln9_2_reg_500;
wire   [11:0] sub_ln20_fu_256_p2;
reg   [11:0] sub_ln20_reg_505;
wire  signed [8:0] sext_ln11_fu_262_p1;
reg  signed [8:0] sext_ln11_reg_511;
wire   [11:0] add_ln16_fu_277_p2;
reg   [11:0] add_ln16_reg_519;
wire    ap_CS_fsm_state4;
wire   [0:0] icmp_ln11_fu_266_p2;
wire   [11:0] add_ln14_fu_287_p2;
reg   [11:0] add_ln14_reg_529;
wire   [0:0] icmp_ln25_fu_303_p2;
reg   [0:0] icmp_ln25_reg_539;
wire   [11:0] add_ln11_1_fu_308_p2;
reg   [11:0] add_ln11_1_reg_549;
wire    ap_CS_fsm_state5;
wire   [31:0] select_ln16_fu_366_p3;
reg   [31:0] select_ln16_reg_564;
wire   [0:0] icmp_ln29_fu_383_p2;
reg   [0:0] icmp_ln29_reg_570;
wire   [31:0] select_ln20_fu_400_p3;
reg   [31:0] select_ln20_reg_575;
wire    ap_CS_fsm_state6;
reg   [31:0] table_r_load_3_reg_583;
reg   [5:0] indvars_iv_load_2_reg_590;
wire    ap_CS_fsm_state7;
wire   [31:0] select_ln25_fu_449_p3;
reg   [31:0] select_ln25_reg_595;
wire    grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start;
wire    grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_done;
wire    grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_idle;
wire    grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_ready;
wire   [11:0] grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_address0;
wire    grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_ce0;
wire    grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_we0;
wire   [31:0] grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_d0;
wire   [11:0] grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_address1;
wire    grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_ce1;
reg   [11:0] j_reg_144;
wire    ap_CS_fsm_state8;
reg    grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start_reg;
wire   [63:0] zext_ln9_fu_195_p1;
wire   [63:0] zext_ln16_1_fu_282_p1;
wire   [63:0] zext_ln16_2_fu_298_p1;
wire   [63:0] zext_ln11_fu_272_p1;
wire   [63:0] zext_ln20_1_fu_340_p1;
wire   [63:0] zext_ln28_fu_349_p1;
reg   [5:0] indvars_iv_fu_74;
wire   [5:0] add_ln9_1_fu_319_p2;
reg   [6:0] i_fu_78;
wire   [6:0] add_ln9_fu_314_p2;
wire   [8:0] tmp_1_fu_207_p3;
wire   [11:0] tmp_fu_200_p3;
wire   [11:0] zext_ln16_fu_214_p1;
wire   [5:0] add_ln11_fu_231_p2;
wire   [7:0] tmp_3_fu_244_p3;
wire   [11:0] tmp_2_fu_236_p3;
wire   [11:0] zext_ln20_fu_252_p1;
wire   [11:0] add_ln16_1_fu_293_p2;
wire   [11:0] add_ln20_fu_335_p2;
wire   [11:0] add_ln28_1_fu_345_p2;
wire   [0:0] icmp_ln16_fu_354_p2;
wire   [0:0] xor_ln16_fu_360_p2;
wire  signed [8:0] sext_ln29_fu_374_p1;
wire   [8:0] add_ln29_fu_378_p2;
wire   [0:0] icmp_ln20_fu_389_p2;
wire   [0:0] xor_ln20_fu_394_p2;
wire   [31:0] zext_ln29_fu_407_p1;
wire   [31:0] add_ln28_fu_410_p2;
wire   [0:0] icmp_ln27_fu_415_p2;
wire   [0:0] xor_ln27_fu_420_p2;
wire   [0:0] icmp_ln35_fu_433_p2;
wire   [0:0] xor_ln35_fu_437_p2;
wire   [31:0] select_ln27_fu_426_p3;
wire   [31:0] select_ln35_fu_443_p3;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start_reg = 1'b0;
end

nussinov_nussinov_Pipeline_VITIS_LOOP_40_3 grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start),
    .ap_done(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_done),
    .ap_idle(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_idle),
    .ap_ready(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_ready),
    .select_ln25(select_ln25_reg_595),
    .zext_ln9(indvars_iv_load_2_reg_590),
    .table_r_address0(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_address0),
    .table_r_ce0(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_ce0),
    .table_r_we0(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_we0),
    .table_r_d0(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_d0),
    .table_r_q0(table_r_q0),
    .table_r_address1(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_address1),
    .table_r_ce1(grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_ce1),
    .table_r_q1(table_r_q1),
    .add_ln16(add_ln16_reg_519),
    .sub_ln16(sub_ln16_reg_488),
    .zext_ln11(j_reg_144)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start_reg <= 1'b1;
        end else if ((grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_ready == 1'b1)) begin
            grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_fu_78 <= 7'd59;
    end else if (((icmp_ln11_fu_266_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        i_fu_78 <= add_ln9_fu_314_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        indvars_iv_fu_74 <= 6'd60;
    end else if (((icmp_ln11_fu_266_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        indvars_iv_fu_74 <= add_ln9_1_fu_319_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state8) & (grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_done == 1'b1))) begin
        j_reg_144 <= add_ln11_1_reg_549;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        j_reg_144 <= zext_ln9_1_fu_224_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln11_fu_266_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        add_ln11_1_reg_549 <= add_ln11_1_fu_308_p2;
        add_ln14_reg_529 <= add_ln14_fu_287_p2;
        add_ln16_reg_519 <= add_ln16_fu_277_p2;
        icmp_ln25_reg_539 <= icmp_ln25_fu_303_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln25_reg_539 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        icmp_ln29_reg_570 <= icmp_ln29_fu_383_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        indvars_iv_load_2_reg_590 <= indvars_iv_fu_74;
        select_ln25_reg_595 <= select_ln25_fu_449_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        select_ln16_reg_564 <= select_ln16_fu_366_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        select_ln20_reg_575 <= select_ln20_fu_400_p3;
        table_r_load_3_reg_583 <= table_r_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        sext_ln11_reg_511 <= sext_ln11_fu_262_p1;
        sub_ln16_reg_488[11 : 2] <= sub_ln16_fu_218_p2[11 : 2];
        sub_ln20_reg_505[11 : 2] <= sub_ln20_fu_256_p2[11 : 2];
        zext_ln9_2_reg_500[6 : 0] <= zext_ln9_2_fu_228_p1[6 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        trunc_ln9_reg_474 <= trunc_ln9_fu_183_p1;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_done == 1'b0)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_fu_187_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_fu_187_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        seq_address0 = zext_ln11_fu_272_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        seq_address0 = zext_ln9_fu_195_p1;
    end else begin
        seq_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state2))) begin
        seq_ce0 = 1'b1;
    end else begin
        seq_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        table_r_address0 = zext_ln28_fu_349_p1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        table_r_address0 = zext_ln16_2_fu_298_p1;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        table_r_address0 = grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_address0;
    end else begin
        table_r_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        table_r_address1 = zext_ln20_1_fu_340_p1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        table_r_address1 = zext_ln16_1_fu_282_p1;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        table_r_address1 = grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_address1;
    end else begin
        table_r_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
        table_r_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        table_r_ce0 = grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_ce0;
    end else begin
        table_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
        table_r_ce1 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        table_r_ce1 = grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_ce1;
    end else begin
        table_r_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        table_r_we0 = grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_we0;
    end else begin
        table_r_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_4_fu_187_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((icmp_ln11_fu_266_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == ap_CS_fsm_state8) & (grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln11_1_fu_308_p2 = (j_reg_144 + 12'd1);

assign add_ln11_fu_231_p2 = (trunc_ln9_reg_474 + 6'd1);

assign add_ln14_fu_287_p2 = ($signed(j_reg_144) + $signed(12'd4095));

assign add_ln16_1_fu_293_p2 = (sub_ln16_reg_488 + add_ln14_fu_287_p2);

assign add_ln16_fu_277_p2 = (sub_ln16_reg_488 + j_reg_144);

assign add_ln20_fu_335_p2 = (sub_ln20_reg_505 + j_reg_144);

assign add_ln28_1_fu_345_p2 = (sub_ln20_reg_505 + add_ln14_reg_529);

assign add_ln28_fu_410_p2 = (table_r_load_3_reg_583 + zext_ln29_fu_407_p1);

assign add_ln29_fu_378_p2 = ($signed(sext_ln29_fu_374_p1) + $signed(sext_ln11_reg_511));

assign add_ln9_1_fu_319_p2 = ($signed(indvars_iv_fu_74) + $signed(6'd63));

assign add_ln9_fu_314_p2 = ($signed(i_fu_78) + $signed(7'd127));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start = grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_ap_start_reg;

assign icmp_ln11_fu_266_p2 = ((j_reg_144 == 12'd60) ? 1'b1 : 1'b0);

assign icmp_ln16_fu_354_p2 = (($signed(table_r_q1) < $signed(table_r_q0)) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_389_p2 = (($signed(select_ln16_reg_564) < $signed(table_r_q1)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_303_p2 = ((zext_ln9_2_reg_500 < add_ln14_fu_287_p2) ? 1'b1 : 1'b0);

assign icmp_ln27_fu_415_p2 = (($signed(select_ln20_reg_575) < $signed(add_ln28_fu_410_p2)) ? 1'b1 : 1'b0);

assign icmp_ln29_fu_383_p2 = ((add_ln29_fu_378_p2 == 9'd3) ? 1'b1 : 1'b0);

assign icmp_ln35_fu_433_p2 = (($signed(select_ln20_reg_575) < $signed(table_r_load_3_reg_583)) ? 1'b1 : 1'b0);

assign select_ln16_fu_366_p3 = ((xor_ln16_fu_360_p2[0:0] == 1'b1) ? table_r_q1 : table_r_q0);

assign select_ln20_fu_400_p3 = ((xor_ln20_fu_394_p2[0:0] == 1'b1) ? select_ln16_reg_564 : table_r_q1);

assign select_ln25_fu_449_p3 = ((icmp_ln25_reg_539[0:0] == 1'b1) ? select_ln27_fu_426_p3 : select_ln35_fu_443_p3);

assign select_ln27_fu_426_p3 = ((xor_ln27_fu_420_p2[0:0] == 1'b1) ? select_ln20_reg_575 : add_ln28_fu_410_p2);

assign select_ln35_fu_443_p3 = ((xor_ln35_fu_437_p2[0:0] == 1'b1) ? select_ln20_reg_575 : table_r_load_3_reg_583);

assign sext_ln11_fu_262_p1 = $signed(seq_q0);

assign sext_ln29_fu_374_p1 = $signed(seq_q0);

assign sub_ln16_fu_218_p2 = (tmp_fu_200_p3 - zext_ln16_fu_214_p1);

assign sub_ln20_fu_256_p2 = (tmp_2_fu_236_p3 - zext_ln20_fu_252_p1);

assign table_r_d0 = grp_nussinov_Pipeline_VITIS_LOOP_40_3_fu_154_table_r_d0;

assign tmp_1_fu_207_p3 = {{i_fu_78}, {2'd0}};

assign tmp_2_fu_236_p3 = {{add_ln11_fu_231_p2}, {6'd0}};

assign tmp_3_fu_244_p3 = {{add_ln11_fu_231_p2}, {2'd0}};

assign tmp_4_fu_187_p3 = i_fu_78[32'd6];

assign tmp_fu_200_p3 = {{trunc_ln9_reg_474}, {6'd0}};

assign trunc_ln9_fu_183_p1 = i_fu_78[5:0];

assign xor_ln16_fu_360_p2 = (icmp_ln16_fu_354_p2 ^ 1'd1);

assign xor_ln20_fu_394_p2 = (icmp_ln20_fu_389_p2 ^ 1'd1);

assign xor_ln27_fu_420_p2 = (icmp_ln27_fu_415_p2 ^ 1'd1);

assign xor_ln35_fu_437_p2 = (icmp_ln35_fu_433_p2 ^ 1'd1);

assign zext_ln11_fu_272_p1 = j_reg_144;

assign zext_ln16_1_fu_282_p1 = add_ln16_fu_277_p2;

assign zext_ln16_2_fu_298_p1 = add_ln16_1_fu_293_p2;

assign zext_ln16_fu_214_p1 = tmp_1_fu_207_p3;

assign zext_ln20_1_fu_340_p1 = add_ln20_fu_335_p2;

assign zext_ln20_fu_252_p1 = tmp_3_fu_244_p3;

assign zext_ln28_fu_349_p1 = add_ln28_1_fu_345_p2;

assign zext_ln29_fu_407_p1 = icmp_ln29_reg_570;

assign zext_ln9_1_fu_224_p1 = indvars_iv_fu_74;

assign zext_ln9_2_fu_228_p1 = i_fu_78;

assign zext_ln9_fu_195_p1 = i_fu_78;

always @ (posedge ap_clk) begin
    sub_ln16_reg_488[1:0] <= 2'b00;
    zext_ln9_2_reg_500[11:7] <= 5'b00000;
    sub_ln20_reg_505[1:0] <= 2'b00;
end

endmodule //nussinov
