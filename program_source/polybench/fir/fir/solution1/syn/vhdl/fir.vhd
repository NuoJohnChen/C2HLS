-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
-- Version: 2022.2.2
-- Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    input_r : IN STD_LOGIC_VECTOR (31 downto 0);
    output_r : OUT STD_LOGIC_VECTOR (31 downto 0);
    output_r_ap_vld : OUT STD_LOGIC;
    taps_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    taps_ce0 : OUT STD_LOGIC;
    taps_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of fir is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fir_fir,hls_ip_2022_2_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu55c-fsvh2892-2L-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.170000,HLS_SYN_LAT=50,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=195,HLS_SYN_LUT=333,HLS_VERSION=2022_2_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal delay_lane_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal delay_lane_ce0 : STD_LOGIC;
    signal delay_lane_we0 : STD_LOGIC;
    signal delay_lane_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal delay_lane_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal delay_lane_ce1 : STD_LOGIC;
    signal delay_lane_q1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_done : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_idle : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_ready : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_ce0 : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_we0 : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_address1 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_ce1 : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_done : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_idle : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_ready : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_taps_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_taps_ce0 : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_result_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_result_out_ap_vld : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_delay_lane_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_delay_lane_ce0 : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fir_fir_Pipeline_VITIS_LOOP_9_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        delay_lane_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        delay_lane_ce0 : OUT STD_LOGIC;
        delay_lane_we0 : OUT STD_LOGIC;
        delay_lane_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        delay_lane_address1 : OUT STD_LOGIC_VECTOR (4 downto 0);
        delay_lane_ce1 : OUT STD_LOGIC;
        delay_lane_q1 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_fir_Pipeline_VITIS_LOOP_14_2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        taps_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        taps_ce0 : OUT STD_LOGIC;
        taps_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        result_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        result_out_ap_vld : OUT STD_LOGIC;
        delay_lane_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        delay_lane_ce0 : OUT STD_LOGIC;
        delay_lane_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_delay_lane_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        address1 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    delay_lane_U : component fir_delay_lane_RAM_AUTO_1R1W
    generic map (
        DataWidth => 32,
        AddressRange => 20,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => delay_lane_address0,
        ce0 => delay_lane_ce0,
        we0 => delay_lane_we0,
        d0 => delay_lane_d0,
        q0 => delay_lane_q0,
        address1 => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_address1,
        ce1 => delay_lane_ce1,
        q1 => delay_lane_q1);

    grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62 : component fir_fir_Pipeline_VITIS_LOOP_9_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start,
        ap_done => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_done,
        ap_idle => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_idle,
        ap_ready => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_ready,
        delay_lane_address0 => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_address0,
        delay_lane_ce0 => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_ce0,
        delay_lane_we0 => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_we0,
        delay_lane_d0 => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_d0,
        delay_lane_address1 => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_address1,
        delay_lane_ce1 => grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_ce1,
        delay_lane_q1 => delay_lane_q1);

    grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68 : component fir_fir_Pipeline_VITIS_LOOP_14_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start,
        ap_done => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_done,
        ap_idle => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_idle,
        ap_ready => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_ready,
        taps_address0 => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_taps_address0,
        taps_ce0 => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_taps_ce0,
        taps_q0 => taps_q0,
        result_out => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_result_out,
        result_out_ap_vld => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_result_out_ap_vld,
        delay_lane_address0 => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_delay_lane_address0,
        delay_lane_ce0 => grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_delay_lane_ce0,
        delay_lane_q0 => delay_lane_q0);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_ready = ap_const_logic_1)) then 
                    grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_ready = ap_const_logic_1)) then 
                    grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_done, grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state5)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_done)
    begin
        if ((grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_done)
    begin
        if ((grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state6_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    delay_lane_address0_assign_proc : process(grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_address0, grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_delay_lane_address0, ap_CS_fsm_state2, ap_CS_fsm_state5, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            delay_lane_address0 <= ap_const_lv5_0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            delay_lane_address0 <= grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_delay_lane_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            delay_lane_address0 <= grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_address0;
        else 
            delay_lane_address0 <= "XXXXX";
        end if; 
    end process;


    delay_lane_ce0_assign_proc : process(grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_ce0, grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_delay_lane_ce0, ap_CS_fsm_state2, ap_CS_fsm_state5, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            delay_lane_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            delay_lane_ce0 <= grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_delay_lane_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            delay_lane_ce0 <= grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_ce0;
        else 
            delay_lane_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    delay_lane_ce1_assign_proc : process(grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_ce1, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            delay_lane_ce1 <= grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_ce1;
        else 
            delay_lane_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    delay_lane_d0_assign_proc : process(input_r, grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_d0, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            delay_lane_d0 <= input_r;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            delay_lane_d0 <= grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_d0;
        else 
            delay_lane_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    delay_lane_we0_assign_proc : process(grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_we0, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            delay_lane_we0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            delay_lane_we0 <= grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_delay_lane_we0;
        else 
            delay_lane_we0 <= ap_const_logic_0;
        end if; 
    end process;

    grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start <= grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_ap_start_reg;
    grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start <= grp_fir_Pipeline_VITIS_LOOP_9_1_fu_62_ap_start_reg;
    output_r <= grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_result_out;

    output_r_ap_vld_assign_proc : process(ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            output_r_ap_vld <= ap_const_logic_1;
        else 
            output_r_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    taps_address0 <= grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_taps_address0;
    taps_ce0 <= grp_fir_Pipeline_VITIS_LOOP_14_2_fu_68_taps_ce0;
end behav;
