-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_ExternalMode\CombinedT_ip_src_Subsystem.vhd
-- Created: 2018-02-01 13:20:10
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_Subsystem
-- Source Path: combinedTxRx_ExternalMode/Combined TX and RX/Transmitter HDL/Packet Generation/Payload/Subsystem
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_Subsystem IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_4_0                         :   IN    std_logic;
        In1                               :   IN    std_logic;
        In2                               :   IN    std_logic;
        Out1                              :   OUT   std_logic
        );
END CombinedT_ip_src_Subsystem;


ARCHITECTURE rtl OF CombinedT_ip_src_Subsystem IS

  -- Component Declarations
  COMPONENT CombinedT_ip_src_MATLAB_Function3
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_4_0                       :   IN    std_logic;
          start                           :   IN    std_logic;
          done                            :   IN    std_logic;
          enable                          :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : CombinedT_ip_src_MATLAB_Function3
    USE ENTITY work.CombinedT_ip_src_MATLAB_Function3(rtl);

  -- Signals
  SIGNAL enable                           : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;

BEGIN
  u_MATLAB_Function3 : CombinedT_ip_src_MATLAB_Function3
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_4_0 => enb_1_4_0,
              start => In1,
              done => In2,
              enable => enable
              );

  Logical_Operator_out1 <= In2 OR (In1 OR enable);

  Out1 <= Logical_Operator_out1;

END rtl;

