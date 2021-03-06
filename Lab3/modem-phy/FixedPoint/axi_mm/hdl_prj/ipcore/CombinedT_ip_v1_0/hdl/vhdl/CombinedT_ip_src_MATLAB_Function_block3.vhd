-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_AXIMM\CombinedT_ip_src_MATLAB_Function_block3.vhd
-- Created: 2018-02-01 18:12:06
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_MATLAB_Function_block3
-- Source Path: combinedTxRx_AXIMM/Combined TX and RX/Transmitter HDL/Packet Generation/Payload/MATLAB Function
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_MATLAB_Function_block3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_4_0                         :   IN    std_logic;
        enable                            :   IN    std_logic;
        reset_1                           :   OUT   std_logic;
        mode                              :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END CombinedT_ip_src_MATLAB_Function_block3;


ARCHITECTURE rtl OF CombinedT_ip_src_MATLAB_Function_block3 IS

  -- Signals
  SIGNAL reset_2                          : std_logic;
  SIGNAL mode_tmp                         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL counter                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL counter_next                     : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  RxTxFixedPointLibrary_c4_MATLAB_Function_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      counter <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_4_0 = '1' THEN
        counter <= counter_next;
      END IF;
    END IF;
  END PROCESS RxTxFixedPointLibrary_c4_MATLAB_Function_process;

  RxTxFixedPointLibrary_c4_MATLAB_Function_output : PROCESS (enable, counter)
    VARIABLE sub_cast : signed(8 DOWNTO 0);
    VARIABLE sub_temp : signed(8 DOWNTO 0);
  BEGIN
    counter_next <= counter;
    IF enable = '1' THEN 
      counter_next <= to_unsigned(16#44#, 8);
      -- tracebacklength*2
      mode_tmp <= to_unsigned(16#01#, 8);
      reset_2 <= '1';
    ELSIF counter > to_unsigned(16#00000000#, 8) THEN 
      sub_cast := signed(resize(counter, 9));
      sub_temp := sub_cast - to_signed(16#001#, 9);
      IF sub_temp(8) = '1' THEN 
        counter_next <= "00000000";
      ELSE 
        counter_next <= unsigned(sub_temp(7 DOWNTO 0));
      END IF;
      mode_tmp <= to_unsigned(16#01#, 8);
      reset_2 <= '0';
    ELSE 
      mode_tmp <= to_unsigned(16#00#, 8);
      reset_2 <= '0';
    END IF;
  END PROCESS RxTxFixedPointLibrary_c4_MATLAB_Function_output;


  mode <= std_logic_vector(mode_tmp);

  reset_1 <= reset_2;

END rtl;

