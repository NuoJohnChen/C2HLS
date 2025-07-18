// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module nussinov_nussinov_Pipeline_VITIS_LOOP_40_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        select_ln25,
        zext_ln9,
        table_r_address0,
        table_r_ce0,
        table_r_we0,
        table_r_d0,
        table_r_q0,
        table_r_address1,
        table_r_ce1,
        table_r_q1,
        add_ln16,
        sub_ln16,
        zext_ln11
);

parameter    ap_ST_fsm_pp0_stage0 = 3'd1;
parameter    ap_ST_fsm_pp0_stage1 = 3'd2;
parameter    ap_ST_fsm_pp0_stage2 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] select_ln25;
input  [5:0] zext_ln9;
output  [11:0] table_r_address0;
output   table_r_ce0;
output   table_r_we0;
output  [31:0] table_r_d0;
input  [31:0] table_r_q0;
output  [11:0] table_r_address1;
output   table_r_ce1;
input  [31:0] table_r_q1;
input  [11:0] add_ln16;
input  [11:0] sub_ln16;
input  [11:0] zext_ln11;

reg ap_idle;
reg[11:0] table_r_address0;
reg table_r_ce0;
reg table_r_we0;
reg table_r_ce1;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state5_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln40_fu_165_p2;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln11_cast_fu_122_p1;
reg   [63:0] zext_ln11_cast_reg_272;
wire   [63:0] add_ln16_cast_fu_126_p1;
reg   [63:0] add_ln16_cast_reg_277;
reg   [31:0] p_load_reg_282;
wire    ap_block_pp0_stage1_11001;
reg   [11:0] table_r_addr_1_reg_288;
reg   [0:0] icmp_ln40_reg_293;
reg   [31:0] table_r_load_1_reg_302;
wire    ap_block_pp0_stage2_11001;
wire   [31:0] select_ln42_fu_237_p3;
reg   [31:0] select_ln42_reg_307;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln42_fu_160_p1;
wire   [63:0] zext_ln42_1_fu_211_p1;
reg   [63:0] k_fu_52;
wire   [63:0] add_ln42_fu_170_p2;
wire   [63:0] zext_ln9_cast_fu_130_p1;
wire    ap_loop_init;
reg   [31:0] empty_fu_56;
reg   [31:0] ap_sig_allocacmp_p_load;
wire    ap_block_pp0_stage2;
wire    ap_block_pp0_stage0;
wire   [11:0] trunc_ln16_fu_151_p1;
wire   [11:0] add_ln42_2_fu_155_p2;
wire   [5:0] trunc_ln42_fu_176_p1;
wire   [9:0] trunc_ln42_1_fu_188_p1;
wire   [11:0] p_shl4_fu_180_p3;
wire   [11:0] newFirst_fu_200_p2;
wire   [11:0] p_shl5_fu_192_p3;
wire   [11:0] newSecond_fu_205_p2;
wire   [31:0] add_ln42_1_fu_221_p2;
wire   [0:0] icmp_ln42_fu_226_p2;
wire   [0:0] xor_ln42_fu_231_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [2:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

nussinov_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter0_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        empty_fu_56 <= select_ln25;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        empty_fu_56 <= select_ln42_reg_307;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        k_fu_52 <= zext_ln9_cast_fu_130_p1;
    end else if (((icmp_ln40_fu_165_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        k_fu_52 <= add_ln42_fu_170_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln16_cast_reg_277[11 : 0] <= add_ln16_cast_fu_126_p1[11 : 0];
        zext_ln11_cast_reg_272[11 : 0] <= zext_ln11_cast_fu_122_p1[11 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        icmp_ln40_reg_293 <= icmp_ln40_fu_165_p2;
        p_load_reg_282 <= ap_sig_allocacmp_p_load;
        table_r_addr_1_reg_288 <= zext_ln42_fu_160_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln40_reg_293 == 1'd1))) begin
        select_ln42_reg_307 <= select_ln42_fu_237_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln40_reg_293 == 1'd1))) begin
        table_r_load_1_reg_302 <= table_r_q1;
    end
end

always @ (*) begin
    if (((icmp_ln40_fu_165_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_sig_allocacmp_p_load = select_ln42_reg_307;
    end else begin
        ap_sig_allocacmp_p_load = empty_fu_56;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            table_r_address0 = table_r_addr_1_reg_288;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            table_r_address0 = add_ln16_cast_reg_277;
        end else begin
            table_r_address0 = 'bx;
        end
    end else begin
        table_r_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        table_r_ce0 = 1'b1;
    end else begin
        table_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        table_r_ce1 = 1'b1;
    end else begin
        table_r_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        table_r_we0 = 1'b1;
    end else begin
        table_r_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln16_cast_fu_126_p1 = add_ln16;

assign add_ln42_1_fu_221_p2 = (table_r_load_1_reg_302 + table_r_q0);

assign add_ln42_2_fu_155_p2 = (sub_ln16 + trunc_ln16_fu_151_p1);

assign add_ln42_fu_170_p2 = (k_fu_52 + 64'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign icmp_ln40_fu_165_p2 = (($signed(k_fu_52) < $signed(zext_ln11_cast_reg_272)) ? 1'b1 : 1'b0);

assign icmp_ln42_fu_226_p2 = (($signed(p_load_reg_282) < $signed(add_ln42_1_fu_221_p2)) ? 1'b1 : 1'b0);

assign newFirst_fu_200_p2 = (p_shl4_fu_180_p3 + zext_ln11);

assign newSecond_fu_205_p2 = (newFirst_fu_200_p2 - p_shl5_fu_192_p3);

assign p_shl4_fu_180_p3 = {{trunc_ln42_fu_176_p1}, {6'd0}};

assign p_shl5_fu_192_p3 = {{trunc_ln42_1_fu_188_p1}, {2'd0}};

assign select_ln42_fu_237_p3 = ((xor_ln42_fu_231_p2[0:0] == 1'b1) ? p_load_reg_282 : add_ln42_1_fu_221_p2);

assign table_r_address1 = zext_ln42_1_fu_211_p1;

assign table_r_d0 = ap_sig_allocacmp_p_load;

assign trunc_ln16_fu_151_p1 = k_fu_52[11:0];

assign trunc_ln42_1_fu_188_p1 = add_ln42_fu_170_p2[9:0];

assign trunc_ln42_fu_176_p1 = add_ln42_fu_170_p2[5:0];

assign xor_ln42_fu_231_p2 = (icmp_ln42_fu_226_p2 ^ 1'd1);

assign zext_ln11_cast_fu_122_p1 = zext_ln11;

assign zext_ln42_1_fu_211_p1 = newSecond_fu_205_p2;

assign zext_ln42_fu_160_p1 = add_ln42_2_fu_155_p2;

assign zext_ln9_cast_fu_130_p1 = zext_ln9;

always @ (posedge ap_clk) begin
    zext_ln11_cast_reg_272[63:12] <= 52'b0000000000000000000000000000000000000000000000000000;
    add_ln16_cast_reg_277[63:12] <= 52'b0000000000000000000000000000000000000000000000000000;
end

endmodule //nussinov_nussinov_Pipeline_VITIS_LOOP_40_3
