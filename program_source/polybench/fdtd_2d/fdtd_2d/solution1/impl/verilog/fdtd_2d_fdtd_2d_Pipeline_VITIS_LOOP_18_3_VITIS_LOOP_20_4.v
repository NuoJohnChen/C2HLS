// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module fdtd_2d_fdtd_2d_Pipeline_VITIS_LOOP_18_3_VITIS_LOOP_20_4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ey_address0,
        ey_ce0,
        ey_we0,
        ey_d0,
        ey_address1,
        ey_ce1,
        ey_q1,
        hz_address0,
        hz_ce0,
        hz_q0,
        hz_address1,
        hz_ce1,
        hz_q1,
        grp_fu_158_p_din0,
        grp_fu_158_p_din1,
        grp_fu_158_p_opcode,
        grp_fu_158_p_dout0,
        grp_fu_158_p_ce,
        grp_fu_162_p_din0,
        grp_fu_162_p_din1,
        grp_fu_162_p_opcode,
        grp_fu_162_p_dout0,
        grp_fu_162_p_ce,
        grp_fu_166_p_din0,
        grp_fu_166_p_din1,
        grp_fu_166_p_dout0,
        grp_fu_166_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [12:0] ey_address0;
output   ey_ce0;
output   ey_we0;
output  [63:0] ey_d0;
output  [12:0] ey_address1;
output   ey_ce1;
input  [63:0] ey_q1;
output  [12:0] hz_address0;
output   hz_ce0;
input  [63:0] hz_q0;
output  [12:0] hz_address1;
output   hz_ce1;
input  [63:0] hz_q1;
output  [63:0] grp_fu_158_p_din0;
output  [63:0] grp_fu_158_p_din1;
output  [1:0] grp_fu_158_p_opcode;
input  [63:0] grp_fu_158_p_dout0;
output   grp_fu_158_p_ce;
output  [63:0] grp_fu_162_p_din0;
output  [63:0] grp_fu_162_p_din1;
output  [0:0] grp_fu_162_p_opcode;
input  [63:0] grp_fu_162_p_dout0;
output   grp_fu_162_p_ce;
output  [63:0] grp_fu_166_p_din0;
output  [63:0] grp_fu_166_p_din1;
input  [63:0] grp_fu_166_p_dout0;
output   grp_fu_166_p_ce;

reg ap_idle;
reg ey_ce0;
reg ey_we0;
reg ey_ce1;
reg hz_ce0;
reg hz_ce1;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_enable_reg_pp0_iter15;
reg    ap_enable_reg_pp0_iter16;
reg    ap_enable_reg_pp0_iter17;
reg    ap_enable_reg_pp0_iter18;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
wire    ap_block_state9_pp0_stage0_iter8;
wire    ap_block_state10_pp0_stage0_iter9;
wire    ap_block_state11_pp0_stage0_iter10;
wire    ap_block_state12_pp0_stage0_iter11;
wire    ap_block_state13_pp0_stage0_iter12;
wire    ap_block_state14_pp0_stage0_iter13;
wire    ap_block_state15_pp0_stage0_iter14;
wire    ap_block_state16_pp0_stage0_iter15;
wire    ap_block_state17_pp0_stage0_iter16;
wire    ap_block_state18_pp0_stage0_iter17;
wire    ap_block_state19_pp0_stage0_iter18;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln18_fu_142_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [12:0] add_ln21_2_fu_266_p2;
reg   [12:0] add_ln21_2_reg_349;
wire   [12:0] add_ln21_3_fu_272_p2;
reg   [12:0] add_ln21_3_reg_354;
reg   [12:0] ey_addr_1_reg_359;
reg   [12:0] ey_addr_1_reg_359_pp0_iter2_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter3_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter4_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter5_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter6_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter7_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter8_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter9_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter10_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter11_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter12_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter13_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter14_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter15_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter16_reg;
reg   [12:0] ey_addr_1_reg_359_pp0_iter17_reg;
reg   [63:0] hz_load_reg_375;
reg   [63:0] hz_load_1_reg_380;
wire   [63:0] bitcast_ln21_1_fu_308_p1;
wire   [63:0] bitcast_ln21_2_fu_312_p1;
reg   [63:0] sub_reg_395;
reg   [63:0] ey_load_reg_400;
reg   [63:0] mul_reg_405;
wire   [63:0] bitcast_ln21_fu_316_p1;
reg   [63:0] sub1_reg_415;
wire   [63:0] zext_ln21_5_fu_299_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln21_6_fu_304_p1;
reg   [6:0] j_fu_58;
wire   [6:0] add_ln20_fu_278_p2;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_j_load;
reg   [5:0] i_fu_62;
wire   [5:0] select_ln18_1_fu_180_p3;
reg   [5:0] ap_sig_allocacmp_i_load;
reg   [12:0] indvar_flatten_fu_66;
wire   [12:0] add_ln18_1_fu_148_p2;
reg   [12:0] ap_sig_allocacmp_indvar_flatten_load;
wire   [0:0] icmp_ln20_fu_166_p2;
wire   [5:0] add_ln18_fu_160_p2;
wire   [11:0] tmp_fu_188_p3;
wire   [9:0] tmp_1_fu_200_p3;
wire   [12:0] zext_ln21_fu_196_p1;
wire   [12:0] zext_ln21_1_fu_208_p1;
wire   [5:0] empty_11_fu_218_p2;
wire   [5:0] select_ln18_2_fu_224_p3;
wire   [11:0] tmp_2_fu_232_p3;
wire   [9:0] tmp_3_fu_244_p3;
wire   [12:0] zext_ln21_2_fu_240_p1;
wire   [12:0] zext_ln21_3_fu_252_p1;
wire   [6:0] select_ln18_fu_172_p3;
wire   [12:0] add_ln21_fu_212_p2;
wire   [12:0] zext_ln21_4_fu_262_p1;
wire   [12:0] add_ln21_1_fu_256_p2;
wire    ap_block_pp0_stage0_00001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg    ap_loop_exit_ready_pp0_iter10_reg;
reg    ap_loop_exit_ready_pp0_iter11_reg;
reg    ap_loop_exit_ready_pp0_iter12_reg;
reg    ap_loop_exit_ready_pp0_iter13_reg;
reg    ap_loop_exit_ready_pp0_iter14_reg;
reg    ap_loop_exit_ready_pp0_iter15_reg;
reg    ap_loop_exit_ready_pp0_iter16_reg;
reg    ap_loop_exit_ready_pp0_iter17_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_enable_reg_pp0_iter15 = 1'b0;
#0 ap_enable_reg_pp0_iter16 = 1'b0;
#0 ap_enable_reg_pp0_iter17 = 1'b0;
#0 ap_enable_reg_pp0_iter18 = 1'b0;
#0 ap_done_reg = 1'b0;
end

fdtd_2d_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
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
        end else if (((ap_loop_exit_ready_pp0_iter17_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter15 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter16 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter16 <= ap_enable_reg_pp0_iter15;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter17 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter17 <= ap_enable_reg_pp0_iter16;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter18 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter18 <= ap_enable_reg_pp0_iter17;
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
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln18_fu_142_p2 == 1'd0))) begin
            i_fu_62 <= select_ln18_1_fu_180_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_62 <= 6'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln18_fu_142_p2 == 1'd0))) begin
            indvar_flatten_fu_66 <= add_ln18_1_fu_148_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_66 <= 13'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln18_fu_142_p2 == 1'd0))) begin
            j_fu_58 <= add_ln20_fu_278_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_58 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln18_fu_142_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln21_2_reg_349 <= add_ln21_2_fu_266_p2;
        add_ln21_3_reg_354 <= add_ln21_3_fu_272_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
        ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
        ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
        ap_loop_exit_ready_pp0_iter13_reg <= ap_loop_exit_ready_pp0_iter12_reg;
        ap_loop_exit_ready_pp0_iter14_reg <= ap_loop_exit_ready_pp0_iter13_reg;
        ap_loop_exit_ready_pp0_iter15_reg <= ap_loop_exit_ready_pp0_iter14_reg;
        ap_loop_exit_ready_pp0_iter16_reg <= ap_loop_exit_ready_pp0_iter15_reg;
        ap_loop_exit_ready_pp0_iter17_reg <= ap_loop_exit_ready_pp0_iter16_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
        ey_addr_1_reg_359_pp0_iter10_reg <= ey_addr_1_reg_359_pp0_iter9_reg;
        ey_addr_1_reg_359_pp0_iter11_reg <= ey_addr_1_reg_359_pp0_iter10_reg;
        ey_addr_1_reg_359_pp0_iter12_reg <= ey_addr_1_reg_359_pp0_iter11_reg;
        ey_addr_1_reg_359_pp0_iter13_reg <= ey_addr_1_reg_359_pp0_iter12_reg;
        ey_addr_1_reg_359_pp0_iter14_reg <= ey_addr_1_reg_359_pp0_iter13_reg;
        ey_addr_1_reg_359_pp0_iter15_reg <= ey_addr_1_reg_359_pp0_iter14_reg;
        ey_addr_1_reg_359_pp0_iter16_reg <= ey_addr_1_reg_359_pp0_iter15_reg;
        ey_addr_1_reg_359_pp0_iter17_reg <= ey_addr_1_reg_359_pp0_iter16_reg;
        ey_addr_1_reg_359_pp0_iter2_reg <= ey_addr_1_reg_359;
        ey_addr_1_reg_359_pp0_iter3_reg <= ey_addr_1_reg_359_pp0_iter2_reg;
        ey_addr_1_reg_359_pp0_iter4_reg <= ey_addr_1_reg_359_pp0_iter3_reg;
        ey_addr_1_reg_359_pp0_iter5_reg <= ey_addr_1_reg_359_pp0_iter4_reg;
        ey_addr_1_reg_359_pp0_iter6_reg <= ey_addr_1_reg_359_pp0_iter5_reg;
        ey_addr_1_reg_359_pp0_iter7_reg <= ey_addr_1_reg_359_pp0_iter6_reg;
        ey_addr_1_reg_359_pp0_iter8_reg <= ey_addr_1_reg_359_pp0_iter7_reg;
        ey_addr_1_reg_359_pp0_iter9_reg <= ey_addr_1_reg_359_pp0_iter8_reg;
        mul_reg_405 <= grp_fu_166_p_dout0;
        sub1_reg_415 <= grp_fu_162_p_dout0;
        sub_reg_395 <= grp_fu_158_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        ey_addr_1_reg_359 <= zext_ln21_5_fu_299_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ey_load_reg_400 <= ey_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        hz_load_1_reg_380 <= hz_q0;
        hz_load_reg_375 <= hz_q1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln18_fu_142_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter17_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter18 == 1'b0) & (ap_enable_reg_pp0_iter17 == 1'b0) & (ap_enable_reg_pp0_iter16 == 1'b0) & (ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_i_load = 6'd1;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_62;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten_load = 13'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_66;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_j_load = 7'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_58;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter18 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ey_ce0 = 1'b1;
    end else begin
        ey_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter11 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ey_ce1 = 1'b1;
    end else begin
        ey_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter18 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ey_we0 = 1'b1;
    end else begin
        ey_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        hz_ce0 = 1'b1;
    end else begin
        hz_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        hz_ce1 = 1'b1;
    end else begin
        hz_ce1 = 1'b0;
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

assign add_ln18_1_fu_148_p2 = (ap_sig_allocacmp_indvar_flatten_load + 13'd1);

assign add_ln18_fu_160_p2 = (ap_sig_allocacmp_i_load + 6'd1);

assign add_ln20_fu_278_p2 = (select_ln18_fu_172_p3 + 7'd1);

assign add_ln21_1_fu_256_p2 = (zext_ln21_2_fu_240_p1 + zext_ln21_3_fu_252_p1);

assign add_ln21_2_fu_266_p2 = (add_ln21_fu_212_p2 + zext_ln21_4_fu_262_p1);

assign add_ln21_3_fu_272_p2 = (add_ln21_1_fu_256_p2 + zext_ln21_4_fu_262_p1);

assign add_ln21_fu_212_p2 = (zext_ln21_fu_196_p1 + zext_ln21_1_fu_208_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter11 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter12 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter13 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter14 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter15 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage0_iter16 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage0_iter17 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage0_iter18 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign bitcast_ln21_1_fu_308_p1 = hz_load_reg_375;

assign bitcast_ln21_2_fu_312_p1 = hz_load_1_reg_380;

assign bitcast_ln21_fu_316_p1 = ey_load_reg_400;

assign empty_11_fu_218_p2 = ($signed(ap_sig_allocacmp_i_load) + $signed(6'd63));

assign ey_address0 = ey_addr_1_reg_359_pp0_iter17_reg;

assign ey_address1 = ey_addr_1_reg_359_pp0_iter10_reg;

assign ey_d0 = sub1_reg_415;

assign grp_fu_158_p_ce = 1'b1;

assign grp_fu_158_p_din0 = bitcast_ln21_1_fu_308_p1;

assign grp_fu_158_p_din1 = bitcast_ln21_2_fu_312_p1;

assign grp_fu_158_p_opcode = 2'd1;

assign grp_fu_162_p_ce = 1'b1;

assign grp_fu_162_p_din0 = bitcast_ln21_fu_316_p1;

assign grp_fu_162_p_din1 = mul_reg_405;

assign grp_fu_162_p_opcode = 2'd1;

assign grp_fu_166_p_ce = 1'b1;

assign grp_fu_166_p_din0 = sub_reg_395;

assign grp_fu_166_p_din1 = 64'd4602678819172646912;

assign hz_address0 = zext_ln21_6_fu_304_p1;

assign hz_address1 = zext_ln21_5_fu_299_p1;

assign icmp_ln18_fu_142_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 13'd4720) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_166_p2 = ((ap_sig_allocacmp_j_load == 7'd80) ? 1'b1 : 1'b0);

assign select_ln18_1_fu_180_p3 = ((icmp_ln20_fu_166_p2[0:0] == 1'b1) ? add_ln18_fu_160_p2 : ap_sig_allocacmp_i_load);

assign select_ln18_2_fu_224_p3 = ((icmp_ln20_fu_166_p2[0:0] == 1'b1) ? ap_sig_allocacmp_i_load : empty_11_fu_218_p2);

assign select_ln18_fu_172_p3 = ((icmp_ln20_fu_166_p2[0:0] == 1'b1) ? 7'd0 : ap_sig_allocacmp_j_load);

assign tmp_1_fu_200_p3 = {{select_ln18_1_fu_180_p3}, {4'd0}};

assign tmp_2_fu_232_p3 = {{select_ln18_2_fu_224_p3}, {6'd0}};

assign tmp_3_fu_244_p3 = {{select_ln18_2_fu_224_p3}, {4'd0}};

assign tmp_fu_188_p3 = {{select_ln18_1_fu_180_p3}, {6'd0}};

assign zext_ln21_1_fu_208_p1 = tmp_1_fu_200_p3;

assign zext_ln21_2_fu_240_p1 = tmp_2_fu_232_p3;

assign zext_ln21_3_fu_252_p1 = tmp_3_fu_244_p3;

assign zext_ln21_4_fu_262_p1 = select_ln18_fu_172_p3;

assign zext_ln21_5_fu_299_p1 = add_ln21_2_reg_349;

assign zext_ln21_6_fu_304_p1 = add_ln21_3_reg_354;

assign zext_ln21_fu_196_p1 = tmp_fu_188_p3;

endmodule //fdtd_2d_fdtd_2d_Pipeline_VITIS_LOOP_18_3_VITIS_LOOP_20_4
