// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module needwun_needwun_Pipeline_trace (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        SEQA_address0,
        SEQA_ce0,
        SEQA_q0,
        SEQB_address0,
        SEQB_ce0,
        SEQB_q0,
        ptr_address0,
        ptr_ce0,
        ptr_q0,
        alignedA_address0,
        alignedA_ce0,
        alignedA_we0,
        alignedA_d0,
        alignedA_address1,
        alignedA_ce1,
        alignedA_we1,
        alignedA_d1,
        alignedB_address0,
        alignedB_ce0,
        alignedB_we0,
        alignedB_d0,
        alignedB_address1,
        alignedB_ce1,
        alignedB_we1,
        alignedB_d1,
        b_str_idx_2_out,
        b_str_idx_2_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [6:0] SEQA_address0;
output   SEQA_ce0;
input  [7:0] SEQA_q0;
output  [6:0] SEQB_address0;
output   SEQB_ce0;
input  [7:0] SEQB_q0;
output  [14:0] ptr_address0;
output   ptr_ce0;
input  [7:0] ptr_q0;
output  [7:0] alignedA_address0;
output   alignedA_ce0;
output   alignedA_we0;
output  [7:0] alignedA_d0;
output  [7:0] alignedA_address1;
output   alignedA_ce1;
output   alignedA_we1;
output  [7:0] alignedA_d1;
output  [7:0] alignedB_address0;
output   alignedB_ce0;
output   alignedB_we0;
output  [7:0] alignedB_d0;
output  [7:0] alignedB_address1;
output   alignedB_ce1;
output   alignedB_we1;
output  [7:0] alignedB_d1;
output  [31:0] b_str_idx_2_out;
output   b_str_idx_2_out_ap_vld;

reg ap_idle;
reg[6:0] SEQA_address0;
reg SEQA_ce0;
reg[6:0] SEQB_address0;
reg SEQB_ce0;
reg ptr_ce0;
reg alignedA_ce0;
reg alignedA_we0;
reg alignedA_ce1;
reg alignedA_we1;
reg alignedB_ce0;
reg alignedB_we0;
reg alignedB_ce1;
reg alignedB_we1;
reg b_str_idx_2_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] or_ln62_fu_205_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [31:0] b_idx_1_reg_332;
reg   [31:0] a_idx_1_reg_337;
reg   [0:0] or_ln62_reg_342;
reg   [7:0] ptr_load_reg_351;
reg   [7:0] alignedA_addr_reg_355;
reg   [7:0] alignedB_addr_reg_360;
reg    ap_condition_exit_pp0_iter2_stage0;
wire   [63:0] zext_ln64_fu_243_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln71_fu_264_p1;
wire   [63:0] zext_ln65_fu_274_p1;
wire   [63:0] zext_ln66_fu_279_p1;
wire   [63:0] zext_ln77_fu_294_p1;
reg   [63:0] a_str_idx_fu_50;
wire   [63:0] add_ln66_fu_258_p2;
wire    ap_loop_init;
reg   [31:0] b_idx_fu_54;
wire   [31:0] grp_fu_167_p2;
reg   [31:0] ap_sig_allocacmp_b_idx_1;
reg   [31:0] a_idx_fu_58;
wire   [31:0] grp_fu_162_p2;
reg   [31:0] ap_sig_allocacmp_a_idx_1;
wire    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln62_fu_193_p2;
wire   [0:0] icmp_ln62_1_fu_199_p2;
wire   [7:0] trunc_ln63_fu_219_p1;
wire   [14:0] empty_16_fu_211_p1;
wire   [14:0] empty_17_fu_215_p1;
wire   [14:0] add_ln64_1_fu_231_p2;
wire   [14:0] shl_ln1_fu_223_p3;
wire   [14:0] add_ln64_fu_237_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_164;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

needwun_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter2_stage0)) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        a_idx_fu_58 <= 32'd128;
    end else if ((((ptr_q0 == 8'd92) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)) | ((ptr_q0 == 8'd60) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)))) begin
        a_idx_fu_58 <= grp_fu_162_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            a_str_idx_fu_50 <= 64'd0;
        end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1))) begin
            a_str_idx_fu_50 <= add_ln66_fu_258_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        b_idx_fu_54 <= 32'd128;
    end else if (((~(ptr_q0 == 8'd92) & ~(ptr_q0 == 8'd60) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)) | ((ptr_q0 == 8'd92) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)))) begin
        b_idx_fu_54 <= grp_fu_167_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        a_idx_1_reg_337 <= ap_sig_allocacmp_a_idx_1;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
        b_idx_1_reg_332 <= ap_sig_allocacmp_b_idx_1;
        or_ln62_reg_342 <= or_ln62_fu_205_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (or_ln62_reg_342 == 1'd1))) begin
        alignedA_addr_reg_355 <= a_str_idx_fu_50;
        alignedB_addr_reg_360 <= a_str_idx_fu_50;
        ptr_load_reg_351 <= ptr_q0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_164)) begin
        if ((ptr_q0 == 8'd92)) begin
            SEQA_address0 = zext_ln65_fu_274_p1;
        end else if ((ptr_q0 == 8'd60)) begin
            SEQA_address0 = zext_ln71_fu_264_p1;
        end else begin
            SEQA_address0 = 'bx;
        end
    end else begin
        SEQA_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((ptr_q0 == 8'd92) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)) | ((ptr_q0 == 8'd60) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)))) begin
        SEQA_ce0 = 1'b1;
    end else begin
        SEQA_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_164)) begin
        if ((~(ptr_q0 == 8'd92) & ~(ptr_q0 == 8'd60))) begin
            SEQB_address0 = zext_ln77_fu_294_p1;
        end else if ((ptr_q0 == 8'd92)) begin
            SEQB_address0 = zext_ln66_fu_279_p1;
        end else begin
            SEQB_address0 = 'bx;
        end
    end else begin
        SEQB_address0 = 'bx;
    end
end

always @ (*) begin
    if (((~(ptr_q0 == 8'd92) & ~(ptr_q0 == 8'd60) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)) | ((ptr_q0 == 8'd92) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)))) begin
        SEQB_ce0 = 1'b1;
    end else begin
        SEQB_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (ptr_load_reg_351 == 8'd60)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (ptr_load_reg_351 == 8'd92)))) begin
        alignedA_ce0 = 1'b1;
    end else begin
        alignedA_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        alignedA_ce1 = 1'b1;
    end else begin
        alignedA_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (ptr_load_reg_351 == 8'd60)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (ptr_load_reg_351 == 8'd92)))) begin
        alignedA_we0 = 1'b1;
    end else begin
        alignedA_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~(ptr_q0 == 8'd92) & ~(ptr_q0 == 8'd60) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1))) begin
        alignedA_we1 = 1'b1;
    end else begin
        alignedA_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((~(ptr_load_reg_351 == 8'd60) & ~(ptr_load_reg_351 == 8'd92) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (ptr_load_reg_351 == 8'd92)))) begin
        alignedB_ce0 = 1'b1;
    end else begin
        alignedB_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        alignedB_ce1 = 1'b1;
    end else begin
        alignedB_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((~(ptr_load_reg_351 == 8'd60) & ~(ptr_load_reg_351 == 8'd92) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (ptr_load_reg_351 == 8'd92)))) begin
        alignedB_we0 = 1'b1;
    end else begin
        alignedB_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ptr_q0 == 8'd60) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1))) begin
        alignedB_we1 = 1'b1;
    end else begin
        alignedB_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((or_ln62_fu_205_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd0))) begin
        ap_condition_exit_pp0_iter2_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter2_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if ((((ptr_q0 == 8'd92) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)) | ((ptr_q0 == 8'd60) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)))) begin
        ap_sig_allocacmp_a_idx_1 = grp_fu_162_p2;
    end else begin
        ap_sig_allocacmp_a_idx_1 = a_idx_fu_58;
    end
end

always @ (*) begin
    if (((~(ptr_q0 == 8'd92) & ~(ptr_q0 == 8'd60) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)) | ((ptr_q0 == 8'd92) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1)))) begin
        ap_sig_allocacmp_b_idx_1 = grp_fu_167_p2;
    end else begin
        ap_sig_allocacmp_b_idx_1 = b_idx_fu_54;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (or_ln62_reg_342 == 1'd0))) begin
        b_str_idx_2_out_ap_vld = 1'b1;
    end else begin
        b_str_idx_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ptr_ce0 = 1'b1;
    end else begin
        ptr_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln64_1_fu_231_p2 = (empty_16_fu_211_p1 + empty_17_fu_215_p1);

assign add_ln64_fu_237_p2 = (add_ln64_1_fu_231_p2 + shl_ln1_fu_223_p3);

assign add_ln66_fu_258_p2 = (a_str_idx_fu_50 + 64'd1);

assign alignedA_address0 = alignedA_addr_reg_355;

assign alignedA_address1 = a_str_idx_fu_50;

assign alignedA_d0 = SEQA_q0;

assign alignedA_d1 = 8'd45;

assign alignedB_address0 = alignedB_addr_reg_360;

assign alignedB_address1 = a_str_idx_fu_50;

assign alignedB_d0 = SEQB_q0;

assign alignedB_d1 = 8'd45;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_164 = ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (or_ln62_reg_342 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign b_str_idx_2_out = a_str_idx_fu_50[31:0];

assign empty_16_fu_211_p1 = ap_sig_allocacmp_a_idx_1[14:0];

assign empty_17_fu_215_p1 = ap_sig_allocacmp_b_idx_1[14:0];

assign grp_fu_162_p2 = ($signed(a_idx_1_reg_337) + $signed(32'd4294967295));

assign grp_fu_167_p2 = ($signed(b_idx_1_reg_332) + $signed(32'd4294967295));

assign icmp_ln62_1_fu_199_p2 = (($signed(ap_sig_allocacmp_b_idx_1) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign icmp_ln62_fu_193_p2 = (($signed(ap_sig_allocacmp_a_idx_1) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign or_ln62_fu_205_p2 = (icmp_ln62_fu_193_p2 | icmp_ln62_1_fu_199_p2);

assign ptr_address0 = zext_ln64_fu_243_p1;

assign shl_ln1_fu_223_p3 = {{trunc_ln63_fu_219_p1}, {7'd0}};

assign trunc_ln63_fu_219_p1 = ap_sig_allocacmp_b_idx_1[7:0];

assign zext_ln64_fu_243_p1 = add_ln64_fu_237_p2;

assign zext_ln65_fu_274_p1 = grp_fu_162_p2;

assign zext_ln66_fu_279_p1 = grp_fu_167_p2;

assign zext_ln71_fu_264_p1 = grp_fu_162_p2;

assign zext_ln77_fu_294_p1 = grp_fu_167_p2;

endmodule //needwun_needwun_Pipeline_trace
