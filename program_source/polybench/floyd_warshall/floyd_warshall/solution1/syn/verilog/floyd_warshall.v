// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="floyd_warshall_floyd_warshall,hls_ip_2022_2_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu55c-fsvh2892-2L-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.550000,HLS_SYN_LAT=432004,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=317,HLS_SYN_LUT=597,HLS_VERSION=2022_2_2}" *)

module floyd_warshall (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        path_address0,
        path_ce0,
        path_we0,
        path_d0,
        path_q0,
        path_address1,
        path_ce1,
        path_q1
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [11:0] path_address0;
output   path_ce0;
output   path_we0;
output  [31:0] path_d0;
input  [31:0] path_q0;
output  [11:0] path_address1;
output   path_ce1;
input  [31:0] path_q1;

reg ap_idle;
reg[11:0] path_address0;
reg path_ce0;
reg path_we0;
reg[11:0] path_address1;
reg path_ce1;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state4_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_subdone;
reg   [0:0] icmp_ln10_reg_485;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln10_fu_165_p2;
reg   [5:0] j_load_reg_489;
reg   [11:0] indvar_flatten_load_reg_494;
wire   [0:0] icmp_ln11_fu_186_p2;
reg   [0:0] icmp_ln11_reg_499;
wire   [5:0] select_ln10_fu_192_p3;
reg   [5:0] select_ln10_reg_507;
wire   [0:0] icmp_ln12_fu_200_p2;
reg   [0:0] icmp_ln12_reg_512;
wire   [5:0] add_ln11_fu_206_p2;
reg   [5:0] add_ln11_reg_517;
wire    ap_block_pp0_stage1_11001;
reg   [11:0] path_addr_1_reg_527;
reg   [11:0] path_addr_1_reg_527_pp0_iter1_reg;
wire   [11:0] add_ln13_3_fu_343_p2;
reg   [11:0] add_ln13_3_reg_533;
wire   [0:0] addr_cmp_fu_352_p2;
reg   [0:0] addr_cmp_reg_538;
reg   [31:0] path_load_reg_548;
reg   [31:0] path_load_1_reg_554;
wire   [31:0] add_ln13_fu_414_p2;
reg   [31:0] add_ln13_reg_559;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage0_subdone;
wire   [63:0] zext_ln13_3_fu_323_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln13_5_fu_338_p1;
wire   [63:0] zext_ln13_6_fu_401_p1;
wire    ap_block_pp0_stage0;
reg   [63:0] reuse_addr_reg_fu_66;
wire    ap_loop_init;
reg   [31:0] reuse_reg_fu_70;
wire   [31:0] select_ln13_fu_424_p3;
reg   [5:0] j_fu_74;
wire   [5:0] add_ln12_fu_363_p2;
reg   [5:0] ap_sig_allocacmp_j_load;
reg   [5:0] i_fu_78;
wire   [5:0] select_ln11_1_fu_285_p3;
reg   [5:0] ap_sig_allocacmp_i_load;
reg   [11:0] indvar_flatten_fu_82;
wire   [11:0] select_ln11_2_fu_374_p3;
reg   [11:0] ap_sig_allocacmp_indvar_flatten_load;
reg   [5:0] k_fu_86;
wire   [5:0] select_ln10_1_fu_226_p3;
reg   [17:0] indvar_flatten14_fu_90;
wire   [17:0] add_ln10_1_fu_171_p2;
reg   [17:0] ap_sig_allocacmp_indvar_flatten14_load;
wire   [5:0] add_ln10_fu_220_p2;
wire   [7:0] tmp_1_fu_245_p3;
wire   [11:0] tmp_fu_237_p3;
wire   [11:0] zext_ln13_1_fu_253_p1;
wire   [0:0] xor_ln10_fu_263_p2;
wire   [0:0] and_ln10_fu_268_p2;
wire   [0:0] or_ln11_fu_273_p2;
wire   [7:0] tmp_2_fu_299_p3;
wire   [11:0] p_shl_fu_291_p3;
wire   [11:0] zext_ln13_2_fu_307_p1;
wire   [11:0] sub_ln13_1_fu_311_p2;
wire   [11:0] zext_ln13_fu_233_p1;
wire   [11:0] add_ln13_1_fu_317_p2;
wire   [5:0] select_ln11_fu_278_p3;
wire   [11:0] zext_ln13_4_fu_328_p1;
wire   [11:0] add_ln13_2_fu_332_p2;
wire   [11:0] sub_ln13_fu_257_p2;
wire   [11:0] add_ln11_1_fu_369_p2;
wire   [31:0] reuse_select_fu_408_p3;
wire   [0:0] icmp_ln13_fu_420_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_condition_exit_pp0_iter1_stage0;
reg    ap_idle_pp0_0to0;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0_1to2;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_98;
reg    ap_condition_383;
reg    ap_condition_146;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

floyd_warshall_flow_control_loop_pipe flow_control_loop_pipe_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int),
    .ap_continue(1'b1)
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to0 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter1_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if ((1'b1 == ap_condition_383)) begin
            i_fu_78 <= 6'd0;
        end else if ((1'b1 == ap_condition_98)) begin
            i_fu_78 <= select_ln11_1_fu_285_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_146)) begin
        if ((icmp_ln10_fu_165_p2 == 1'd0)) begin
            indvar_flatten14_fu_90 <= add_ln10_1_fu_171_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten14_fu_90 <= 18'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if ((1'b1 == ap_condition_383)) begin
            indvar_flatten_fu_82 <= 12'd0;
        end else if ((1'b1 == ap_condition_98)) begin
            indvar_flatten_fu_82 <= select_ln11_2_fu_374_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if ((1'b1 == ap_condition_383)) begin
            j_fu_74 <= 6'd0;
        end else if ((1'b1 == ap_condition_98)) begin
            j_fu_74 <= add_ln12_fu_363_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if ((1'b1 == ap_condition_383)) begin
            k_fu_86 <= 6'd0;
        end else if ((1'b1 == ap_condition_98)) begin
            k_fu_86 <= select_ln10_1_fu_226_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if ((1'b1 == ap_condition_383)) begin
            reuse_addr_reg_fu_66 <= 64'd18446744073709551615;
        end else if ((1'b1 == ap_condition_98)) begin
            reuse_addr_reg_fu_66 <= zext_ln13_5_fu_338_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (ap_loop_init == 1'b1))) begin
            reuse_reg_fu_70 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            reuse_reg_fu_70 <= select_ln13_fu_424_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln10_fu_165_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln11_reg_517 <= add_ln11_fu_206_p2;
        icmp_ln11_reg_499 <= icmp_ln11_fu_186_p2;
        icmp_ln12_reg_512 <= icmp_ln12_fu_200_p2;
        indvar_flatten_load_reg_494 <= ap_sig_allocacmp_indvar_flatten_load;
        j_load_reg_489 <= ap_sig_allocacmp_j_load;
        select_ln10_reg_507 <= select_ln10_fu_192_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln10_reg_485 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln13_3_reg_533 <= add_ln13_3_fu_343_p2;
        addr_cmp_reg_538 <= addr_cmp_fu_352_p2;
        path_addr_1_reg_527 <= zext_ln13_5_fu_338_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln13_reg_559 <= add_ln13_fu_414_p2;
        path_addr_1_reg_527_pp0_iter1_reg <= path_addr_1_reg_527;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln10_reg_485 <= icmp_ln10_fu_165_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        path_load_1_reg_554 <= path_q0;
        path_load_reg_548 <= path_q1;
    end
end

always @ (*) begin
    if (((icmp_ln10_reg_485 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln10_reg_485 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to2 = 1'b1;
    end else begin
        ap_idle_pp0_1to2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_load = 6'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_78;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten14_load = 18'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten14_load = indvar_flatten14_fu_90;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 12'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_82;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_j_load = 6'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_74;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        path_address0 = path_addr_1_reg_527_pp0_iter1_reg;
    end else if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        path_address0 = zext_ln13_3_fu_323_p1;
    end else begin
        path_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        path_address1 = zext_ln13_6_fu_401_p1;
    end else if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        path_address1 = zext_ln13_5_fu_338_p1;
    end else begin
        path_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        path_ce0 = 1'b1;
    end else begin
        path_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        path_ce1 = 1'b1;
    end else begin
        path_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        path_we0 = 1'b1;
    end else begin
        path_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if (((ap_idle_pp0_0to0 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter1_stage0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to2 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln10_1_fu_171_p2 = (ap_sig_allocacmp_indvar_flatten14_load + 18'd1);

assign add_ln10_fu_220_p2 = (k_fu_86 + 6'd1);

assign add_ln11_1_fu_369_p2 = (indvar_flatten_load_reg_494 + 12'd1);

assign add_ln11_fu_206_p2 = (select_ln10_fu_192_p3 + 6'd1);

assign add_ln12_fu_363_p2 = (select_ln11_fu_278_p3 + 6'd1);

assign add_ln13_1_fu_317_p2 = (sub_ln13_1_fu_311_p2 + zext_ln13_fu_233_p1);

assign add_ln13_2_fu_332_p2 = (sub_ln13_1_fu_311_p2 + zext_ln13_4_fu_328_p1);

assign add_ln13_3_fu_343_p2 = (sub_ln13_fu_257_p2 + zext_ln13_4_fu_328_p1);

assign add_ln13_fu_414_p2 = (path_q1 + reuse_select_fu_408_p3);

assign addr_cmp_fu_352_p2 = ((reuse_addr_reg_fu_66 == zext_ln13_3_fu_323_p1) ? 1'b1 : 1'b0);

assign and_ln10_fu_268_p2 = (xor_ln10_fu_263_p2 & icmp_ln12_reg_512);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_146 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_383 = ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1));
end

always @ (*) begin
    ap_condition_98 = ((icmp_ln10_reg_485 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign icmp_ln10_fu_165_p2 = ((ap_sig_allocacmp_indvar_flatten14_load == 18'd216000) ? 1'b1 : 1'b0);

assign icmp_ln11_fu_186_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 12'd3600) ? 1'b1 : 1'b0);

assign icmp_ln12_fu_200_p2 = ((ap_sig_allocacmp_j_load == 6'd60) ? 1'b1 : 1'b0);

assign icmp_ln13_fu_420_p2 = (($signed(path_load_reg_548) < $signed(add_ln13_reg_559)) ? 1'b1 : 1'b0);

assign or_ln11_fu_273_p2 = (icmp_ln11_reg_499 | and_ln10_fu_268_p2);

assign p_shl_fu_291_p3 = {{select_ln11_1_fu_285_p3}, {6'd0}};

assign path_d0 = ((icmp_ln13_fu_420_p2[0:0] == 1'b1) ? path_load_reg_548 : add_ln13_reg_559);

assign reuse_select_fu_408_p3 = ((addr_cmp_reg_538[0:0] == 1'b1) ? reuse_reg_fu_70 : path_load_1_reg_554);

assign select_ln10_1_fu_226_p3 = ((icmp_ln11_reg_499[0:0] == 1'b1) ? add_ln10_fu_220_p2 : k_fu_86);

assign select_ln10_fu_192_p3 = ((icmp_ln11_fu_186_p2[0:0] == 1'b1) ? 6'd0 : ap_sig_allocacmp_i_load);

assign select_ln11_1_fu_285_p3 = ((and_ln10_fu_268_p2[0:0] == 1'b1) ? add_ln11_reg_517 : select_ln10_reg_507);

assign select_ln11_2_fu_374_p3 = ((icmp_ln11_reg_499[0:0] == 1'b1) ? 12'd1 : add_ln11_1_fu_369_p2);

assign select_ln11_fu_278_p3 = ((or_ln11_fu_273_p2[0:0] == 1'b1) ? 6'd0 : j_load_reg_489);

assign select_ln13_fu_424_p3 = ((icmp_ln13_fu_420_p2[0:0] == 1'b1) ? path_load_reg_548 : add_ln13_reg_559);

assign sub_ln13_1_fu_311_p2 = (p_shl_fu_291_p3 - zext_ln13_2_fu_307_p1);

assign sub_ln13_fu_257_p2 = (tmp_fu_237_p3 - zext_ln13_1_fu_253_p1);

assign tmp_1_fu_245_p3 = {{select_ln10_1_fu_226_p3}, {2'd0}};

assign tmp_2_fu_299_p3 = {{select_ln11_1_fu_285_p3}, {2'd0}};

assign tmp_fu_237_p3 = {{select_ln10_1_fu_226_p3}, {6'd0}};

assign xor_ln10_fu_263_p2 = (icmp_ln11_reg_499 ^ 1'd1);

assign zext_ln13_1_fu_253_p1 = tmp_1_fu_245_p3;

assign zext_ln13_2_fu_307_p1 = tmp_2_fu_299_p3;

assign zext_ln13_3_fu_323_p1 = add_ln13_1_fu_317_p2;

assign zext_ln13_4_fu_328_p1 = select_ln11_fu_278_p3;

assign zext_ln13_5_fu_338_p1 = add_ln13_2_fu_332_p2;

assign zext_ln13_6_fu_401_p1 = add_ln13_3_reg_533;

assign zext_ln13_fu_233_p1 = select_ln10_1_fu_226_p3;

endmodule //floyd_warshall
