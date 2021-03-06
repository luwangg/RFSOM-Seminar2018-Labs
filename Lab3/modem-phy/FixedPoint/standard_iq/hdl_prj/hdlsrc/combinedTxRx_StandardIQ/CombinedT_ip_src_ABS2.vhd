-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_StandardIQ\CombinedT_ip_src_ABS2.vhd
-- Created: 2018-02-01 11:49:52
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_ABS2
-- Source Path: combinedTxRx_StandardIQ/Combined TX and RX/Receiver HDL/Frame Recover/Barker Locate/ABS2
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_ABS2 IS
  PORT( In1_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        In1_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        Out1                              :   OUT   std_logic_vector(16 DOWNTO 0)  -- sfix17
        );
END CombinedT_ip_src_ABS2;


ARCHITECTURE rtl OF CombinedT_ip_src_ABS2 IS

  -- Signals
  SIGNAL In1_re_signed                    : signed(15 DOWNTO 0);  -- int16
  SIGNAL In1_im_signed                    : signed(15 DOWNTO 0);  -- int16
  SIGNAL Product_mul_temp                 : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Product_out1                     : signed(15 DOWNTO 0);  -- int16
  SIGNAL Product1_mul_temp                : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Product1_out1                    : signed(15 DOWNTO 0);  -- int16
  SIGNAL Add_out1                         : signed(16 DOWNTO 0);  -- sfix17

BEGIN
  In1_re_signed <= signed(In1_re);

  Product_mul_temp <= In1_re_signed * In1_re_signed;
  Product_out1 <= Product_mul_temp(15 DOWNTO 0);

  In1_im_signed <= signed(In1_im);

  Product1_mul_temp <= In1_im_signed * In1_im_signed;
  Product1_out1 <= Product1_mul_temp(15 DOWNTO 0);

  Add_out1 <= resize(Product_out1, 17) + resize(Product1_out1, 17);

  Out1 <= std_logic_vector(Add_out1);

END rtl;

