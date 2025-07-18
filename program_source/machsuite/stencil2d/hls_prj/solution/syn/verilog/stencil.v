// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="stencil_stencil,hls_ip_2022_2_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu55c-fsvh2892-2L-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.441000,HLS_SYN_LAT=39070,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=833,HLS_SYN_LUT=978,HLS_VERSION=2022_2_2}" *)

module stencil (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
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
        filter_address0,
        filter_ce0,
        filter_q0,
        filter_address1,
        filter_ce1,
        filter_q1
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [12:0] orig_address0;
output   orig_ce0;
input  [31:0] orig_q0;
output  [12:0] orig_address1;
output   orig_ce1;
input  [31:0] orig_q1;
output  [12:0] sol_address0;
output   sol_ce0;
output   sol_we0;
output  [31:0] sol_d0;
output  [3:0] filter_address0;
output   filter_ce0;
input  [31:0] filter_q0;
output  [3:0] filter_address1;
output   filter_ce1;
input  [31:0] filter_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[3:0] filter_address0;
reg filter_ce0;
reg[3:0] filter_address1;
reg filter_ce1;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] filter_load_reg_156;
wire    ap_CS_fsm_state2;
reg   [31:0] filter_load_1_reg_171;
wire    ap_CS_fsm_state3;
reg   [31:0] filter_load_2_reg_176;
reg   [31:0] filter_load_3_reg_191;
wire    ap_CS_fsm_state4;
reg   [31:0] filter_load_4_reg_196;
reg   [31:0] filter_load_5_reg_211;
wire    ap_CS_fsm_state5;
reg   [31:0] filter_load_6_reg_216;
reg   [31:0] filter_load_7_reg_231;
wire    ap_CS_fsm_state6;
reg   [31:0] filter_load_8_reg_236;
wire    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start;
wire    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_done;
wire    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_idle;
wire    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_ready;
wire   [12:0] grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_address0;
wire    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_ce0;
wire   [12:0] grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_address1;
wire    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_ce1;
wire   [12:0] grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_address0;
wire    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_ce0;
wire    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_we0;
wire   [31:0] grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_d0;
reg    grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start_reg;
wire    ap_CS_fsm_state7;
reg   [6:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'd1;
#0 grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start_reg = 1'b0;
end

stencil_stencil_Pipeline_stencil_label1_stencil_label2 grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start),
    .ap_done(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_done),
    .ap_idle(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_idle),
    .ap_ready(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_ready),
    .orig_address0(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_address0),
    .orig_ce0(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_ce0),
    .orig_q0(orig_q0),
    .orig_address1(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_address1),
    .orig_ce1(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_ce1),
    .orig_q1(orig_q1),
    .filter_load(filter_load_reg_156),
    .filter_load_1(filter_load_1_reg_171),
    .filter_load_2(filter_load_2_reg_176),
    .filter_load_3(filter_load_3_reg_191),
    .filter_load_4(filter_load_4_reg_196),
    .filter_load_5(filter_load_5_reg_211),
    .filter_load_6(filter_load_6_reg_216),
    .filter_load_7(filter_load_7_reg_231),
    .filter_load_8(filter_load_8_reg_236),
    .sol_address0(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_address0),
    .sol_ce0(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_ce0),
    .sol_we0(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_we0),
    .sol_d0(grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_d0)
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
        grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start_reg <= 1'b1;
        end else if ((grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_ready == 1'b1)) begin
            grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        filter_load_1_reg_171 <= filter_q1;
        filter_load_2_reg_176 <= filter_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        filter_load_3_reg_191 <= filter_q0;
        filter_load_4_reg_196 <= filter_q1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        filter_load_5_reg_211 <= filter_q0;
        filter_load_6_reg_216 <= filter_q1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        filter_load_7_reg_231 <= filter_q0;
        filter_load_8_reg_236 <= filter_q1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        filter_load_reg_156 <= filter_q0;
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

always @ (*) begin
    if ((grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_done == 1'b0)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & (grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_done == 1'b1))) begin
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
    if (((1'b1 == ap_CS_fsm_state7) & (grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_done == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        filter_address0 = 64'd7;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        filter_address0 = 64'd5;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        filter_address0 = 64'd3;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        filter_address0 = 64'd2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        filter_address0 = 64'd0;
    end else begin
        filter_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        filter_address1 = 64'd8;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        filter_address1 = 64'd6;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        filter_address1 = 64'd4;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        filter_address1 = 64'd1;
    end else begin
        filter_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        filter_ce0 = 1'b1;
    end else begin
        filter_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        filter_ce1 = 1'b1;
    end else begin
        filter_ce1 = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_ap_start_reg;

assign orig_address0 = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_address0;

assign orig_address1 = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_address1;

assign orig_ce0 = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_ce0;

assign orig_ce1 = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_orig_ce1;

assign sol_address0 = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_address0;

assign sol_ce0 = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_ce0;

assign sol_d0 = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_d0;

assign sol_we0 = grp_stencil_Pipeline_stencil_label1_stencil_label2_fu_132_sol_we0;

endmodule //stencil
