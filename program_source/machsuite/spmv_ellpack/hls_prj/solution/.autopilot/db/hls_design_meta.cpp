#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("nzval_address0", 20, hls_out, 0, "ap_memory", "mem_address", 1),
	Port_Property("nzval_ce0", 1, hls_out, 0, "ap_memory", "mem_ce", 1),
	Port_Property("nzval_q0", 64, hls_in, 0, "ap_memory", "mem_dout", 1),
	Port_Property("cols_address0", 20, hls_out, 1, "ap_memory", "mem_address", 1),
	Port_Property("cols_ce0", 1, hls_out, 1, "ap_memory", "mem_ce", 1),
	Port_Property("cols_q0", 32, hls_in, 1, "ap_memory", "mem_dout", 1),
	Port_Property("vec_address0", 10, hls_out, 2, "ap_memory", "mem_address", 1),
	Port_Property("vec_ce0", 1, hls_out, 2, "ap_memory", "mem_ce", 1),
	Port_Property("vec_q0", 64, hls_in, 2, "ap_memory", "mem_dout", 1),
	Port_Property("out_r_address0", 10, hls_out, 3, "ap_memory", "mem_address", 1),
	Port_Property("out_r_ce0", 1, hls_out, 3, "ap_memory", "mem_ce", 1),
	Port_Property("out_r_we0", 1, hls_out, 3, "ap_memory", "mem_we", 1),
	Port_Property("out_r_d0", 64, hls_out, 3, "ap_memory", "mem_din", 1),
	Port_Property("out_r_q0", 64, hls_in, 3, "ap_memory", "mem_dout", 1),
};
const char* HLS_Design_Meta::dut_name = "spmv_ellpack";
