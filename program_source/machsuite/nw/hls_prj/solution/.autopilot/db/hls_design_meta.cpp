#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("SEQA_address0", 7, hls_out, 0, "ap_memory", "mem_address", 1),
	Port_Property("SEQA_ce0", 1, hls_out, 0, "ap_memory", "mem_ce", 1),
	Port_Property("SEQA_q0", 8, hls_in, 0, "ap_memory", "mem_dout", 1),
	Port_Property("SEQB_address0", 7, hls_out, 1, "ap_memory", "mem_address", 1),
	Port_Property("SEQB_ce0", 1, hls_out, 1, "ap_memory", "mem_ce", 1),
	Port_Property("SEQB_q0", 8, hls_in, 1, "ap_memory", "mem_dout", 1),
	Port_Property("alignedA_address0", 8, hls_out, 2, "ap_memory", "mem_address", 1),
	Port_Property("alignedA_ce0", 1, hls_out, 2, "ap_memory", "mem_ce", 1),
	Port_Property("alignedA_we0", 1, hls_out, 2, "ap_memory", "mem_we", 1),
	Port_Property("alignedA_d0", 8, hls_out, 2, "ap_memory", "mem_din", 1),
	Port_Property("alignedA_address1", 8, hls_out, 2, "ap_memory", "MemPortADDR2", 1),
	Port_Property("alignedA_ce1", 1, hls_out, 2, "ap_memory", "MemPortCE2", 1),
	Port_Property("alignedA_we1", 1, hls_out, 2, "ap_memory", "MemPortWE2", 1),
	Port_Property("alignedA_d1", 8, hls_out, 2, "ap_memory", "MemPortDIN2", 1),
	Port_Property("alignedB_address0", 8, hls_out, 3, "ap_memory", "mem_address", 1),
	Port_Property("alignedB_ce0", 1, hls_out, 3, "ap_memory", "mem_ce", 1),
	Port_Property("alignedB_we0", 1, hls_out, 3, "ap_memory", "mem_we", 1),
	Port_Property("alignedB_d0", 8, hls_out, 3, "ap_memory", "mem_din", 1),
	Port_Property("alignedB_address1", 8, hls_out, 3, "ap_memory", "MemPortADDR2", 1),
	Port_Property("alignedB_ce1", 1, hls_out, 3, "ap_memory", "MemPortCE2", 1),
	Port_Property("alignedB_we1", 1, hls_out, 3, "ap_memory", "MemPortWE2", 1),
	Port_Property("alignedB_d1", 8, hls_out, 3, "ap_memory", "MemPortDIN2", 1),
	Port_Property("M_address0", 15, hls_out, 4, "ap_memory", "mem_address", 1),
	Port_Property("M_ce0", 1, hls_out, 4, "ap_memory", "mem_ce", 1),
	Port_Property("M_we0", 1, hls_out, 4, "ap_memory", "mem_we", 1),
	Port_Property("M_d0", 32, hls_out, 4, "ap_memory", "mem_din", 1),
	Port_Property("M_q0", 32, hls_in, 4, "ap_memory", "mem_dout", 1),
	Port_Property("M_address1", 15, hls_out, 4, "ap_memory", "MemPortADDR2", 1),
	Port_Property("M_ce1", 1, hls_out, 4, "ap_memory", "MemPortCE2", 1),
	Port_Property("M_q1", 32, hls_in, 4, "ap_memory", "MemPortDOUT2", 1),
	Port_Property("ptr_address0", 15, hls_out, 5, "ap_memory", "mem_address", 1),
	Port_Property("ptr_ce0", 1, hls_out, 5, "ap_memory", "mem_ce", 1),
	Port_Property("ptr_we0", 1, hls_out, 5, "ap_memory", "mem_we", 1),
	Port_Property("ptr_d0", 8, hls_out, 5, "ap_memory", "mem_din", 1),
	Port_Property("ptr_q0", 8, hls_in, 5, "ap_memory", "mem_dout", 1),
};
const char* HLS_Design_Meta::dut_name = "needwun";
