// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="insert_sort_insert_sort,hls_ip_2022_2_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu55c-fsvh2892-2L-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.575000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=269,HLS_SYN_LUT=366,HLS_VERSION=2022_2_2}" *)

module insert_sort (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        A_address0,
        A_ce0,
        A_we0,
        A_d0,
        A_q0
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] A_address0;
output   A_ce0;
output   A_we0;
output  [31:0] A_d0;
input  [31:0] A_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[3:0] A_address0;
reg A_ce0;
reg A_we0;
reg[31:0] A_d0;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] trunc_ln4_fu_99_p1;
reg   [3:0] trunc_ln4_reg_156;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln4_fu_88_p2;
reg   [31:0] A_load_reg_166;
wire    ap_CS_fsm_state3;
wire   [30:0] trunc_ln5_fu_114_p1;
reg   [30:0] trunc_ln5_reg_172;
wire   [0:0] icmp_ln7_fu_122_p2;
reg   [0:0] icmp_ln7_reg_177;
wire   [31:0] item_fu_128_p1;
reg   [31:0] item_reg_182;
wire    ap_CS_fsm_state4;
wire    grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start;
wire    grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_done;
wire    grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_idle;
wire    grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_ready;
wire   [3:0] grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_address0;
wire    grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_ce0;
wire    grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_we0;
wire   [31:0] grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_d0;
wire   [3:0] grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_j_1_out;
wire    grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_j_1_out_ap_vld;
reg    grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start_reg;
wire    ap_CS_fsm_state5;
reg   [3:0] j_1_loc_fu_44;
wire   [63:0] zext_ln4_fu_94_p1;
wire   [63:0] zext_ln11_fu_135_p1;
wire    ap_CS_fsm_state6;
reg   [4:0] j_fu_40;
wire   [4:0] add_ln4_fu_103_p2;
wire   [22:0] trunc_ln7_fu_118_p1;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start_reg = 1'b0;
end

insert_sort_insert_sort_Pipeline_VITIS_LOOP_7_2 grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start),
    .ap_done(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_done),
    .ap_idle(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_idle),
    .ap_ready(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_ready),
    .zext_ln4_1(trunc_ln4_reg_156),
    .A_address0(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_address0),
    .A_ce0(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_ce0),
    .A_we0(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_we0),
    .A_d0(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_d0),
    .A_q0(A_q0),
    .A_load(trunc_ln5_reg_172),
    .icmp_ln7_4(icmp_ln7_reg_177),
    .item(item_reg_182),
    .j_1_out(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_j_1_out),
    .j_1_out_ap_vld(grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_j_1_out_ap_vld)
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
        grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start_reg <= 1'b1;
        end else if ((grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_ready == 1'b1)) begin
            grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        j_fu_40 <= 5'd1;
    end else if (((icmp_ln4_fu_88_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        j_fu_40 <= add_ln4_fu_103_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        A_load_reg_166 <= A_q0;
        icmp_ln7_reg_177 <= icmp_ln7_fu_122_p2;
        trunc_ln5_reg_172 <= trunc_ln5_fu_114_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        item_reg_182 <= item_fu_128_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_j_1_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        j_1_loc_fu_44 <= grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_j_1_out;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4_fu_88_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        trunc_ln4_reg_156 <= trunc_ln4_fu_99_p1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        A_address0 = zext_ln11_fu_135_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        A_address0 = zext_ln4_fu_94_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        A_address0 = grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_address0;
    end else begin
        A_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state2))) begin
        A_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        A_ce0 = grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_ce0;
    end else begin
        A_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        A_d0 = A_load_reg_166;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        A_d0 = grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_d0;
    end else begin
        A_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        A_we0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        A_we0 = grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_A_we0;
    end else begin
        A_we0 = 1'b0;
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

always @ (*) begin
    if ((grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

always @ (*) begin
    if (((icmp_ln4_fu_88_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln4_fu_88_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
            if (((icmp_ln4_fu_88_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln4_fu_103_p2 = (j_fu_40 + 5'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start = grp_insert_sort_Pipeline_VITIS_LOOP_7_2_fu_69_ap_start_reg;

assign icmp_ln4_fu_88_p2 = ((j_fu_40 == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln7_fu_122_p2 = ((trunc_ln7_fu_118_p1 == 23'd0) ? 1'b1 : 1'b0);

assign item_fu_128_p1 = A_load_reg_166;

assign trunc_ln4_fu_99_p1 = j_fu_40[3:0];

assign trunc_ln5_fu_114_p1 = A_q0[30:0];

assign trunc_ln7_fu_118_p1 = A_q0[22:0];

assign zext_ln11_fu_135_p1 = j_1_loc_fu_44;

assign zext_ln4_fu_94_p1 = j_fu_40;

endmodule //insert_sort
