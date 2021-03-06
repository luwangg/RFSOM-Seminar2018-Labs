-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_AXIMM\CombinedT_ip_src_ACSEngine.vhd
-- Created: 2018-02-01 18:12:06
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_ACSEngine
-- Source Path: combinedTxRx_AXIMM/Combined TX and RX/Receiver HDL/Viterbi Decode/Viterbi Decoder/ACS/ACSEngine
-- Hierarchy Level: 5
-- 
-- Instantiate the ACS units
-- Pass the right state metric and branch metrics to each instance
-- Gather the output of each instance to send as output
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.CombinedT_ip_src_Combined_TX_and_RX_pkg.ALL;

ENTITY CombinedT_ip_src_ACSEngine IS
  PORT( branchMetric                      :   IN    vector_of_std_logic_vector5(0 TO 3);  -- ufix5 [4]
        stateMetric                       :   IN    vector_of_std_logic_vector5(0 TO 63);  -- ufix5 [64]
        acsDecision                       :   OUT   std_logic_vector(0 TO 63);  -- ufix1 [64]
        nextStateMetric                   :   OUT   vector_of_std_logic_vector5(0 TO 63)  -- ufix5 [64]
        );
END CombinedT_ip_src_ACSEngine;


ARCHITECTURE rtl OF CombinedT_ip_src_ACSEngine IS

  -- Component Declarations
  COMPONENT CombinedT_ip_src_ACSUnit
    PORT( bmet0                           :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          bmet1                           :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          smet0                           :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          smet1                           :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          branchdec                       :   OUT   std_logic;  -- ufix1
          nextsmet                        :   OUT   std_logic_vector(4 DOWNTO 0)  -- ufix5
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : CombinedT_ip_src_ACSUnit
    USE ENTITY work.CombinedT_ip_src_ACSUnit(rtl);

  -- Signals
  SIGNAL nextStateMetric_tmp              : vector_of_std_logic_vector5(0 TO 63);  -- ufix5 [64]

BEGIN
  -- ACSUnit1
  u_ACSUnit1 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(0),  -- ufix5
              smet1 => stateMetric(1),  -- ufix5
              branchdec => acsDecision(0),  -- ufix1
              nextsmet => nextStateMetric_tmp(0)  -- ufix5
              );

  -- ACSUnit2
  u_ACSUnit2 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(2),  -- ufix5
              smet1 => stateMetric(3),  -- ufix5
              branchdec => acsDecision(1),  -- ufix1
              nextsmet => nextStateMetric_tmp(1)  -- ufix5
              );

  -- ACSUnit3
  u_ACSUnit3 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(4),  -- ufix5
              smet1 => stateMetric(5),  -- ufix5
              branchdec => acsDecision(2),  -- ufix1
              nextsmet => nextStateMetric_tmp(2)  -- ufix5
              );

  -- ACSUnit4
  u_ACSUnit4 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(6),  -- ufix5
              smet1 => stateMetric(7),  -- ufix5
              branchdec => acsDecision(3),  -- ufix1
              nextsmet => nextStateMetric_tmp(3)  -- ufix5
              );

  -- ACSUnit5
  u_ACSUnit5 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(8),  -- ufix5
              smet1 => stateMetric(9),  -- ufix5
              branchdec => acsDecision(4),  -- ufix1
              nextsmet => nextStateMetric_tmp(4)  -- ufix5
              );

  -- ACSUnit6
  u_ACSUnit6 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(10),  -- ufix5
              smet1 => stateMetric(11),  -- ufix5
              branchdec => acsDecision(5),  -- ufix1
              nextsmet => nextStateMetric_tmp(5)  -- ufix5
              );

  -- ACSUnit7
  u_ACSUnit7 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(12),  -- ufix5
              smet1 => stateMetric(13),  -- ufix5
              branchdec => acsDecision(6),  -- ufix1
              nextsmet => nextStateMetric_tmp(6)  -- ufix5
              );

  -- ACSUnit8
  u_ACSUnit8 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(14),  -- ufix5
              smet1 => stateMetric(15),  -- ufix5
              branchdec => acsDecision(7),  -- ufix1
              nextsmet => nextStateMetric_tmp(7)  -- ufix5
              );

  -- ACSUnit9
  u_ACSUnit9 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(16),  -- ufix5
              smet1 => stateMetric(17),  -- ufix5
              branchdec => acsDecision(8),  -- ufix1
              nextsmet => nextStateMetric_tmp(8)  -- ufix5
              );

  -- ACSUnit10
  u_ACSUnit10 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(18),  -- ufix5
              smet1 => stateMetric(19),  -- ufix5
              branchdec => acsDecision(9),  -- ufix1
              nextsmet => nextStateMetric_tmp(9)  -- ufix5
              );

  -- ACSUnit11
  u_ACSUnit11 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(20),  -- ufix5
              smet1 => stateMetric(21),  -- ufix5
              branchdec => acsDecision(10),  -- ufix1
              nextsmet => nextStateMetric_tmp(10)  -- ufix5
              );

  -- ACSUnit12
  u_ACSUnit12 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(22),  -- ufix5
              smet1 => stateMetric(23),  -- ufix5
              branchdec => acsDecision(11),  -- ufix1
              nextsmet => nextStateMetric_tmp(11)  -- ufix5
              );

  -- ACSUnit13
  u_ACSUnit13 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(24),  -- ufix5
              smet1 => stateMetric(25),  -- ufix5
              branchdec => acsDecision(12),  -- ufix1
              nextsmet => nextStateMetric_tmp(12)  -- ufix5
              );

  -- ACSUnit14
  u_ACSUnit14 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(26),  -- ufix5
              smet1 => stateMetric(27),  -- ufix5
              branchdec => acsDecision(13),  -- ufix1
              nextsmet => nextStateMetric_tmp(13)  -- ufix5
              );

  -- ACSUnit15
  u_ACSUnit15 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(28),  -- ufix5
              smet1 => stateMetric(29),  -- ufix5
              branchdec => acsDecision(14),  -- ufix1
              nextsmet => nextStateMetric_tmp(14)  -- ufix5
              );

  -- ACSUnit16
  u_ACSUnit16 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(30),  -- ufix5
              smet1 => stateMetric(31),  -- ufix5
              branchdec => acsDecision(15),  -- ufix1
              nextsmet => nextStateMetric_tmp(15)  -- ufix5
              );

  -- ACSUnit17
  u_ACSUnit17 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(32),  -- ufix5
              smet1 => stateMetric(33),  -- ufix5
              branchdec => acsDecision(16),  -- ufix1
              nextsmet => nextStateMetric_tmp(16)  -- ufix5
              );

  -- ACSUnit18
  u_ACSUnit18 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(34),  -- ufix5
              smet1 => stateMetric(35),  -- ufix5
              branchdec => acsDecision(17),  -- ufix1
              nextsmet => nextStateMetric_tmp(17)  -- ufix5
              );

  -- ACSUnit19
  u_ACSUnit19 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(36),  -- ufix5
              smet1 => stateMetric(37),  -- ufix5
              branchdec => acsDecision(18),  -- ufix1
              nextsmet => nextStateMetric_tmp(18)  -- ufix5
              );

  -- ACSUnit20
  u_ACSUnit20 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(38),  -- ufix5
              smet1 => stateMetric(39),  -- ufix5
              branchdec => acsDecision(19),  -- ufix1
              nextsmet => nextStateMetric_tmp(19)  -- ufix5
              );

  -- ACSUnit21
  u_ACSUnit21 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(40),  -- ufix5
              smet1 => stateMetric(41),  -- ufix5
              branchdec => acsDecision(20),  -- ufix1
              nextsmet => nextStateMetric_tmp(20)  -- ufix5
              );

  -- ACSUnit22
  u_ACSUnit22 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(42),  -- ufix5
              smet1 => stateMetric(43),  -- ufix5
              branchdec => acsDecision(21),  -- ufix1
              nextsmet => nextStateMetric_tmp(21)  -- ufix5
              );

  -- ACSUnit23
  u_ACSUnit23 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(44),  -- ufix5
              smet1 => stateMetric(45),  -- ufix5
              branchdec => acsDecision(22),  -- ufix1
              nextsmet => nextStateMetric_tmp(22)  -- ufix5
              );

  -- ACSUnit24
  u_ACSUnit24 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(46),  -- ufix5
              smet1 => stateMetric(47),  -- ufix5
              branchdec => acsDecision(23),  -- ufix1
              nextsmet => nextStateMetric_tmp(23)  -- ufix5
              );

  -- ACSUnit25
  u_ACSUnit25 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(48),  -- ufix5
              smet1 => stateMetric(49),  -- ufix5
              branchdec => acsDecision(24),  -- ufix1
              nextsmet => nextStateMetric_tmp(24)  -- ufix5
              );

  -- ACSUnit26
  u_ACSUnit26 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(50),  -- ufix5
              smet1 => stateMetric(51),  -- ufix5
              branchdec => acsDecision(25),  -- ufix1
              nextsmet => nextStateMetric_tmp(25)  -- ufix5
              );

  -- ACSUnit27
  u_ACSUnit27 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(52),  -- ufix5
              smet1 => stateMetric(53),  -- ufix5
              branchdec => acsDecision(26),  -- ufix1
              nextsmet => nextStateMetric_tmp(26)  -- ufix5
              );

  -- ACSUnit28
  u_ACSUnit28 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(54),  -- ufix5
              smet1 => stateMetric(55),  -- ufix5
              branchdec => acsDecision(27),  -- ufix1
              nextsmet => nextStateMetric_tmp(27)  -- ufix5
              );

  -- ACSUnit29
  u_ACSUnit29 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(56),  -- ufix5
              smet1 => stateMetric(57),  -- ufix5
              branchdec => acsDecision(28),  -- ufix1
              nextsmet => nextStateMetric_tmp(28)  -- ufix5
              );

  -- ACSUnit30
  u_ACSUnit30 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(58),  -- ufix5
              smet1 => stateMetric(59),  -- ufix5
              branchdec => acsDecision(29),  -- ufix1
              nextsmet => nextStateMetric_tmp(29)  -- ufix5
              );

  -- ACSUnit31
  u_ACSUnit31 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(60),  -- ufix5
              smet1 => stateMetric(61),  -- ufix5
              branchdec => acsDecision(30),  -- ufix1
              nextsmet => nextStateMetric_tmp(30)  -- ufix5
              );

  -- ACSUnit32
  u_ACSUnit32 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(62),  -- ufix5
              smet1 => stateMetric(63),  -- ufix5
              branchdec => acsDecision(31),  -- ufix1
              nextsmet => nextStateMetric_tmp(31)  -- ufix5
              );

  -- ACSUnit33
  u_ACSUnit33 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(0),  -- ufix5
              smet1 => stateMetric(1),  -- ufix5
              branchdec => acsDecision(32),  -- ufix1
              nextsmet => nextStateMetric_tmp(32)  -- ufix5
              );

  -- ACSUnit34
  u_ACSUnit34 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(2),  -- ufix5
              smet1 => stateMetric(3),  -- ufix5
              branchdec => acsDecision(33),  -- ufix1
              nextsmet => nextStateMetric_tmp(33)  -- ufix5
              );

  -- ACSUnit35
  u_ACSUnit35 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(4),  -- ufix5
              smet1 => stateMetric(5),  -- ufix5
              branchdec => acsDecision(34),  -- ufix1
              nextsmet => nextStateMetric_tmp(34)  -- ufix5
              );

  -- ACSUnit36
  u_ACSUnit36 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(6),  -- ufix5
              smet1 => stateMetric(7),  -- ufix5
              branchdec => acsDecision(35),  -- ufix1
              nextsmet => nextStateMetric_tmp(35)  -- ufix5
              );

  -- ACSUnit37
  u_ACSUnit37 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(8),  -- ufix5
              smet1 => stateMetric(9),  -- ufix5
              branchdec => acsDecision(36),  -- ufix1
              nextsmet => nextStateMetric_tmp(36)  -- ufix5
              );

  -- ACSUnit38
  u_ACSUnit38 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(10),  -- ufix5
              smet1 => stateMetric(11),  -- ufix5
              branchdec => acsDecision(37),  -- ufix1
              nextsmet => nextStateMetric_tmp(37)  -- ufix5
              );

  -- ACSUnit39
  u_ACSUnit39 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(12),  -- ufix5
              smet1 => stateMetric(13),  -- ufix5
              branchdec => acsDecision(38),  -- ufix1
              nextsmet => nextStateMetric_tmp(38)  -- ufix5
              );

  -- ACSUnit40
  u_ACSUnit40 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(14),  -- ufix5
              smet1 => stateMetric(15),  -- ufix5
              branchdec => acsDecision(39),  -- ufix1
              nextsmet => nextStateMetric_tmp(39)  -- ufix5
              );

  -- ACSUnit41
  u_ACSUnit41 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(16),  -- ufix5
              smet1 => stateMetric(17),  -- ufix5
              branchdec => acsDecision(40),  -- ufix1
              nextsmet => nextStateMetric_tmp(40)  -- ufix5
              );

  -- ACSUnit42
  u_ACSUnit42 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(18),  -- ufix5
              smet1 => stateMetric(19),  -- ufix5
              branchdec => acsDecision(41),  -- ufix1
              nextsmet => nextStateMetric_tmp(41)  -- ufix5
              );

  -- ACSUnit43
  u_ACSUnit43 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(20),  -- ufix5
              smet1 => stateMetric(21),  -- ufix5
              branchdec => acsDecision(42),  -- ufix1
              nextsmet => nextStateMetric_tmp(42)  -- ufix5
              );

  -- ACSUnit44
  u_ACSUnit44 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(22),  -- ufix5
              smet1 => stateMetric(23),  -- ufix5
              branchdec => acsDecision(43),  -- ufix1
              nextsmet => nextStateMetric_tmp(43)  -- ufix5
              );

  -- ACSUnit45
  u_ACSUnit45 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(24),  -- ufix5
              smet1 => stateMetric(25),  -- ufix5
              branchdec => acsDecision(44),  -- ufix1
              nextsmet => nextStateMetric_tmp(44)  -- ufix5
              );

  -- ACSUnit46
  u_ACSUnit46 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(26),  -- ufix5
              smet1 => stateMetric(27),  -- ufix5
              branchdec => acsDecision(45),  -- ufix1
              nextsmet => nextStateMetric_tmp(45)  -- ufix5
              );

  -- ACSUnit47
  u_ACSUnit47 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(28),  -- ufix5
              smet1 => stateMetric(29),  -- ufix5
              branchdec => acsDecision(46),  -- ufix1
              nextsmet => nextStateMetric_tmp(46)  -- ufix5
              );

  -- ACSUnit48
  u_ACSUnit48 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(30),  -- ufix5
              smet1 => stateMetric(31),  -- ufix5
              branchdec => acsDecision(47),  -- ufix1
              nextsmet => nextStateMetric_tmp(47)  -- ufix5
              );

  -- ACSUnit49
  u_ACSUnit49 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(32),  -- ufix5
              smet1 => stateMetric(33),  -- ufix5
              branchdec => acsDecision(48),  -- ufix1
              nextsmet => nextStateMetric_tmp(48)  -- ufix5
              );

  -- ACSUnit50
  u_ACSUnit50 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(34),  -- ufix5
              smet1 => stateMetric(35),  -- ufix5
              branchdec => acsDecision(49),  -- ufix1
              nextsmet => nextStateMetric_tmp(49)  -- ufix5
              );

  -- ACSUnit51
  u_ACSUnit51 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(36),  -- ufix5
              smet1 => stateMetric(37),  -- ufix5
              branchdec => acsDecision(50),  -- ufix1
              nextsmet => nextStateMetric_tmp(50)  -- ufix5
              );

  -- ACSUnit52
  u_ACSUnit52 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(38),  -- ufix5
              smet1 => stateMetric(39),  -- ufix5
              branchdec => acsDecision(51),  -- ufix1
              nextsmet => nextStateMetric_tmp(51)  -- ufix5
              );

  -- ACSUnit53
  u_ACSUnit53 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(40),  -- ufix5
              smet1 => stateMetric(41),  -- ufix5
              branchdec => acsDecision(52),  -- ufix1
              nextsmet => nextStateMetric_tmp(52)  -- ufix5
              );

  -- ACSUnit54
  u_ACSUnit54 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(42),  -- ufix5
              smet1 => stateMetric(43),  -- ufix5
              branchdec => acsDecision(53),  -- ufix1
              nextsmet => nextStateMetric_tmp(53)  -- ufix5
              );

  -- ACSUnit55
  u_ACSUnit55 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(44),  -- ufix5
              smet1 => stateMetric(45),  -- ufix5
              branchdec => acsDecision(54),  -- ufix1
              nextsmet => nextStateMetric_tmp(54)  -- ufix5
              );

  -- ACSUnit56
  u_ACSUnit56 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(46),  -- ufix5
              smet1 => stateMetric(47),  -- ufix5
              branchdec => acsDecision(55),  -- ufix1
              nextsmet => nextStateMetric_tmp(55)  -- ufix5
              );

  -- ACSUnit57
  u_ACSUnit57 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(48),  -- ufix5
              smet1 => stateMetric(49),  -- ufix5
              branchdec => acsDecision(56),  -- ufix1
              nextsmet => nextStateMetric_tmp(56)  -- ufix5
              );

  -- ACSUnit58
  u_ACSUnit58 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(50),  -- ufix5
              smet1 => stateMetric(51),  -- ufix5
              branchdec => acsDecision(57),  -- ufix1
              nextsmet => nextStateMetric_tmp(57)  -- ufix5
              );

  -- ACSUnit59
  u_ACSUnit59 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(2),  -- ufix5
              bmet1 => branchMetric(1),  -- ufix5
              smet0 => stateMetric(52),  -- ufix5
              smet1 => stateMetric(53),  -- ufix5
              branchdec => acsDecision(58),  -- ufix1
              nextsmet => nextStateMetric_tmp(58)  -- ufix5
              );

  -- ACSUnit60
  u_ACSUnit60 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(3),  -- ufix5
              bmet1 => branchMetric(0),  -- ufix5
              smet0 => stateMetric(54),  -- ufix5
              smet1 => stateMetric(55),  -- ufix5
              branchdec => acsDecision(59),  -- ufix1
              nextsmet => nextStateMetric_tmp(59)  -- ufix5
              );

  -- ACSUnit61
  u_ACSUnit61 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(56),  -- ufix5
              smet1 => stateMetric(57),  -- ufix5
              branchdec => acsDecision(60),  -- ufix1
              nextsmet => nextStateMetric_tmp(60)  -- ufix5
              );

  -- ACSUnit62
  u_ACSUnit62 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(58),  -- ufix5
              smet1 => stateMetric(59),  -- ufix5
              branchdec => acsDecision(61),  -- ufix1
              nextsmet => nextStateMetric_tmp(61)  -- ufix5
              );

  -- ACSUnit63
  u_ACSUnit63 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(1),  -- ufix5
              bmet1 => branchMetric(2),  -- ufix5
              smet0 => stateMetric(60),  -- ufix5
              smet1 => stateMetric(61),  -- ufix5
              branchdec => acsDecision(62),  -- ufix1
              nextsmet => nextStateMetric_tmp(62)  -- ufix5
              );

  -- ACSUnit64
  u_ACSUnit64 : CombinedT_ip_src_ACSUnit
    PORT MAP( bmet0 => branchMetric(0),  -- ufix5
              bmet1 => branchMetric(3),  -- ufix5
              smet0 => stateMetric(62),  -- ufix5
              smet1 => stateMetric(63),  -- ufix5
              branchdec => acsDecision(63),  -- ufix1
              nextsmet => nextStateMetric_tmp(63)  -- ufix5
              );



  nextStateMetric <= nextStateMetric_tmp;

END rtl;

