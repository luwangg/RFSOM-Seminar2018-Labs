-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_AXIMM\CombinedT_ip_src_Tx_Controller.vhd
-- Created: 2018-02-01 18:12:06
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_Tx_Controller
-- Source Path: combinedTxRx_AXIMM/Combined TX and RX/Transmitter HDL/Packet Generation/Tx Controller
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_Tx_Controller IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_4_0                         :   IN    std_logic;
        payloadBit                        :   IN    std_logic;
        payloadSize                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        count                             :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        start                             :   IN    std_logic;
        modeOut                           :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        headerData                        :   OUT   std_logic;
        data                              :   OUT   std_logic;
        dataStart                         :   OUT   std_logic;
        dataEnd                           :   OUT   std_logic;
        preambleReset                     :   OUT   std_logic
        );
END CombinedT_ip_src_Tx_Controller;


ARCHITECTURE rtl OF CombinedT_ip_src_Tx_Controller IS

  -- Signals
  SIGNAL payloadSize_unsigned             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_unsigned                   : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL modeOut_tmp                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL headerBits                       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL numPayloadBits                   : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL mode                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL headerBits_next                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL numPayloadBits_next              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL mode_next                        : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  payloadSize_unsigned <= unsigned(payloadSize);

  count_unsigned <= unsigned(count);

  RxTxFixedPointLibrary_c24_Tx_Controller_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      numPayloadBits <= to_unsigned(16#00000000#, 32);
      headerBits <= to_unsigned(16#0000#, 16);
      mode <= to_unsigned(16#04#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_4_0 = '1' THEN
        headerBits <= headerBits_next;
        numPayloadBits <= numPayloadBits_next;
        mode <= mode_next;
      END IF;
    END IF;
  END PROCESS RxTxFixedPointLibrary_c24_Tx_Controller_process;

  RxTxFixedPointLibrary_c24_Tx_Controller_output : PROCESS (payloadBit, payloadSize_unsigned, count_unsigned, start, headerBits,
       numPayloadBits, mode)
    VARIABLE bitkm1 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp : unsigned(32 DOWNTO 0);
    VARIABLE add_cast : unsigned(31 DOWNTO 0);
    VARIABLE add_cast_0 : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(32 DOWNTO 0);
    VARIABLE cast : unsigned(31 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(16 DOWNTO 0);
    VARIABLE cast_0 : unsigned(15 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(16 DOWNTO 0);
    VARIABLE add_cast_1 : unsigned(15 DOWNTO 0);
    VARIABLE add_cast_2 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_3 : unsigned(16 DOWNTO 0);
    VARIABLE cast_1 : unsigned(15 DOWNTO 0);
    VARIABLE sub_cast : signed(32 DOWNTO 0);
    VARIABLE sub_temp : signed(32 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(8 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(9 DOWNTO 0);
    VARIABLE sub_temp_0 : signed(9 DOWNTO 0);
    VARIABLE cast_2 : signed(8 DOWNTO 0);
    VARIABLE add_temp_4 : unsigned(32 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(32 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(33 DOWNTO 0);
    VARIABLE sub_temp_1 : signed(33 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(33 DOWNTO 0);
    VARIABLE sub_temp_2 : signed(33 DOWNTO 0);
    VARIABLE sub_cast_5 : signed(33 DOWNTO 0);
    VARIABLE sub_temp_3 : signed(33 DOWNTO 0);
    VARIABLE cast_3 : signed(32 DOWNTO 0);
    VARIABLE cast_4 : unsigned(31 DOWNTO 0);
  BEGIN
    headerBits_next <= headerBits;
    numPayloadBits_next <= numPayloadBits;
    mode_next <= mode;
    -- When we get a start flag buffers are reset and the next cycle with start
    -- in mode 0
    -- Reset: New payload size is passed at an int16
    -- 
    -- 2 bits per symbol => 250 symbols
    -- additional 1 is from reset of encoder
    -- Async/Init
    -- Synchronous
    CASE mode IS
      WHEN "00000000" =>
        -- Reset
        -- Move to next mode on next input/clock
        mode_next <= to_unsigned(16#01#, 8);
        -- Convert payloadSize to bits
        add_temp_1 := resize(payloadSize_unsigned sll 3, 17) + to_unsigned(16#00020#, 17);
        IF add_temp_1(16) /= '0' THEN 
          cast_0 := X"FFFF";
        ELSE 
          cast_0 := add_temp_1(15 DOWNTO 0);
        END IF;
        numPayloadBits_next <= resize(cast_0, 32);
        --headerBits = logical(bitget(CodeRate*(payloadSize+CRCLength),1:numHeaderBits));
        add_temp_2 := resize(payloadSize_unsigned sll 3, 17) + to_unsigned(16#00020#, 17);
        IF add_temp_2(16) /= '0' THEN 
          add_cast_1 := X"FFFF";
        ELSE 
          add_cast_1 := add_temp_2(15 DOWNTO 0);
        END IF;
        add_cast_2 := resize(add_cast_1, 17);
        add_temp_3 := add_cast_2 + to_unsigned(16#0006C#, 17);
        IF add_temp_3(16) /= '0' THEN 
          cast_1 := X"FFFF";
        ELSE 
          cast_1 := add_temp_3(15 DOWNTO 0);
        END IF;
        headerBits_next <= cast_1 sll 1;
        -- Set outputs
        modeOut_tmp <= to_unsigned(16#04#, 8);
        headerData <= '0';
        data <= '0';
        -- Not used downstream
        dataStart <= '0';
        dataEnd <= '0';
        preambleReset <= '1';
      WHEN "00000001" =>
        -- Preamble
        -- Set Next Mode
        IF count_unsigned >= to_unsigned(16#000001B6#, 32) THEN 
          preambleReset <= '0';
          mode_next <= to_unsigned(16#02#, 8);
        ELSIF count_unsigned = to_unsigned(16#00000001#, 32) THEN 
          preambleReset <= '0';
          mode_next <= to_unsigned(16#01#, 8);
        ELSE 
          preambleReset <= '0';
          mode_next <= to_unsigned(16#01#, 8);
        END IF;
        -- Set outputs
        modeOut_tmp <= to_unsigned(16#01#, 8);
        headerData <= '0';
        -- Start outputing data early to compensate for CRC lag
        IF count_unsigned >= to_unsigned(16#000001A4#, 32) THEN 
          data <= payloadBit;
          -- Set flag on first payload bit
          IF count_unsigned = to_unsigned(16#000001A4#, 32) THEN 
            dataStart <= '1';
          ELSE 
            dataStart <= '0';
          END IF;
        ELSE 
          data <= '0';
          dataStart <= '0';
        END IF;
        dataEnd <= '0';
      WHEN "00000010" =>
        -- Header bits
        -- Set Next Mode
        IF count_unsigned >= to_unsigned(16#000001C6#, 32) THEN 
          mode_next <= to_unsigned(16#03#, 8);
        ELSE 
          mode_next <= to_unsigned(16#02#, 8);
        END IF;
        -- Set outputs
        modeOut_tmp <= to_unsigned(16#02#, 8);
        --headerData = headerBits(count-preambleBits);
        sub_cast := signed(resize(count_unsigned, 33));
        sub_temp := sub_cast - to_signed(438, 33);
        IF (sub_temp(32) = '0') AND (sub_temp(31 DOWNTO 8) /= X"000000") THEN 
          sub_cast_0 := "011111111";
        ELSIF (sub_temp(32) = '1') AND (sub_temp(31 DOWNTO 8) /= X"FFFFFF") THEN 
          sub_cast_0 := "100000000";
        ELSE 
          sub_cast_0 := sub_temp(8 DOWNTO 0);
        END IF;
        sub_cast_1 := resize(sub_cast_0, 10);
        sub_temp_0 := sub_cast_1 - to_signed(16#001#, 10);
        IF (sub_temp_0(9) = '0') AND (sub_temp_0(8) /= '0') THEN 
          cast_2 := "011111111";
        ELSIF (sub_temp_0(9) = '1') AND (sub_temp_0(8) /= '1') THEN 
          cast_2 := "100000000";
        ELSE 
          cast_2 := sub_temp_0(8 DOWNTO 0);
        END IF;
        IF cast_2(8) = '1' THEN 
          bitkm1 := "00000000";
        ELSE 
          bitkm1 := unsigned(cast_2(7 DOWNTO 0));
        END IF;
        IF headerBits(to_integer(bitkm1)) /= '0' THEN 
          headerData <= '1';
        ELSE 
          headerData <= '0';
        END IF;
        data <= payloadBit;
        dataStart <= '0';
        dataEnd <= '0';
        preambleReset <= '0';
      WHEN "00000011" =>
        -- Payload bits and CRC
        -- Set Next Mode
        add_temp := to_unsigned(454, 33) + resize(numPayloadBits, 33);
        IF add_temp(32) /= '0' THEN 
          add_cast := X"FFFFFFFF";
        ELSE 
          add_cast := add_temp(31 DOWNTO 0);
        END IF;
        add_cast_0 := resize(add_cast, 33);
        add_temp_0 := add_cast_0 + to_unsigned(68, 33);
        IF add_temp_0(32) /= '0' THEN 
          cast := X"FFFFFFFF";
        ELSE 
          cast := add_temp_0(31 DOWNTO 0);
        END IF;
        IF count_unsigned >= cast THEN 
          --+CRCGeneratorLag)
          -- Will coencide with last CRC Bit (NOT TRUE ANYMORE WILL BE ON
          -- LAST TRACEBACK PADDING BIT)
          mode_next <= to_unsigned(16#04#, 8);
        ELSE 
          mode_next <= to_unsigned(16#03#, 8);
        END IF;
        -- Set outputs
        modeOut_tmp <= to_unsigned(16#03#, 8);
        headerData <= '0';
        data <= payloadBit;
        -- Set flag on last payload bit
        dataStart <= '0';
        add_temp_4 := to_unsigned(454, 33) + resize(numPayloadBits, 33);
        IF add_temp_4(32) /= '0' THEN 
          sub_cast_2 := "011111111111111111111111111111111";
        ELSE 
          sub_cast_2 := signed(add_temp_4);
        END IF;
        sub_cast_3 := resize(sub_cast_2, 34);
        sub_temp_1 := sub_cast_3 - to_signed(32, 34);
        sub_cast_4 := sub_temp_1;
        sub_temp_2 := sub_cast_4 - to_signed(34, 34);
        sub_cast_5 := sub_temp_2;
        sub_temp_3 := sub_cast_5 - to_signed(1, 34);
        IF (sub_temp_3(33) = '0') AND (sub_temp_3(32) /= '0') THEN 
          cast_3 := "011111111111111111111111111111111";
        ELSIF (sub_temp_3(33) = '1') AND (sub_temp_3(32) /= '1') THEN 
          cast_3 := "100000000000000000000000000000000";
        ELSE 
          cast_3 := sub_temp_3(32 DOWNTO 0);
        END IF;
        IF cast_3(32) = '1' THEN 
          cast_4 := X"00000000";
        ELSE 
          cast_4 := unsigned(cast_3(31 DOWNTO 0));
        END IF;
        IF count_unsigned = cast_4 THEN 
          dataEnd <= '1';
        ELSE 
          dataEnd <= '0';
        END IF;
        preambleReset <= '0';
      WHEN OTHERS => 
        --case uint8(4) % Waiting for data
        -- Chilling for new start
        IF start = '1' THEN 
          mode_next <= to_unsigned(16#00#, 8);
        ELSE 
          mode_next <= to_unsigned(16#04#, 8);
        END IF;
        -- Set outputs
        modeOut_tmp <= to_unsigned(16#04#, 8);
        headerData <= '0';
        data <= '0';
        -- Not used downstream
        dataStart <= '0';
        dataEnd <= '0';
        preambleReset <= '0';
    END CASE;
  END PROCESS RxTxFixedPointLibrary_c24_Tx_Controller_output;


  modeOut <= std_logic_vector(modeOut_tmp);

END rtl;

