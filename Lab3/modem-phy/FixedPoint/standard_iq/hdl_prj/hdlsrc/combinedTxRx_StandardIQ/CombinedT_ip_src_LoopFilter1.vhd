-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_StandardIQ\CombinedT_ip_src_LoopFilter1.vhd
-- Created: 2018-02-01 11:49:52
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_LoopFilter1
-- Source Path: combinedTxRx_StandardIQ/Combined TX and RX/Receiver HDL/Frame Recover/Gardner Timing Recovery/LoopFilter1
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_LoopFilter1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        e                                 :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Enable_out2                       :   IN    std_logic;
        v                                 :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En24
        );
END CombinedT_ip_src_LoopFilter1;


ARCHITECTURE rtl OF CombinedT_ip_src_LoopFilter1 IS

  -- Signals
  SIGNAL e_signed                         : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Delay2_out1                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Proportional_Gain_mul_temp       : signed(31 DOWNTO 0);  -- sfix32_En38
  SIGNAL Proportional_Gain_out1           : signed(15 DOWNTO 0);  -- sfix16_En24
  SIGNAL enb_gated_1                      : std_logic;
  SIGNAL Delay1_out1                      : signed(15 DOWNTO 0);  -- sfix16_En24

BEGIN
  e_signed <= signed(e);

  enb_gated <= Enable_out2 AND enb;

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated = '1' THEN
        Delay2_out1 <= e_signed;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Proportional_Gain_mul_temp <= to_signed(-16#6B00#, 16) * Delay2_out1;
  Proportional_Gain_out1 <= Proportional_Gain_mul_temp(29 DOWNTO 14);

  enb_gated_1 <= Enable_out2 AND enb;

  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_out1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated_1 = '1' THEN
        Delay1_out1 <= Proportional_Gain_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  v <= std_logic_vector(Delay1_out1);

END rtl;

