// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module k2mm_k2mm_Pipeline_lpwr_1_lpwr_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        E_out_address0,
        E_out_ce0,
        E_out_we0,
        E_out_d0,
        buff_E_out_address0,
        buff_E_out_ce0,
        buff_E_out_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [11:0] E_out_address0;
output   E_out_ce0;
output   E_out_we0;
output  [31:0] E_out_d0;
output  [11:0] buff_E_out_address0;
output   buff_E_out_ce0;
input  [31:0] buff_E_out_q0;

reg ap_idle;
reg E_out_ce0;
reg E_out_we0;
reg buff_E_out_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln50_fu_104_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [63:0] zext_ln52_1_fu_172_p1;
reg   [63:0] zext_ln52_1_reg_227;
wire    ap_block_pp0_stage0_11001;
wire    ap_block_pp0_stage0;
reg   [6:0] j_fu_48;
wire   [6:0] add_ln51_fu_177_p2;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_j_load;
reg   [6:0] i_fu_52;
wire   [6:0] select_ln50_1_fu_142_p3;
reg   [6:0] ap_sig_allocacmp_i_load;
reg   [12:0] indvar_flatten352_fu_56;
wire   [12:0] add_ln50_1_fu_110_p2;
reg   [12:0] ap_sig_allocacmp_indvar_flatten352_load;
wire   [0:0] icmp_ln51_fu_128_p2;
wire   [6:0] add_ln50_fu_122_p2;
wire   [5:0] trunc_ln52_fu_150_p1;
wire   [6:0] select_ln50_fu_134_p3;
wire   [11:0] tmp_s_fu_154_p3;
wire   [11:0] zext_ln52_fu_162_p1;
wire   [11:0] add_ln52_fu_166_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

k2mm_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln50_fu_104_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_52 <= select_ln50_1_fu_142_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_52 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln50_fu_104_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten352_fu_56 <= add_ln50_1_fu_110_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten352_fu_56 <= 13'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln50_fu_104_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            j_fu_48 <= add_ln51_fu_177_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_48 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln50_fu_104_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        zext_ln52_1_reg_227[11 : 0] <= zext_ln52_1_fu_172_p1[11 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        E_out_ce0 = 1'b1;
    end else begin
        E_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        E_out_we0 = 1'b1;
    end else begin
        E_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln50_fu_104_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_load = 7'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_52;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten352_load = 13'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten352_load = indvar_flatten352_fu_56;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_j_load = 7'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_48;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        buff_E_out_ce0 = 1'b1;
    end else begin
        buff_E_out_ce0 = 1'b0;
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

assign E_out_address0 = zext_ln52_1_reg_227;

assign E_out_d0 = buff_E_out_q0;

assign add_ln50_1_fu_110_p2 = (ap_sig_allocacmp_indvar_flatten352_load + 13'd1);

assign add_ln50_fu_122_p2 = (ap_sig_allocacmp_i_load + 7'd1);

assign add_ln51_fu_177_p2 = (select_ln50_fu_134_p3 + 7'd1);

assign add_ln52_fu_166_p2 = (tmp_s_fu_154_p3 + zext_ln52_fu_162_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign buff_E_out_address0 = zext_ln52_1_fu_172_p1;

assign icmp_ln50_fu_104_p2 = ((ap_sig_allocacmp_indvar_flatten352_load == 13'd4096) ? 1'b1 : 1'b0);

assign icmp_ln51_fu_128_p2 = ((ap_sig_allocacmp_j_load == 7'd64) ? 1'b1 : 1'b0);

assign select_ln50_1_fu_142_p3 = ((icmp_ln51_fu_128_p2[0:0] == 1'b1) ? add_ln50_fu_122_p2 : ap_sig_allocacmp_i_load);

assign select_ln50_fu_134_p3 = ((icmp_ln51_fu_128_p2[0:0] == 1'b1) ? 7'd0 : ap_sig_allocacmp_j_load);

assign tmp_s_fu_154_p3 = {{trunc_ln52_fu_150_p1}, {6'd0}};

assign trunc_ln52_fu_150_p1 = select_ln50_1_fu_142_p3[5:0];

assign zext_ln52_1_fu_172_p1 = add_ln52_fu_166_p2;

assign zext_ln52_fu_162_p1 = select_ln50_fu_134_p3;

always @ (posedge ap_clk) begin
    zext_ln52_1_reg_227[63:12] <= 52'b0000000000000000000000000000000000000000000000000000;
end

endmodule //k2mm_k2mm_Pipeline_lpwr_1_lpwr_2
