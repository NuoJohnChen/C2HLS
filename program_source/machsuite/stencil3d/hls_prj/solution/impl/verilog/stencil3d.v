// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="stencil3d_stencil3d,hls_ip_2022_2_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu55c-fsvh2892-2L-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.170000,HLS_SYN_LAT=52821,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=572,HLS_SYN_LUT=1788,HLS_VERSION=2022_2_2}" *)

module stencil3d (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        C_address0,
        C_ce0,
        C_q0,
        C_address1,
        C_ce1,
        C_q1,
        orig_address0,
        orig_ce0,
        orig_q0,
        orig_address1,
        orig_ce1,
        orig_q1,
        sol_address0,
        sol_ce0,
        sol_we0,
        sol_d0,
        sol_address1,
        sol_ce1,
        sol_we1,
        sol_d1
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
output  [0:0] C_address0;
output   C_ce0;
input  [31:0] C_q0;
output  [0:0] C_address1;
output   C_ce1;
input  [31:0] C_q1;
output  [13:0] orig_address0;
output   orig_ce0;
input  [31:0] orig_q0;
output  [13:0] orig_address1;
output   orig_ce1;
input  [31:0] orig_q1;
output  [13:0] sol_address0;
output   sol_ce0;
output   sol_we0;
output  [31:0] sol_d0;
output  [13:0] sol_address1;
output   sol_ce1;
output   sol_we1;
output  [31:0] sol_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg C_ce0;
reg C_ce1;
reg[13:0] orig_address0;
reg orig_ce0;
reg[13:0] orig_address1;
reg orig_ce1;
reg[13:0] sol_address0;
reg sol_ce0;
reg sol_we0;
reg[31:0] sol_d0;
reg[13:0] sol_address1;
reg sol_ce1;
reg sol_we1;
reg[31:0] sol_d1;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state6;
reg   [31:0] C_load_reg_107;
wire    ap_CS_fsm_state7;
reg   [31:0] C_load_1_reg_112;
wire    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start;
wire    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_done;
wire    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_idle;
wire    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_ready;
wire   [13:0] grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_address0;
wire    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_ce0;
wire   [13:0] grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_address1;
wire    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_ce1;
wire   [13:0] grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_address0;
wire    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_ce0;
wire    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_we0;
wire   [31:0] grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_d0;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_done;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_idle;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_ready;
wire   [13:0] grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_address0;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_ce0;
wire   [13:0] grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_address1;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_ce1;
wire   [13:0] grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_address0;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_ce0;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_we0;
wire   [31:0] grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_d0;
wire   [13:0] grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_address1;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_ce1;
wire    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_we1;
wire   [31:0] grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_d1;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_done;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_idle;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_ready;
wire   [13:0] grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_address0;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_ce0;
wire   [13:0] grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_address1;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_ce1;
wire   [13:0] grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_address0;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_ce0;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_we0;
wire   [31:0] grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_d0;
wire   [13:0] grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_address1;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_ce1;
wire    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_we1;
wire   [31:0] grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_d1;
wire    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start;
wire    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_done;
wire    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_idle;
wire    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_ready;
wire   [13:0] grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_address0;
wire    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_ce0;
wire   [13:0] grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_address1;
wire    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_ce1;
wire   [13:0] grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_address0;
wire    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_ce0;
wire    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_we0;
wire   [31:0] grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_d0;
reg    grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start_reg;
wire    ap_CS_fsm_state5;
reg    grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start_reg;
wire    ap_CS_fsm_state8;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start_reg = 1'b0;
#0 grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start_reg = 1'b0;
#0 grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start_reg = 1'b0;
#0 grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start_reg = 1'b0;
end

stencil3d_stencil3d_Pipeline_height_bound_col_height_bound_row grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start),
    .ap_done(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_done),
    .ap_idle(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_idle),
    .ap_ready(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_ready),
    .orig_address0(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_address0),
    .orig_ce0(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_ce0),
    .orig_q0(orig_q0),
    .orig_address1(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_address1),
    .orig_ce1(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_ce1),
    .orig_q1(orig_q1),
    .sol_address0(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_address0),
    .sol_ce0(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_ce0),
    .sol_we0(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_we0),
    .sol_d0(grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_d0)
);

stencil3d_stencil3d_Pipeline_col_bound_height_col_bound_row grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start),
    .ap_done(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_done),
    .ap_idle(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_idle),
    .ap_ready(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_ready),
    .orig_address0(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_address0),
    .orig_ce0(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_ce0),
    .orig_q0(orig_q0),
    .orig_address1(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_address1),
    .orig_ce1(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_ce1),
    .orig_q1(orig_q1),
    .sol_address0(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_address0),
    .sol_ce0(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_ce0),
    .sol_we0(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_we0),
    .sol_d0(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_d0),
    .sol_address1(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_address1),
    .sol_ce1(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_ce1),
    .sol_we1(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_we1),
    .sol_d1(grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_d1)
);

stencil3d_stencil3d_Pipeline_row_bound_height_row_bound_col grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start),
    .ap_done(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_done),
    .ap_idle(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_idle),
    .ap_ready(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_ready),
    .orig_address0(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_address0),
    .orig_ce0(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_ce0),
    .orig_q0(orig_q0),
    .orig_address1(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_address1),
    .orig_ce1(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_ce1),
    .orig_q1(orig_q1),
    .sol_address0(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_address0),
    .sol_ce0(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_ce0),
    .sol_we0(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_we0),
    .sol_d0(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_d0),
    .sol_address1(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_address1),
    .sol_ce1(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_ce1),
    .sol_we1(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_we1),
    .sol_d1(grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_d1)
);

stencil3d_stencil3d_Pipeline_loop_height_loop_col_loop_row grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start),
    .ap_done(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_done),
    .ap_idle(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_idle),
    .ap_ready(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_ready),
    .orig_address0(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_address0),
    .orig_ce0(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_ce0),
    .orig_q0(orig_q0),
    .orig_address1(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_address1),
    .orig_ce1(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_ce1),
    .orig_q1(orig_q1),
    .C_load(C_load_reg_107),
    .C_load_1(C_load_1_reg_112),
    .sol_address0(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_address0),
    .sol_ce0(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_ce0),
    .sol_we0(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_we0),
    .sol_d0(grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_d0)
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
        grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start_reg <= 1'b1;
        end else if ((grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_ready == 1'b1)) begin
            grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start_reg <= 1'b1;
        end else if ((grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_ready == 1'b1)) begin
            grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start_reg <= 1'b1;
        end else if ((grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_ready == 1'b1)) begin
            grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start_reg <= 1'b1;
        end else if ((grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_ready == 1'b1)) begin
            grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        C_load_1_reg_112 <= C_q0;
        C_load_reg_107 <= C_q1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) & (grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_done == 1'b1))) begin
        C_ce0 = 1'b1;
    end else begin
        C_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) & (grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_done == 1'b1))) begin
        C_ce1 = 1'b1;
    end else begin
        C_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_done == 1'b0)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_done == 1'b1))) begin
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
    if (((1'b1 == ap_CS_fsm_state8) & (grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_done == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        orig_address0 = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_address0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        orig_address0 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        orig_address0 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        orig_address0 = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_address0;
    end else begin
        orig_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        orig_address1 = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_address1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        orig_address1 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_address1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        orig_address1 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_address1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        orig_address1 = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_address1;
    end else begin
        orig_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        orig_ce0 = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_ce0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        orig_ce0 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        orig_ce0 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        orig_ce0 = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_ce0;
    end else begin
        orig_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        orig_ce1 = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_orig_ce1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        orig_ce1 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_orig_ce1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        orig_ce1 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_orig_ce1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        orig_ce1 = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_orig_ce1;
    end else begin
        orig_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sol_address0 = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_address0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        sol_address0 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sol_address0 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        sol_address0 = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_address0;
    end else begin
        sol_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        sol_address1 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_address1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sol_address1 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_address1;
    end else begin
        sol_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sol_ce0 = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_ce0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        sol_ce0 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sol_ce0 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        sol_ce0 = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_ce0;
    end else begin
        sol_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        sol_ce1 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_ce1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sol_ce1 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_ce1;
    end else begin
        sol_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sol_d0 = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_d0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        sol_d0 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_d0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sol_d0 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_d0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        sol_d0 = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_d0;
    end else begin
        sol_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        sol_d1 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_d1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sol_d1 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_d1;
    end else begin
        sol_d1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sol_we0 = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_sol_we0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        sol_we0 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_we0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sol_we0 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_we0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        sol_we0 = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_sol_we0;
    end else begin
        sol_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        sol_we1 = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_sol_we1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sol_we1 = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_sol_we1;
    end else begin
        sol_we1 = 1'b0;
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
            if (((grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == ap_CS_fsm_state8) & (grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign C_address0 = 64'd1;

assign C_address1 = 64'd0;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start = grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_69_ap_start_reg;

assign grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start = grp_stencil3d_Pipeline_height_bound_col_height_bound_row_fu_61_ap_start_reg;

assign grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start = grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_85_ap_start_reg;

assign grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start = grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_77_ap_start_reg;

endmodule //stencil3d
