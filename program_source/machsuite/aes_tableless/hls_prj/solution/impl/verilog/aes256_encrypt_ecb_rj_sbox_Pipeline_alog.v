// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module aes256_encrypt_ecb_rj_sbox_Pipeline_alog (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        sub_ln15,
        atb_9_out,
        atb_9_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] sub_ln15;
output  [7:0] atb_9_out;
output   atb_9_out_ap_vld;

reg ap_idle;
reg atb_9_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln15_fu_120_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [7:0] z_fu_42;
wire   [7:0] atb_7_fu_107_p2;
wire    ap_loop_init;
reg   [7:0] ap_sig_allocacmp_atb_8;
reg   [7:0] x_assign_1_fu_46;
wire   [7:0] add_ln15_fu_114_p2;
reg   [7:0] ap_sig_allocacmp_x_assign_1_load;
wire   [7:0] atb_fu_79_p2;
wire   [0:0] tmp_fu_85_p3;
wire   [7:0] atb_5_fu_93_p2;
wire   [7:0] atb_6_fu_99_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

aes256_encrypt_ecb_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln15_fu_120_p2 == 1'd0)) begin
            x_assign_1_fu_46 <= add_ln15_fu_114_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            x_assign_1_fu_46 <= sub_ln15;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln15_fu_120_p2 == 1'd0)) begin
            z_fu_42 <= atb_7_fu_107_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            z_fu_42 <= 8'd1;
        end
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (icmp_ln15_fu_120_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_atb_8 = 8'd1;
    end else begin
        ap_sig_allocacmp_atb_8 = z_fu_42;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_x_assign_1_load = sub_ln15;
    end else begin
        ap_sig_allocacmp_x_assign_1_load = x_assign_1_fu_46;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (icmp_ln15_fu_120_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        atb_9_out_ap_vld = 1'b1;
    end else begin
        atb_9_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln15_fu_114_p2 = ($signed(ap_sig_allocacmp_x_assign_1_load) + $signed(8'd255));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign atb_5_fu_93_p2 = (atb_fu_79_p2 ^ 8'd27);

assign atb_6_fu_99_p3 = ((tmp_fu_85_p3[0:0] == 1'b1) ? atb_5_fu_93_p2 : atb_fu_79_p2);

assign atb_7_fu_107_p2 = (atb_6_fu_99_p3 ^ ap_sig_allocacmp_atb_8);

assign atb_9_out = (atb_6_fu_99_p3 ^ ap_sig_allocacmp_atb_8);

assign atb_fu_79_p2 = ap_sig_allocacmp_atb_8 << 8'd1;

assign icmp_ln15_fu_120_p2 = ((ap_sig_allocacmp_x_assign_1_load == 8'd0) ? 1'b1 : 1'b0);

assign tmp_fu_85_p3 = ap_sig_allocacmp_atb_8[32'd7];

endmodule //aes256_encrypt_ecb_rj_sbox_Pipeline_alog
