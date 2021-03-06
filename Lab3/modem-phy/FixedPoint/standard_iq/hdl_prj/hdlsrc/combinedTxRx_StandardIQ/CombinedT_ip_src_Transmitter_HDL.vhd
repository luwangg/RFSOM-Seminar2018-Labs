-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_StandardIQ\CombinedT_ip_src_Transmitter_HDL.vhd
-- Created: 2018-02-01 11:49:53
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_Transmitter_HDL
-- Source Path: combinedTxRx_StandardIQ/Combined TX and RX/Transmitter HDL
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_Transmitter_HDL IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_4_0                         :   IN    std_logic;
        enb_1_1_1                         :   IN    std_logic;
        enb_1_4_1                         :   IN    std_logic;
        bytesIn                           :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        validIn                           :   IN    std_logic;
        real_rsvd                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        imag                              :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        validOut                          :   OUT   std_logic;
        Need_Data                         :   OUT   std_logic
        );
END CombinedT_ip_src_Transmitter_HDL;


ARCHITECTURE rtl OF CombinedT_ip_src_Transmitter_HDL IS

  -- Component Declarations
  COMPONENT CombinedT_ip_src_Subsystem_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_4_1                       :   IN    std_logic;
          In1                             :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
          Out1                            :   OUT   std_logic_vector(63 DOWNTO 0)  -- ufix64
          );
  END COMPONENT;

  COMPONENT CombinedT_ip_src_Subsystem1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_4_1                       :   IN    std_logic;
          In1                             :   IN    std_logic;
          Out1                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT CombinedT_ip_src_DMA_Interface_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_4_0                       :   IN    std_logic;
          byteIn                          :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
          validIn                         :   IN    std_logic;
          EOF                             :   IN    std_logic;
          validOut                        :   OUT   std_logic;
          bit_rsvd                        :   OUT   std_logic;
          payloadLength                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          startOut                        :   OUT   std_logic;
          readyForMore                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT CombinedT_ip_src_Packet_Generation
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_4_0                       :   IN    std_logic;
          enb_1_4_1                       :   IN    std_logic;
          bits                            :   IN    std_logic;
          payloadSize                     :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          start                           :   IN    std_logic;
          trueData                        :   OUT   std_logic;
          symbols_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          symbols_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          EOF                             :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT CombinedT_ip_src_Raised_Cosine_Transmit_Filter1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          In1_re                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          In1_im                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          Out1_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Out1_im                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : CombinedT_ip_src_Subsystem_block
    USE ENTITY work.CombinedT_ip_src_Subsystem_block(rtl);

  FOR ALL : CombinedT_ip_src_Subsystem1
    USE ENTITY work.CombinedT_ip_src_Subsystem1(rtl);

  FOR ALL : CombinedT_ip_src_DMA_Interface_block
    USE ENTITY work.CombinedT_ip_src_DMA_Interface_block(rtl);

  FOR ALL : CombinedT_ip_src_Packet_Generation
    USE ENTITY work.CombinedT_ip_src_Packet_Generation(rtl);

  FOR ALL : CombinedT_ip_src_Raised_Cosine_Transmit_Filter1
    USE ENTITY work.CombinedT_ip_src_Raised_Cosine_Transmit_Filter1(rtl);

  -- Signals
  SIGNAL Subsystem_out1                   : std_logic_vector(63 DOWNTO 0);  -- ufix64
  SIGNAL Subsystem1_out1                  : std_logic;
  SIGNAL Packet_Generation_out3           : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL validOut_1                       : std_logic;
  SIGNAL bitOut                           : std_logic;
  SIGNAL payloadLength                    : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL DMA_Interface_out4               : std_logic;
  SIGNAL readyForInput                    : std_logic;
  SIGNAL Packet_Generation_out1           : std_logic;
  SIGNAL Packet_Generation_out2_re        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Packet_Generation_out2_im        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Raised_Cosine_Transmit_Filter1_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Raised_Cosine_Transmit_Filter1_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Keep_Transmitting_Always_out1    : std_logic;
  SIGNAL Repeat_out1                      : std_logic;
  SIGNAL Repeat1_out1                     : std_logic;

BEGIN
  -- Valid only goes low on SOF
  -- But we will be in mode 4 during
  -- that time so output is valid

  u_Subsystem : CombinedT_ip_src_Subsystem_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_4_1 => enb_1_4_1,
              In1 => bytesIn,  -- ufix64
              Out1 => Subsystem_out1  -- ufix64
              );

  u_Subsystem1 : CombinedT_ip_src_Subsystem1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_4_1 => enb_1_4_1,
              In1 => validIn,
              Out1 => Subsystem1_out1
              );

  u_DMA_Interface : CombinedT_ip_src_DMA_Interface_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_4_0 => enb_1_4_0,
              byteIn => Subsystem_out1,  -- ufix64
              validIn => Subsystem1_out1,
              EOF => Delay_out1,
              validOut => validOut_1,
              bit_rsvd => bitOut,
              payloadLength => payloadLength,  -- uint16
              startOut => DMA_Interface_out4,
              readyForMore => readyForInput
              );

  u_Packet_Generation : CombinedT_ip_src_Packet_Generation
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_4_0 => enb_1_4_0,
              enb_1_4_1 => enb_1_4_1,
              bits => bitOut,
              payloadSize => payloadLength,  -- uint16
              start => DMA_Interface_out4,
              trueData => Packet_Generation_out1,
              symbols_re => Packet_Generation_out2_re,  -- sfix16_En15
              symbols_im => Packet_Generation_out2_im,  -- sfix16_En15
              EOF => Packet_Generation_out3
              );

  u_Raised_Cosine_Transmit_Filter1 : CombinedT_ip_src_Raised_Cosine_Transmit_Filter1
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_1_1 => enb_1_1_1,
              In1_re => Packet_Generation_out2_re,  -- sfix16_En15
              In1_im => Packet_Generation_out2_im,  -- sfix16_En15
              Out1_re => Raised_Cosine_Transmit_Filter1_out1_re,  -- sfix16_En14
              Out1_im => Raised_Cosine_Transmit_Filter1_out1_im  -- sfix16_En14
              );

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_4_0 = '1' THEN
        Delay_out1 <= Packet_Generation_out3;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Keep_Transmitting_Always_out1 <= '1';

  Repeat_out1 <= Keep_Transmitting_Always_out1;

  Repeat1_out1 <= readyForInput;





  real_rsvd <= Raised_Cosine_Transmit_Filter1_out1_re;

  imag <= Raised_Cosine_Transmit_Filter1_out1_im;

  validOut <= Repeat_out1;

  Need_Data <= Repeat1_out1;

END rtl;

