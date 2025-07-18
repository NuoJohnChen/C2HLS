// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lu_lu_Pipeline_VITIS_LOOP_17_4_VITIS_LOOP_18_5 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        zext_ln8,
        mul_ln17,
        j_3,
        add_ln15,
        A_address0,
        A_ce0,
        A_we0,
        A_d0,
        A_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 5'd1;
parameter    ap_ST_fsm_pp0_stage1 = 5'd2;
parameter    ap_ST_fsm_pp0_stage2 = 5'd4;
parameter    ap_ST_fsm_pp0_stage3 = 5'd8;
parameter    ap_ST_fsm_pp0_stage4 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [5:0] zext_ln8;
input  [10:0] mul_ln17;
input  [5:0] j_3;
input  [10:0] add_ln15;
output  [10:0] A_address0;
output   A_ce0;
output   A_we0;
output  [63:0] A_d0;
input  [63:0] A_q0;

reg ap_idle;
reg[10:0] A_address0;
reg A_ce0;
reg A_we0;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_state5_pp0_stage4_iter0;
wire    ap_block_state10_pp0_stage4_iter1;
wire    ap_block_state15_pp0_stage4_iter2;
wire    ap_block_pp0_stage4_subdone;
reg   [0:0] icmp_ln17_reg_395;
reg    ap_condition_exit_pp0_iter0_stage4;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state6_pp0_stage0_iter1;
wire    ap_block_state11_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln17_fu_175_p2;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state7_pp0_stage1_iter1;
wire    ap_block_state12_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
wire   [5:0] select_ln8_fu_203_p3;
reg   [5:0] select_ln8_reg_399;
wire   [10:0] trunc_ln19_fu_219_p1;
reg   [10:0] trunc_ln19_reg_406;
wire   [10:0] add_ln19_fu_247_p2;
reg   [10:0] add_ln19_reg_417;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_state8_pp0_stage2_iter1;
wire    ap_block_state13_pp0_stage2_iter2;
wire    ap_block_pp0_stage2_11001;
reg   [63:0] A_load_reg_427;
reg   [63:0] A_load_1_reg_432;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state4_pp0_stage3_iter0;
wire    ap_block_state9_pp0_stage3_iter1;
wire    ap_block_state14_pp0_stage3_iter2;
wire    ap_block_pp0_stage3_11001;
wire    ap_block_pp0_stage4_11001;
reg   [10:0] A_addr_reg_447;
reg   [10:0] A_addr_reg_447_pp0_iter2_reg;
wire   [0:0] addr_cmp_fu_300_p2;
reg   [0:0] addr_cmp_reg_452;
reg   [63:0] A_load_2_reg_457;
wire   [63:0] grp_fu_139_p2;
reg   [63:0] mul1_reg_462;
wire   [63:0] bitcast_ln19_3_fu_335_p1;
reg   [63:0] bitcast_ln19_3_reg_472;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [63:0] zext_ln19_2_fu_232_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln19_4_fu_280_p1;
wire    ap_block_pp0_stage2;
wire   [63:0] zext_ln19_fu_293_p1;
wire    ap_block_pp0_stage0;
reg   [63:0] reuse_addr_reg_fu_62;
wire    ap_loop_init;
reg   [63:0] reuse_reg_fu_66;
wire    ap_block_pp0_stage4;
reg   [5:0] k_fu_70;
wire   [5:0] add_ln18_fu_311_p2;
reg   [63:0] j_fu_74;
wire   [63:0] select_ln17_fu_211_p3;
wire   [63:0] zext_ln8_cast_fu_143_p1;
reg   [10:0] indvar_flatten_fu_78;
wire   [10:0] add_ln17_1_fu_180_p2;
wire   [63:0] grp_fu_135_p0;
wire   [63:0] grp_fu_139_p0;
wire   [63:0] grp_fu_139_p1;
wire   [0:0] icmp_ln18_fu_198_p2;
wire   [63:0] add_ln17_fu_192_p2;
wire   [10:0] zext_ln19_1_fu_223_p1;
wire   [10:0] add_ln19_1_fu_227_p2;
wire   [8:0] tmp_3_fu_258_p3;
wire   [10:0] tmp_2_fu_251_p3;
wire   [10:0] zext_ln19_3_fu_265_p1;
wire   [10:0] add_ln19_2_fu_269_p2;
wire   [10:0] add_ln19_3_fu_275_p2;
wire   [63:0] reuse_select_fu_324_p3;
wire   [63:0] grp_fu_135_p2;
wire    ap_block_pp0_stage3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [4:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to2;
reg    ap_done_pending_pp0;
wire    ap_block_pp0_stage1_subdone;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_pp0_stage3_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

lu_dsub_64ns_64ns_64_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dsub_64ns_64ns_64_5_full_dsp_1_U10(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_135_p0),
    .din1(mul1_reg_462),
    .ce(1'b1),
    .dout(grp_fu_135_p2)
);

lu_dmul_64ns_64ns_64_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dmul_64ns_64ns_64_5_max_dsp_1_U11(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_139_p0),
    .din1(grp_fu_139_p1),
    .ce(1'b1),
    .dout(grp_fu_139_p2)
);

lu_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage4),
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
        end else if (((1'b0 == ap_block_pp0_stage4_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
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
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage4)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage4_subdone) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage4_subdone) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_fu_78 <= 11'd0;
    end else if (((icmp_ln17_fu_175_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        indvar_flatten_fu_78 <= add_ln17_1_fu_180_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        j_fu_74 <= zext_ln8_cast_fu_143_p1;
    end else if (((icmp_ln17_fu_175_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        j_fu_74 <= select_ln17_fu_211_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            k_fu_70 <= 6'd0;
        end else if (((icmp_ln17_reg_395 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            k_fu_70 <= add_ln18_fu_311_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_addr_reg_fu_62 <= 64'd18446744073709551615;
        end else if (((icmp_ln17_reg_395 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            reuse_addr_reg_fu_62 <= zext_ln19_fu_293_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        reuse_reg_fu_66 <= 64'd0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        reuse_reg_fu_66 <= bitcast_ln19_3_fu_335_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_395 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        A_addr_reg_447 <= zext_ln19_fu_293_p1;
        addr_cmp_reg_452 <= addr_cmp_fu_300_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        A_addr_reg_447_pp0_iter2_reg <= A_addr_reg_447;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_395 == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        A_load_1_reg_432 <= A_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        A_load_2_reg_457 <= A_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_395 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        A_load_reg_427 <= A_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_395 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        add_ln19_reg_417 <= add_ln19_fu_247_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage4_11001) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        bitcast_ln19_3_reg_472 <= bitcast_ln19_3_fu_335_p1;
        mul1_reg_462 <= grp_fu_139_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        icmp_ln17_reg_395 <= icmp_ln17_fu_175_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_175_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        select_ln8_reg_399 <= select_ln8_fu_203_p3;
        trunc_ln19_reg_406 <= trunc_ln19_fu_219_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage4) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        A_address0 = A_addr_reg_447_pp0_iter2_reg;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        A_address0 = zext_ln19_fu_293_p1;
    end else if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        A_address0 = zext_ln19_4_fu_280_p1;
    end else if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        A_address0 = zext_ln19_2_fu_232_p1;
    end else begin
        A_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage4_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4)) | ((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)))) begin
        A_ce0 = 1'b1;
    end else begin
        A_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage4_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        A_we0 = 1'b1;
    end else begin
        A_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln17_reg_395 == 1'd1) & (1'b0 == ap_block_pp0_stage4_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        ap_condition_exit_pp0_iter0_stage4 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage4 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage4_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (~((ap_loop_exit_ready == 1'b0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b0))) begin
        ap_done_pending_pp0 = 1'b1;
    end else begin
        ap_done_pending_pp0 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to2 = 1'b1;
    end else begin
        ap_idle_pp0_1to2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage4_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_done_pending_pp0 == 1'b0) & (ap_idle_pp0_1to2 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_d0 = bitcast_ln19_3_reg_472;

assign add_ln17_1_fu_180_p2 = (indvar_flatten_fu_78 + 11'd1);

assign add_ln17_fu_192_p2 = (j_fu_74 + 64'd1);

assign add_ln18_fu_311_p2 = (select_ln8_reg_399 + 6'd1);

assign add_ln19_1_fu_227_p2 = (add_ln15 + zext_ln19_1_fu_223_p1);

assign add_ln19_2_fu_269_p2 = (tmp_2_fu_251_p3 + zext_ln19_3_fu_265_p1);

assign add_ln19_3_fu_275_p2 = (add_ln19_2_fu_269_p2 + trunc_ln19_reg_406);

assign add_ln19_fu_247_p2 = (add_ln15 + trunc_ln19_reg_406);

assign addr_cmp_fu_300_p2 = ((reuse_addr_reg_fu_62 == zext_ln19_fu_293_p1) ? 1'b1 : 1'b0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage4_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage2_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage3_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage4_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage4;

assign bitcast_ln19_3_fu_335_p1 = grp_fu_135_p2;

assign grp_fu_135_p0 = reuse_select_fu_324_p3;

assign grp_fu_139_p0 = A_load_reg_427;

assign grp_fu_139_p1 = A_load_1_reg_432;

assign icmp_ln17_fu_175_p2 = ((indvar_flatten_fu_78 == mul_ln17) ? 1'b1 : 1'b0);

assign icmp_ln18_fu_198_p2 = ((k_fu_70 == j_3) ? 1'b1 : 1'b0);

assign reuse_select_fu_324_p3 = ((addr_cmp_reg_452[0:0] == 1'b1) ? reuse_reg_fu_66 : A_load_2_reg_457);

assign select_ln17_fu_211_p3 = ((icmp_ln18_fu_198_p2[0:0] == 1'b1) ? add_ln17_fu_192_p2 : j_fu_74);

assign select_ln8_fu_203_p3 = ((icmp_ln18_fu_198_p2[0:0] == 1'b1) ? 6'd0 : k_fu_70);

assign tmp_2_fu_251_p3 = {{select_ln8_reg_399}, {5'd0}};

assign tmp_3_fu_258_p3 = {{select_ln8_reg_399}, {3'd0}};

assign trunc_ln19_fu_219_p1 = select_ln17_fu_211_p3[10:0];

assign zext_ln19_1_fu_223_p1 = select_ln8_fu_203_p3;

assign zext_ln19_2_fu_232_p1 = add_ln19_1_fu_227_p2;

assign zext_ln19_3_fu_265_p1 = tmp_3_fu_258_p3;

assign zext_ln19_4_fu_280_p1 = add_ln19_3_fu_275_p2;

assign zext_ln19_fu_293_p1 = add_ln19_reg_417;

assign zext_ln8_cast_fu_143_p1 = zext_ln8;

endmodule //lu_lu_Pipeline_VITIS_LOOP_17_4_VITIS_LOOP_18_5
