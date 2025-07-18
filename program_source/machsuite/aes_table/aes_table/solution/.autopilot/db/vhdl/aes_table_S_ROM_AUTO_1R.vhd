-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
-- Version: 2022.2.2
-- Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity aes_table_S_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 8; 
             AddressWidth     : integer := 8; 
             AddressRange    : integer := 256
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);
 
          address1        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce1             : in std_logic; 
          q1              : out std_logic_vector(DataWidth-1 downto 0);
 
          address2        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce2             : in std_logic; 
          q2              : out std_logic_vector(DataWidth-1 downto 0);
 
          address3        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce3             : in std_logic; 
          q3              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of aes_table_S_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0);  
signal address1_tmp : std_logic_vector(AddressWidth-1 downto 0);  
signal address2_tmp : std_logic_vector(AddressWidth-1 downto 0);  
signal address3_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "01100011", 1 => "01111100", 2 => "01110111", 3 => "01111011", 
    4 => "11110010", 5 => "01101011", 6 => "01101111", 7 => "11000101", 
    8 => "00110000", 9 => "00000001", 10 => "01100111", 11 => "00101011", 
    12 => "11111110", 13 => "11010111", 14 => "10101011", 15 => "01110110", 
    16 => "11001010", 17 => "10000010", 18 => "11001001", 19 => "01111101", 
    20 => "11111010", 21 => "01011001", 22 => "01000111", 23 => "11110000", 
    24 => "10101101", 25 => "11010100", 26 => "10100010", 27 => "10101111", 
    28 => "10011100", 29 => "10100100", 30 => "01110010", 31 => "11000000", 
    32 => "10110111", 33 => "11111101", 34 => "10010011", 35 => "00100110", 
    36 => "00110110", 37 => "00111111", 38 => "11110111", 39 => "11001100", 
    40 => "00110100", 41 => "10100101", 42 => "11100101", 43 => "11110001", 
    44 => "01110001", 45 => "11011000", 46 => "00110001", 47 => "00010101", 
    48 => "00000100", 49 => "11000111", 50 => "00100011", 51 => "11000011", 
    52 => "00011000", 53 => "10010110", 54 => "00000101", 55 => "10011010", 
    56 => "00000111", 57 => "00010010", 58 => "10000000", 59 => "11100010", 
    60 => "11101011", 61 => "00100111", 62 => "10110010", 63 => "01110101", 
    64 => "00001001", 65 => "10000011", 66 => "00101100", 67 => "00011010", 
    68 => "00011011", 69 => "01101110", 70 => "01011010", 71 => "10100000", 
    72 => "01010010", 73 => "00111011", 74 => "11010110", 75 => "10110011", 
    76 => "00101001", 77 => "11100011", 78 => "00101111", 79 => "10000100", 
    80 => "01010011", 81 => "11010001", 82 => "00000000", 83 => "11101101", 
    84 => "00100000", 85 => "11111100", 86 => "10110001", 87 => "01011011", 
    88 => "01101010", 89 => "11001011", 90 => "10111110", 91 => "00111001", 
    92 => "01001010", 93 => "01001100", 94 => "01011000", 95 => "11001111", 
    96 => "11010000", 97 => "11101111", 98 => "10101010", 99 => "11111011", 
    100 => "01000011", 101 => "01001101", 102 => "00110011", 103 => "10000101", 
    104 => "01000101", 105 => "11111001", 106 => "00000010", 107 => "01111111", 
    108 => "01010000", 109 => "00111100", 110 => "10011111", 111 => "10101000", 
    112 => "01010001", 113 => "10100011", 114 => "01000000", 115 => "10001111", 
    116 => "10010010", 117 => "10011101", 118 => "00111000", 119 => "11110101", 
    120 => "10111100", 121 => "10110110", 122 => "11011010", 123 => "00100001", 
    124 => "00010000", 125 => "11111111", 126 => "11110011", 127 => "11010010", 
    128 => "11001101", 129 => "00001100", 130 => "00010011", 131 => "11101100", 
    132 => "01011111", 133 => "10010111", 134 => "01000100", 135 => "00010111", 
    136 => "11000100", 137 => "10100111", 138 => "01111110", 139 => "00111101", 
    140 => "01100100", 141 => "01011101", 142 => "00011001", 143 => "01110011", 
    144 => "01100000", 145 => "10000001", 146 => "01001111", 147 => "11011100", 
    148 => "00100010", 149 => "00101010", 150 => "10010000", 151 => "10001000", 
    152 => "01000110", 153 => "11101110", 154 => "10111000", 155 => "00010100", 
    156 => "11011110", 157 => "01011110", 158 => "00001011", 159 => "11011011", 
    160 => "11100000", 161 => "00110010", 162 => "00111010", 163 => "00001010", 
    164 => "01001001", 165 => "00000110", 166 => "00100100", 167 => "01011100", 
    168 => "11000010", 169 => "11010011", 170 => "10101100", 171 => "01100010", 
    172 => "10010001", 173 => "10010101", 174 => "11100100", 175 => "01111001", 
    176 => "11100111", 177 => "11001000", 178 => "00110111", 179 => "01101101", 
    180 => "10001101", 181 => "11010101", 182 => "01001110", 183 => "10101001", 
    184 => "01101100", 185 => "01010110", 186 => "11110100", 187 => "11101010", 
    188 => "01100101", 189 => "01111010", 190 => "10101110", 191 => "00001000", 
    192 => "10111010", 193 => "01111000", 194 => "00100101", 195 => "00101110", 
    196 => "00011100", 197 => "10100110", 198 => "10110100", 199 => "11000110", 
    200 => "11101000", 201 => "11011101", 202 => "01110100", 203 => "00011111", 
    204 => "01001011", 205 => "10111101", 206 => "10001011", 207 => "10001010", 
    208 => "01110000", 209 => "00111110", 210 => "10110101", 211 => "01100110", 
    212 => "01001000", 213 => "00000011", 214 => "11110110", 215 => "00001110", 
    216 => "01100001", 217 => "00110101", 218 => "01010111", 219 => "10111001", 
    220 => "10000110", 221 => "11000001", 222 => "00011101", 223 => "10011110", 
    224 => "11100001", 225 => "11111000", 226 => "10011000", 227 => "00010001", 
    228 => "01101001", 229 => "11011001", 230 => "10001110", 231 => "10010100", 
    232 => "10011011", 233 => "00011110", 234 => "10000111", 235 => "11101001", 
    236 => "11001110", 237 => "01010101", 238 => "00101000", 239 => "11011111", 
    240 => "10001100", 241 => "10100001", 242 => "10001001", 243 => "00001101", 
    244 => "10111111", 245 => "11100110", 246 => "01000010", 247 => "01101000", 
    248 => "01000001", 249 => "10011001", 250 => "00101101", 251 => "00001111", 
    252 => "10110000", 253 => "01010100", 254 => "10111011", 255 => "00010110");

signal mem1 : mem_array := (
    0 => "01100011", 1 => "01111100", 2 => "01110111", 3 => "01111011", 
    4 => "11110010", 5 => "01101011", 6 => "01101111", 7 => "11000101", 
    8 => "00110000", 9 => "00000001", 10 => "01100111", 11 => "00101011", 
    12 => "11111110", 13 => "11010111", 14 => "10101011", 15 => "01110110", 
    16 => "11001010", 17 => "10000010", 18 => "11001001", 19 => "01111101", 
    20 => "11111010", 21 => "01011001", 22 => "01000111", 23 => "11110000", 
    24 => "10101101", 25 => "11010100", 26 => "10100010", 27 => "10101111", 
    28 => "10011100", 29 => "10100100", 30 => "01110010", 31 => "11000000", 
    32 => "10110111", 33 => "11111101", 34 => "10010011", 35 => "00100110", 
    36 => "00110110", 37 => "00111111", 38 => "11110111", 39 => "11001100", 
    40 => "00110100", 41 => "10100101", 42 => "11100101", 43 => "11110001", 
    44 => "01110001", 45 => "11011000", 46 => "00110001", 47 => "00010101", 
    48 => "00000100", 49 => "11000111", 50 => "00100011", 51 => "11000011", 
    52 => "00011000", 53 => "10010110", 54 => "00000101", 55 => "10011010", 
    56 => "00000111", 57 => "00010010", 58 => "10000000", 59 => "11100010", 
    60 => "11101011", 61 => "00100111", 62 => "10110010", 63 => "01110101", 
    64 => "00001001", 65 => "10000011", 66 => "00101100", 67 => "00011010", 
    68 => "00011011", 69 => "01101110", 70 => "01011010", 71 => "10100000", 
    72 => "01010010", 73 => "00111011", 74 => "11010110", 75 => "10110011", 
    76 => "00101001", 77 => "11100011", 78 => "00101111", 79 => "10000100", 
    80 => "01010011", 81 => "11010001", 82 => "00000000", 83 => "11101101", 
    84 => "00100000", 85 => "11111100", 86 => "10110001", 87 => "01011011", 
    88 => "01101010", 89 => "11001011", 90 => "10111110", 91 => "00111001", 
    92 => "01001010", 93 => "01001100", 94 => "01011000", 95 => "11001111", 
    96 => "11010000", 97 => "11101111", 98 => "10101010", 99 => "11111011", 
    100 => "01000011", 101 => "01001101", 102 => "00110011", 103 => "10000101", 
    104 => "01000101", 105 => "11111001", 106 => "00000010", 107 => "01111111", 
    108 => "01010000", 109 => "00111100", 110 => "10011111", 111 => "10101000", 
    112 => "01010001", 113 => "10100011", 114 => "01000000", 115 => "10001111", 
    116 => "10010010", 117 => "10011101", 118 => "00111000", 119 => "11110101", 
    120 => "10111100", 121 => "10110110", 122 => "11011010", 123 => "00100001", 
    124 => "00010000", 125 => "11111111", 126 => "11110011", 127 => "11010010", 
    128 => "11001101", 129 => "00001100", 130 => "00010011", 131 => "11101100", 
    132 => "01011111", 133 => "10010111", 134 => "01000100", 135 => "00010111", 
    136 => "11000100", 137 => "10100111", 138 => "01111110", 139 => "00111101", 
    140 => "01100100", 141 => "01011101", 142 => "00011001", 143 => "01110011", 
    144 => "01100000", 145 => "10000001", 146 => "01001111", 147 => "11011100", 
    148 => "00100010", 149 => "00101010", 150 => "10010000", 151 => "10001000", 
    152 => "01000110", 153 => "11101110", 154 => "10111000", 155 => "00010100", 
    156 => "11011110", 157 => "01011110", 158 => "00001011", 159 => "11011011", 
    160 => "11100000", 161 => "00110010", 162 => "00111010", 163 => "00001010", 
    164 => "01001001", 165 => "00000110", 166 => "00100100", 167 => "01011100", 
    168 => "11000010", 169 => "11010011", 170 => "10101100", 171 => "01100010", 
    172 => "10010001", 173 => "10010101", 174 => "11100100", 175 => "01111001", 
    176 => "11100111", 177 => "11001000", 178 => "00110111", 179 => "01101101", 
    180 => "10001101", 181 => "11010101", 182 => "01001110", 183 => "10101001", 
    184 => "01101100", 185 => "01010110", 186 => "11110100", 187 => "11101010", 
    188 => "01100101", 189 => "01111010", 190 => "10101110", 191 => "00001000", 
    192 => "10111010", 193 => "01111000", 194 => "00100101", 195 => "00101110", 
    196 => "00011100", 197 => "10100110", 198 => "10110100", 199 => "11000110", 
    200 => "11101000", 201 => "11011101", 202 => "01110100", 203 => "00011111", 
    204 => "01001011", 205 => "10111101", 206 => "10001011", 207 => "10001010", 
    208 => "01110000", 209 => "00111110", 210 => "10110101", 211 => "01100110", 
    212 => "01001000", 213 => "00000011", 214 => "11110110", 215 => "00001110", 
    216 => "01100001", 217 => "00110101", 218 => "01010111", 219 => "10111001", 
    220 => "10000110", 221 => "11000001", 222 => "00011101", 223 => "10011110", 
    224 => "11100001", 225 => "11111000", 226 => "10011000", 227 => "00010001", 
    228 => "01101001", 229 => "11011001", 230 => "10001110", 231 => "10010100", 
    232 => "10011011", 233 => "00011110", 234 => "10000111", 235 => "11101001", 
    236 => "11001110", 237 => "01010101", 238 => "00101000", 239 => "11011111", 
    240 => "10001100", 241 => "10100001", 242 => "10001001", 243 => "00001101", 
    244 => "10111111", 245 => "11100110", 246 => "01000010", 247 => "01101000", 
    248 => "01000001", 249 => "10011001", 250 => "00101101", 251 => "00001111", 
    252 => "10110000", 253 => "01010100", 254 => "10111011", 255 => "00010110");



begin 

 
memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;
 
memory_access_guard_1: process (address1) 
begin
      address1_tmp <= address1;
--synthesis translate_off
      if (CONV_INTEGER(address1) > AddressRange-1) then
           address1_tmp <= (others => '0');
      else 
           address1_tmp <= address1;
      end if;
--synthesis translate_on
end process;
 
memory_access_guard_2: process (address2) 
begin
      address2_tmp <= address2;
--synthesis translate_off
      if (CONV_INTEGER(address2) > AddressRange-1) then
           address2_tmp <= (others => '0');
      else 
           address2_tmp <= address2;
      end if;
--synthesis translate_on
end process;
 
memory_access_guard_3: process (address3) 
begin
      address3_tmp <= address3;
--synthesis translate_off
      if (CONV_INTEGER(address3) > AddressRange-1) then
           address3_tmp <= (others => '0');
      else 
           address3_tmp <= address3;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
 
        if (ce0 = '1') then  
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;
 
        if (ce1 = '1') then  
            q1 <= mem0(CONV_INTEGER(address1_tmp)); 
        end if;
 
        if (ce2 = '1') then  
            q2 <= mem1(CONV_INTEGER(address2_tmp)); 
        end if;
 
        if (ce3 = '1') then  
            q3 <= mem1(CONV_INTEGER(address3_tmp)); 
        end if;

end if;
end process;

end rtl;

