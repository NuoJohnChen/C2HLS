// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="ms_mergesort_ms_mergesort,hls_ip_2022_2_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu55c-fsvh2892-2L-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.265000,HLS_SYN_LAT=20263959,HLS_SYN_TPT=none,HLS_SYN_MEM=4,HLS_SYN_DSP=0,HLS_SYN_FF=776,HLS_SYN_LUT=1130,HLS_VERSION=2022_2_2}" *)

module ms_mergesort (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a_address0,
        a_ce0,
        a_we0,
        a_d0,
        a_q0
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
output  [10:0] a_address0;
output   a_ce0;
output   a_we0;
output  [31:0] a_d0;
input  [31:0] a_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg a_ce0;
reg a_we0;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] m_2_fu_99_p2;
reg   [31:0] m_2_reg_175;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln41_fu_93_p2;
wire   [31:0] mid_fu_126_p2;
reg   [31:0] mid_reg_184;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln43_fu_115_p2;
wire   [31:0] to_fu_132_p2;
reg   [31:0] to_reg_189;
wire   [0:0] icmp_ln48_fu_147_p2;
reg   [0:0] icmp_ln48_reg_194;
wire   [31:0] i_fu_157_p2;
wire    ap_CS_fsm_state5;
wire    grp_merge_1_fu_64_ap_start;
wire    grp_merge_1_fu_64_ap_done;
wire    grp_merge_1_fu_64_ap_idle;
wire    grp_merge_1_fu_64_ap_ready;
wire   [10:0] grp_merge_1_fu_64_a_address0;
wire    grp_merge_1_fu_64_a_ce0;
wire    grp_merge_1_fu_64_a_we0;
wire   [31:0] grp_merge_1_fu_64_a_d0;
reg   [31:0] grp_merge_1_fu_64_stop;
reg   [31:0] i_2_reg_52;
reg    ap_block_state5_on_subcall_done;
reg    grp_merge_1_fu_64_ap_start_reg;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state6;
reg   [31:0] m_fu_48;
wire   [20:0] tmp_fu_83_p4;
wire   [20:0] tmp_1_fu_105_p4;
wire   [31:0] add_ln46_fu_121_p2;
wire   [20:0] tmp_2_fu_137_p4;
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
#0 grp_merge_1_fu_64_ap_start_reg = 1'b0;
end

ms_mergesort_merge_1 grp_merge_1_fu_64(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_merge_1_fu_64_ap_start),
    .ap_done(grp_merge_1_fu_64_ap_done),
    .ap_idle(grp_merge_1_fu_64_ap_idle),
    .ap_ready(grp_merge_1_fu_64_ap_ready),
    .a_address0(grp_merge_1_fu_64_a_address0),
    .a_ce0(grp_merge_1_fu_64_a_ce0),
    .a_we0(grp_merge_1_fu_64_a_we0),
    .a_d0(grp_merge_1_fu_64_a_d0),
    .a_q0(a_q0),
    .start_r(i_2_reg_52),
    .m(mid_reg_184),
    .stop(grp_merge_1_fu_64_stop)
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
        grp_merge_1_fu_64_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
            grp_merge_1_fu_64_ap_start_reg <= 1'b1;
        end else if ((grp_merge_1_fu_64_ap_ready == 1'b1)) begin
            grp_merge_1_fu_64_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state5_on_subcall_done) & (1'b1 == ap_CS_fsm_state5))) begin
        i_2_reg_52 <= i_fu_157_p2;
    end else if (((icmp_ln41_fu_93_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        i_2_reg_52 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        m_fu_48 <= 32'd1;
    end else if (((icmp_ln43_fu_115_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        m_fu_48 <= m_2_reg_175;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln43_fu_115_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        icmp_ln48_reg_194 <= icmp_ln48_fu_147_p2;
        mid_reg_184 <= mid_fu_126_p2;
        to_reg_189 <= to_fu_132_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln41_fu_93_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        m_2_reg_175[31 : 1] <= m_2_fu_99_p2[31 : 1];
    end
end

always @ (*) begin
    if ((((icmp_ln48_reg_194 == 1'd1) & (1'b1 == ap_CS_fsm_state5)) | ((icmp_ln48_reg_194 == 1'd0) & (1'b1 == ap_CS_fsm_state5)))) begin
        a_ce0 = grp_merge_1_fu_64_a_ce0;
    end else begin
        a_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln48_reg_194 == 1'd1) & (1'b1 == ap_CS_fsm_state5)) | ((icmp_ln48_reg_194 == 1'd0) & (1'b1 == ap_CS_fsm_state5)))) begin
        a_we0 = grp_merge_1_fu_64_a_we0;
    end else begin
        a_we0 = 1'b0;
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
    if ((1'b1 == ap_block_state5_on_subcall_done)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

always @ (*) begin
    if (((icmp_ln41_fu_93_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln41_fu_93_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        if ((icmp_ln48_reg_194 == 1'd1)) begin
            grp_merge_1_fu_64_stop = to_reg_189;
        end else if ((icmp_ln48_reg_194 == 1'd0)) begin
            grp_merge_1_fu_64_stop = 32'd2048;
        end else begin
            grp_merge_1_fu_64_stop = 'bx;
        end
    end else begin
        grp_merge_1_fu_64_stop = 'bx;
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
            if (((icmp_ln41_fu_93_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((icmp_ln43_fu_115_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((icmp_ln48_fu_147_p2 == 1'd1) & (icmp_ln43_fu_115_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b0 == ap_block_state5_on_subcall_done) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_address0 = grp_merge_1_fu_64_a_address0;

assign a_d0 = grp_merge_1_fu_64_a_d0;

assign add_ln46_fu_121_p2 = (i_2_reg_52 + m_fu_48);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state5_on_subcall_done = (((grp_merge_1_fu_64_ap_done == 1'b0) & (icmp_ln48_reg_194 == 1'd1)) | ((grp_merge_1_fu_64_ap_done == 1'b0) & (icmp_ln48_reg_194 == 1'd0)));
end

assign grp_merge_1_fu_64_ap_start = grp_merge_1_fu_64_ap_start_reg;

assign i_fu_157_p2 = (m_2_reg_175 + i_2_reg_52);

assign icmp_ln41_fu_93_p2 = (($signed(tmp_fu_83_p4) < $signed(21'd1)) ? 1'b1 : 1'b0);

assign icmp_ln43_fu_115_p2 = (($signed(tmp_1_fu_105_p4) < $signed(21'd1)) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_147_p2 = (($signed(tmp_2_fu_137_p4) < $signed(21'd1)) ? 1'b1 : 1'b0);

assign m_2_fu_99_p2 = m_fu_48 << 32'd1;

assign mid_fu_126_p2 = ($signed(add_ln46_fu_121_p2) + $signed(32'd4294967295));

assign tmp_1_fu_105_p4 = {{i_2_reg_52[31:11]}};

assign tmp_2_fu_137_p4 = {{to_fu_132_p2[31:11]}};

assign tmp_fu_83_p4 = {{m_fu_48[31:11]}};

assign to_fu_132_p2 = (mid_fu_126_p2 + m_fu_48);

always @ (posedge ap_clk) begin
    m_2_reg_175[0] <= 1'b0;
end

endmodule //ms_mergesort
