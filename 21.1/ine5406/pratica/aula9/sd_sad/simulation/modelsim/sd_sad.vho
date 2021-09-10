-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "08/18/2021 16:40:37"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sd_sad IS
    PORT (
	ck : IN std_logic;
	reset : IN std_logic;
	iniciar : IN std_logic;
	pA : IN std_logic_vector(7 DOWNTO 0);
	pB : IN std_logic_vector(7 DOWNTO 0);
	ender : BUFFER std_logic_vector(5 DOWNTO 0);
	readmem : BUFFER std_logic;
	pronto : BUFFER std_logic;
	sad : BUFFER std_logic_vector(13 DOWNTO 0)
	);
END sd_sad;

-- Design Ports Information
-- ender[0]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ender[1]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ender[2]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ender[3]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ender[4]	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ender[5]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readmem	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pronto	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[0]	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[1]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[2]	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[3]	=>  Location: PIN_138,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[4]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[5]	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[6]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[7]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[8]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[9]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[10]	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[11]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[12]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sad[13]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ck	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iniciar	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pA[0]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pB[0]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pB[6]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pA[6]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pA[5]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pA[4]	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pB[4]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pA[3]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pA[2]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pA[1]	=>  Location: PIN_88,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pB[1]	=>  Location: PIN_89,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pB[2]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pB[3]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pB[5]	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pA[7]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pB[7]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sd_sad IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_ck : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_iniciar : std_logic;
SIGNAL ww_pA : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_pB : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ender : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_readmem : std_logic;
SIGNAL ww_pronto : std_logic;
SIGNAL ww_sad : std_logic_vector(13 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ck~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ender[0]~output_o\ : std_logic;
SIGNAL \ender[1]~output_o\ : std_logic;
SIGNAL \ender[2]~output_o\ : std_logic;
SIGNAL \ender[3]~output_o\ : std_logic;
SIGNAL \ender[4]~output_o\ : std_logic;
SIGNAL \ender[5]~output_o\ : std_logic;
SIGNAL \readmem~output_o\ : std_logic;
SIGNAL \pronto~output_o\ : std_logic;
SIGNAL \sad[0]~output_o\ : std_logic;
SIGNAL \sad[1]~output_o\ : std_logic;
SIGNAL \sad[2]~output_o\ : std_logic;
SIGNAL \sad[3]~output_o\ : std_logic;
SIGNAL \sad[4]~output_o\ : std_logic;
SIGNAL \sad[5]~output_o\ : std_logic;
SIGNAL \sad[6]~output_o\ : std_logic;
SIGNAL \sad[7]~output_o\ : std_logic;
SIGNAL \sad[8]~output_o\ : std_logic;
SIGNAL \sad[9]~output_o\ : std_logic;
SIGNAL \sad[10]~output_o\ : std_logic;
SIGNAL \sad[11]~output_o\ : std_logic;
SIGNAL \sad[12]~output_o\ : std_logic;
SIGNAL \sad[13]~output_o\ : std_logic;
SIGNAL \ck~input_o\ : std_logic;
SIGNAL \ck~inputclkctrl_outclk\ : std_logic;
SIGNAL \iniciar~input_o\ : std_logic;
SIGNAL \bc|nextState.s0~combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \bc|currentState.s0~q\ : std_logic;
SIGNAL \bc|nextState.s1~0_combout\ : std_logic;
SIGNAL \bc|currentState.s1~q\ : std_logic;
SIGNAL \bc|nextState.s2~1_combout\ : std_logic;
SIGNAL \bc|currentState.s2~q\ : std_logic;
SIGNAL \bo|adder0|gera:1:fa|sum~0_combout\ : std_logic;
SIGNAL \bc|nextState.s2~0_combout\ : std_logic;
SIGNAL \bo|adder0|gera:2:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|adder0|gera:3:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|adder0|gera:3:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|adder0|gera:4:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|adder0|gera:5:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|adder0|gera:5:fa|cout~0_combout\ : std_logic;
SIGNAL \bc|nextState.s5~0_combout\ : std_logic;
SIGNAL \bc|nextState.s5~1_combout\ : std_logic;
SIGNAL \bc|currentState.s5~q\ : std_logic;
SIGNAL \bc|nextState.s3~0_combout\ : std_logic;
SIGNAL \bc|currentState.s3~q\ : std_logic;
SIGNAL \bc|currentState.s4~feeder_combout\ : std_logic;
SIGNAL \bc|currentState.s4~q\ : std_logic;
SIGNAL \bo|reg_i|currentState[0]~0_combout\ : std_logic;
SIGNAL \pB[0]~input_o\ : std_logic;
SIGNAL \pA[6]~input_o\ : std_logic;
SIGNAL \pB[7]~input_o\ : std_logic;
SIGNAL \pA[7]~input_o\ : std_logic;
SIGNAL \bo|subtractor|gera:7:fa|sum~0_combout\ : std_logic;
SIGNAL \pB[6]~input_o\ : std_logic;
SIGNAL \pA[5]~input_o\ : std_logic;
SIGNAL \pB[4]~input_o\ : std_logic;
SIGNAL \bo|reg_pB|currentState[4]~feeder_combout\ : std_logic;
SIGNAL \pA[4]~input_o\ : std_logic;
SIGNAL \bo|subtractor|gera:4:fa|cout~0_combout\ : std_logic;
SIGNAL \pB[5]~input_o\ : std_logic;
SIGNAL \bo|subtractor|gera:4:fa|cout~1_combout\ : std_logic;
SIGNAL \pA[3]~input_o\ : std_logic;
SIGNAL \pB[3]~input_o\ : std_logic;
SIGNAL \pB[2]~input_o\ : std_logic;
SIGNAL \pA[2]~input_o\ : std_logic;
SIGNAL \pB[1]~input_o\ : std_logic;
SIGNAL \pA[1]~input_o\ : std_logic;
SIGNAL \pA[0]~input_o\ : std_logic;
SIGNAL \bo|subtractor|gera:1:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:2:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:4:fa|cout~2_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:5:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:7:fa|sum~combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~0_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~2_combout\ : std_logic;
SIGNAL \bo|adder1|gera:0:fa|sum~combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[0]~feeder_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:1:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~1\ : std_logic;
SIGNAL \bo|absoluto|Add0~3_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~5_combout\ : std_logic;
SIGNAL \bo|adder1|gera:1:fa|sum~combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[1]~feeder_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:2:fa|sum~combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~4\ : std_logic;
SIGNAL \bo|absoluto|Add0~6_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~8_combout\ : std_logic;
SIGNAL \bo|adder1|gera:1:fa|cout~2_combout\ : std_logic;
SIGNAL \bo|adder1|gera:1:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|adder1|gera:1:fa|cout~1_combout\ : std_logic;
SIGNAL \bo|adder1|gera:1:fa|cout~3_combout\ : std_logic;
SIGNAL \bo|adder1|gera:2:fa|sum~combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[2]~feeder_combout\ : std_logic;
SIGNAL \bo|adder1|gera:2:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:3:fa|sum~combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~7\ : std_logic;
SIGNAL \bo|absoluto|Add0~9_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~11_combout\ : std_logic;
SIGNAL \bo|adder1|gera:2:fa|cout~1_combout\ : std_logic;
SIGNAL \bo|adder1|gera:3:fa|sum~combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[3]~feeder_combout\ : std_logic;
SIGNAL \bo|adder1|gera:3:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:4:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:4:fa|sum~combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~10\ : std_logic;
SIGNAL \bo|absoluto|Add0~12_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~14_combout\ : std_logic;
SIGNAL \bo|adder1|gera:4:fa|sum~combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[4]~feeder_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:5:fa|sum~combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~13\ : std_logic;
SIGNAL \bo|absoluto|Add0~15_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~17_combout\ : std_logic;
SIGNAL \bo|adder1|gera:4:fa|cout~1_combout\ : std_logic;
SIGNAL \bo|adder1|gera:4:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|adder1|gera:5:fa|sum~combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[5]~feeder_combout\ : std_logic;
SIGNAL \bo|subtractor|gera:6:fa|sum~combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~16\ : std_logic;
SIGNAL \bo|absoluto|Add0~18_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~20_combout\ : std_logic;
SIGNAL \bo|adder1|gera:5:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|adder1|gera:6:fa|sum~combout\ : std_logic;
SIGNAL \bo|adder1|gera:6:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~19\ : std_logic;
SIGNAL \bo|absoluto|Add0~21_combout\ : std_logic;
SIGNAL \bo|absoluto|Add0~23_combout\ : std_logic;
SIGNAL \bo|adder1|gera:6:fa|cout~1_combout\ : std_logic;
SIGNAL \bo|adder1|gera:7:fa|sum~combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[7]~feeder_combout\ : std_logic;
SIGNAL \bo|adder1|gera:7:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|adder1|gera:8:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[8]~feeder_combout\ : std_logic;
SIGNAL \bo|adder1|gera:9:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[9]~feeder_combout\ : std_logic;
SIGNAL \bo|adder1|gera:10:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[10]~feeder_combout\ : std_logic;
SIGNAL \bo|adder1|gera:10:fa|cout~0_combout\ : std_logic;
SIGNAL \bo|adder1|gera:11:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|adder1|gera:12:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[12]~feeder_combout\ : std_logic;
SIGNAL \bo|adder1|gera:13:fa|sum~0_combout\ : std_logic;
SIGNAL \bo|SAD_reg|currentState[13]~feeder_combout\ : std_logic;
SIGNAL \bo|reg_pB|currentState\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \bo|soma|currentState\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \bo|SAD_reg|currentState\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \bo|reg_i|currentState\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \bo|reg_pA|currentState\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \bc|ALT_INV_currentState.s0~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_ck <= ck;
ww_reset <= reset;
ww_iniciar <= iniciar;
ww_pA <= pA;
ww_pB <= pB;
ender <= ww_ender;
readmem <= ww_readmem;
pronto <= ww_pronto;
sad <= ww_sad;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\ck~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ck~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\bc|ALT_INV_currentState.s0~q\ <= NOT \bc|currentState.s0~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y19_N16
\ender[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|reg_i|currentState\(0),
	devoe => ww_devoe,
	o => \ender[0]~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\ender[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|reg_i|currentState\(1),
	devoe => ww_devoe,
	o => \ender[1]~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\ender[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|reg_i|currentState\(2),
	devoe => ww_devoe,
	o => \ender[2]~output_o\);

-- Location: IOOBUF_X34_Y17_N2
\ender[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|reg_i|currentState\(3),
	devoe => ww_devoe,
	o => \ender[3]~output_o\);

-- Location: IOOBUF_X34_Y17_N16
\ender[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|reg_i|currentState\(4),
	devoe => ww_devoe,
	o => \ender[4]~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\ender[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|reg_i|currentState\(5),
	devoe => ww_devoe,
	o => \ender[5]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\readmem~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \readmem~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\pronto~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bc|ALT_INV_currentState.s0~q\,
	devoe => ww_devoe,
	o => \pronto~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\sad[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(0),
	devoe => ww_devoe,
	o => \sad[0]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\sad[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(1),
	devoe => ww_devoe,
	o => \sad[1]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\sad[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(2),
	devoe => ww_devoe,
	o => \sad[2]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\sad[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(3),
	devoe => ww_devoe,
	o => \sad[3]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\sad[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(4),
	devoe => ww_devoe,
	o => \sad[4]~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\sad[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(5),
	devoe => ww_devoe,
	o => \sad[5]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\sad[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(6),
	devoe => ww_devoe,
	o => \sad[6]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\sad[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(7),
	devoe => ww_devoe,
	o => \sad[7]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\sad[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(8),
	devoe => ww_devoe,
	o => \sad[8]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\sad[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(9),
	devoe => ww_devoe,
	o => \sad[9]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\sad[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(10),
	devoe => ww_devoe,
	o => \sad[10]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\sad[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(11),
	devoe => ww_devoe,
	o => \sad[11]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\sad[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(12),
	devoe => ww_devoe,
	o => \sad[12]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\sad[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bo|SAD_reg|currentState\(13),
	devoe => ww_devoe,
	o => \sad[13]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\ck~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ck,
	o => \ck~input_o\);

-- Location: CLKCTRL_G2
\ck~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ck~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ck~inputclkctrl_outclk\);

-- Location: IOIBUF_X21_Y0_N8
\iniciar~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iniciar,
	o => \iniciar~input_o\);

-- Location: LCCOMB_X22_Y19_N20
\bc|nextState.s0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bc|nextState.s0~combout\ = (!\bc|currentState.s5~q\ & ((\iniciar~input_o\) # (\bc|currentState.s0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iniciar~input_o\,
	datac => \bc|currentState.s0~q\,
	datad => \bc|currentState.s5~q\,
	combout => \bc|nextState.s0~combout\);

-- Location: IOIBUF_X0_Y11_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X22_Y19_N21
\bc|currentState.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bc|nextState.s0~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|currentState.s0~q\);

-- Location: LCCOMB_X22_Y19_N8
\bc|nextState.s1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bc|nextState.s1~0_combout\ = (\iniciar~input_o\ & !\bc|currentState.s0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iniciar~input_o\,
	datad => \bc|currentState.s0~q\,
	combout => \bc|nextState.s1~0_combout\);

-- Location: FF_X22_Y19_N9
\bc|currentState.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bc|nextState.s1~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|currentState.s1~q\);

-- Location: LCCOMB_X22_Y19_N18
\bc|nextState.s2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bc|nextState.s2~1_combout\ = (!\bc|currentState.s5~q\ & (\bc|currentState.s0~q\ & ((\bc|currentState.s1~q\) # (\bc|currentState.s4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bc|currentState.s5~q\,
	datab => \bc|currentState.s1~q\,
	datac => \bc|currentState.s4~q\,
	datad => \bc|currentState.s0~q\,
	combout => \bc|nextState.s2~1_combout\);

-- Location: FF_X22_Y19_N19
\bc|currentState.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bc|nextState.s2~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|currentState.s2~q\);

-- Location: LCCOMB_X26_Y19_N0
\bo|adder0|gera:1:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder0|gera:1:fa|sum~0_combout\ = \bo|reg_i|currentState\(0) $ (\bo|reg_i|currentState\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|reg_i|currentState\(0),
	datac => \bo|reg_i|currentState\(1),
	combout => \bo|adder0|gera:1:fa|sum~0_combout\);

-- Location: LCCOMB_X22_Y19_N10
\bc|nextState.s2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bc|nextState.s2~0_combout\ = (\bc|currentState.s1~q\) # (\bc|currentState.s4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bc|currentState.s1~q\,
	datac => \bc|currentState.s4~q\,
	combout => \bc|nextState.s2~0_combout\);

-- Location: FF_X26_Y19_N1
\bo|reg_i|currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder0|gera:1:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_i|currentState\(1));

-- Location: LCCOMB_X26_Y19_N10
\bo|adder0|gera:2:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder0|gera:2:fa|sum~0_combout\ = \bo|reg_i|currentState\(2) $ (((\bo|reg_i|currentState\(0) & \bo|reg_i|currentState\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|reg_i|currentState\(0),
	datac => \bo|reg_i|currentState\(2),
	datad => \bo|reg_i|currentState\(1),
	combout => \bo|adder0|gera:2:fa|sum~0_combout\);

-- Location: FF_X26_Y19_N11
\bo|reg_i|currentState[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder0|gera:2:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_i|currentState\(2));

-- Location: LCCOMB_X26_Y19_N12
\bo|adder0|gera:3:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder0|gera:3:fa|sum~0_combout\ = \bo|reg_i|currentState\(3) $ (((\bo|reg_i|currentState\(2) & (\bo|reg_i|currentState\(0) & \bo|reg_i|currentState\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_i|currentState\(2),
	datab => \bo|reg_i|currentState\(0),
	datac => \bo|reg_i|currentState\(3),
	datad => \bo|reg_i|currentState\(1),
	combout => \bo|adder0|gera:3:fa|sum~0_combout\);

-- Location: FF_X26_Y19_N13
\bo|reg_i|currentState[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder0|gera:3:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_i|currentState\(3));

-- Location: LCCOMB_X26_Y19_N26
\bo|adder0|gera:3:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder0|gera:3:fa|cout~0_combout\ = (\bo|reg_i|currentState\(2) & (\bo|reg_i|currentState\(1) & (\bo|reg_i|currentState\(0) & \bo|reg_i|currentState\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_i|currentState\(2),
	datab => \bo|reg_i|currentState\(1),
	datac => \bo|reg_i|currentState\(0),
	datad => \bo|reg_i|currentState\(3),
	combout => \bo|adder0|gera:3:fa|cout~0_combout\);

-- Location: LCCOMB_X26_Y19_N6
\bo|adder0|gera:4:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder0|gera:4:fa|sum~0_combout\ = \bo|adder0|gera:3:fa|cout~0_combout\ $ (\bo|reg_i|currentState\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|adder0|gera:3:fa|cout~0_combout\,
	datac => \bo|reg_i|currentState\(4),
	combout => \bo|adder0|gera:4:fa|sum~0_combout\);

-- Location: FF_X26_Y19_N7
\bo|reg_i|currentState[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder0|gera:4:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_i|currentState\(4));

-- Location: LCCOMB_X26_Y19_N20
\bo|adder0|gera:5:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder0|gera:5:fa|sum~0_combout\ = \bo|reg_i|currentState\(5) $ (((\bo|adder0|gera:3:fa|cout~0_combout\ & \bo|reg_i|currentState\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|adder0|gera:3:fa|cout~0_combout\,
	datac => \bo|reg_i|currentState\(5),
	datad => \bo|reg_i|currentState\(4),
	combout => \bo|adder0|gera:5:fa|sum~0_combout\);

-- Location: FF_X26_Y19_N21
\bo|reg_i|currentState[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder0|gera:5:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_i|currentState\(5));

-- Location: LCCOMB_X26_Y19_N4
\bo|adder0|gera:5:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder0|gera:5:fa|cout~0_combout\ = (\bo|reg_i|currentState\(5) & (\bo|adder0|gera:3:fa|cout~0_combout\ & \bo|reg_i|currentState\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|reg_i|currentState\(5),
	datac => \bo|adder0|gera:3:fa|cout~0_combout\,
	datad => \bo|reg_i|currentState\(4),
	combout => \bo|adder0|gera:5:fa|cout~0_combout\);

-- Location: FF_X26_Y19_N5
\bo|reg_i|currentState[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder0|gera:5:fa|cout~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_i|currentState\(6));

-- Location: LCCOMB_X22_Y19_N28
\bc|nextState.s5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bc|nextState.s5~0_combout\ = (\bc|currentState.s5~q\) # ((\bc|currentState.s1~q\) # ((\bc|currentState.s4~q\) # (!\bc|currentState.s0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bc|currentState.s5~q\,
	datab => \bc|currentState.s1~q\,
	datac => \bc|currentState.s4~q\,
	datad => \bc|currentState.s0~q\,
	combout => \bc|nextState.s5~0_combout\);

-- Location: LCCOMB_X22_Y19_N12
\bc|nextState.s5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bc|nextState.s5~1_combout\ = (!\bc|currentState.s3~q\ & (!\bc|nextState.s5~0_combout\ & ((\bo|reg_i|currentState\(6)) # (!\bc|currentState.s2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bc|currentState.s3~q\,
	datab => \bc|currentState.s2~q\,
	datac => \bo|reg_i|currentState\(6),
	datad => \bc|nextState.s5~0_combout\,
	combout => \bc|nextState.s5~1_combout\);

-- Location: FF_X22_Y19_N13
\bc|currentState.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bc|nextState.s5~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|currentState.s5~q\);

-- Location: LCCOMB_X22_Y19_N26
\bc|nextState.s3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bc|nextState.s3~0_combout\ = (!\bc|currentState.s5~q\ & (\bc|currentState.s2~q\ & !\bo|reg_i|currentState\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bc|currentState.s5~q\,
	datab => \bc|currentState.s2~q\,
	datac => \bo|reg_i|currentState\(6),
	combout => \bc|nextState.s3~0_combout\);

-- Location: FF_X22_Y19_N27
\bc|currentState.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bc|nextState.s3~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|currentState.s3~q\);

-- Location: LCCOMB_X22_Y19_N30
\bc|currentState.s4~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bc|currentState.s4~feeder_combout\ = \bc|currentState.s3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bc|currentState.s3~q\,
	combout => \bc|currentState.s4~feeder_combout\);

-- Location: FF_X22_Y19_N31
\bc|currentState.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bc|currentState.s4~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bc|currentState.s4~q\);

-- Location: LCCOMB_X22_Y19_N6
\bo|reg_i|currentState[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|reg_i|currentState[0]~0_combout\ = (!\bc|currentState.s1~q\ & (\bc|currentState.s4~q\ $ (\bo|reg_i|currentState\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bc|currentState.s4~q\,
	datab => \bc|currentState.s1~q\,
	datac => \bo|reg_i|currentState\(0),
	combout => \bo|reg_i|currentState[0]~0_combout\);

-- Location: FF_X22_Y19_N7
\bo|reg_i|currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|reg_i|currentState[0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_i|currentState\(0));

-- Location: IOIBUF_X23_Y24_N15
\pB[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pB(0),
	o => \pB[0]~input_o\);

-- Location: FF_X23_Y19_N19
\bo|reg_pB|currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pB[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pB|currentState\(0));

-- Location: IOIBUF_X28_Y24_N22
\pA[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pA(6),
	o => \pA[6]~input_o\);

-- Location: FF_X24_Y19_N27
\bo|reg_pA|currentState[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pA[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pA|currentState\(6));

-- Location: IOIBUF_X25_Y0_N1
\pB[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pB(7),
	o => \pB[7]~input_o\);

-- Location: FF_X24_Y19_N9
\bo|reg_pB|currentState[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pB[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pB|currentState\(7));

-- Location: IOIBUF_X28_Y24_N1
\pA[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pA(7),
	o => \pA[7]~input_o\);

-- Location: FF_X24_Y19_N3
\bo|reg_pA|currentState[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pA[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pA|currentState\(7));

-- Location: LCCOMB_X24_Y19_N8
\bo|subtractor|gera:7:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:7:fa|sum~0_combout\ = \bo|reg_pB|currentState\(7) $ (\bo|reg_pA|currentState\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|reg_pB|currentState\(7),
	datad => \bo|reg_pA|currentState\(7),
	combout => \bo|subtractor|gera:7:fa|sum~0_combout\);

-- Location: IOIBUF_X30_Y24_N1
\pB[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pB(6),
	o => \pB[6]~input_o\);

-- Location: FF_X24_Y19_N5
\bo|reg_pB|currentState[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pB[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pB|currentState\(6));

-- Location: IOIBUF_X28_Y24_N15
\pA[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pA(5),
	o => \pA[5]~input_o\);

-- Location: FF_X24_Y19_N1
\bo|reg_pA|currentState[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pA[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pA|currentState\(5));

-- Location: IOIBUF_X28_Y24_N8
\pB[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pB(4),
	o => \pB[4]~input_o\);

-- Location: LCCOMB_X24_Y19_N28
\bo|reg_pB|currentState[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|reg_pB|currentState[4]~feeder_combout\ = \pB[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pB[4]~input_o\,
	combout => \bo|reg_pB|currentState[4]~feeder_combout\);

-- Location: FF_X24_Y19_N29
\bo|reg_pB|currentState[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|reg_pB|currentState[4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pB|currentState\(4));

-- Location: IOIBUF_X34_Y18_N15
\pA[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pA(4),
	o => \pA[4]~input_o\);

-- Location: FF_X24_Y19_N31
\bo|reg_pA|currentState[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pA[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pA|currentState\(4));

-- Location: LCCOMB_X24_Y19_N6
\bo|subtractor|gera:4:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:4:fa|cout~0_combout\ = (!\bo|reg_pB|currentState\(4) & \bo|reg_pA|currentState\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|reg_pB|currentState\(4),
	datad => \bo|reg_pA|currentState\(4),
	combout => \bo|subtractor|gera:4:fa|cout~0_combout\);

-- Location: IOIBUF_X34_Y18_N1
\pB[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pB(5),
	o => \pB[5]~input_o\);

-- Location: FF_X24_Y19_N17
\bo|reg_pB|currentState[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pB[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pB|currentState\(5));

-- Location: LCCOMB_X24_Y19_N30
\bo|subtractor|gera:4:fa|cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:4:fa|cout~1_combout\ = (\bo|reg_pA|currentState\(4)) # (!\bo|reg_pB|currentState\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|reg_pA|currentState\(4),
	datad => \bo|reg_pB|currentState\(4),
	combout => \bo|subtractor|gera:4:fa|cout~1_combout\);

-- Location: IOIBUF_X34_Y9_N1
\pA[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pA(3),
	o => \pA[3]~input_o\);

-- Location: FF_X24_Y19_N21
\bo|reg_pA|currentState[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pA[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pA|currentState\(3));

-- Location: IOIBUF_X0_Y11_N22
\pB[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pB(3),
	o => \pB[3]~input_o\);

-- Location: FF_X24_Y19_N11
\bo|reg_pB|currentState[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pB[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pB|currentState\(3));

-- Location: IOIBUF_X16_Y24_N15
\pB[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pB(2),
	o => \pB[2]~input_o\);

-- Location: FF_X24_Y19_N7
\bo|reg_pB|currentState[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pB[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pB|currentState\(2));

-- Location: IOIBUF_X23_Y24_N8
\pA[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pA(2),
	o => \pA[2]~input_o\);

-- Location: FF_X24_Y19_N23
\bo|reg_pA|currentState[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pA[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pA|currentState\(2));

-- Location: IOIBUF_X34_Y12_N15
\pB[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pB(1),
	o => \pB[1]~input_o\);

-- Location: FF_X24_Y19_N19
\bo|reg_pB|currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pB[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pB|currentState\(1));

-- Location: IOIBUF_X34_Y12_N22
\pA[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pA(1),
	o => \pA[1]~input_o\);

-- Location: FF_X24_Y19_N13
\bo|reg_pA|currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pA[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pA|currentState\(1));

-- Location: IOIBUF_X23_Y24_N1
\pA[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pA(0),
	o => \pA[0]~input_o\);

-- Location: FF_X23_Y19_N21
\bo|reg_pA|currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \pA[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|reg_pA|currentState\(0));

-- Location: LCCOMB_X24_Y19_N12
\bo|subtractor|gera:1:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:1:fa|cout~0_combout\ = (\bo|reg_pB|currentState\(1) & (\bo|reg_pA|currentState\(1) & ((\bo|reg_pA|currentState\(0)) # (!\bo|reg_pB|currentState\(0))))) # (!\bo|reg_pB|currentState\(1) & (((\bo|reg_pA|currentState\(1)) # 
-- (\bo|reg_pA|currentState\(0))) # (!\bo|reg_pB|currentState\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pB|currentState\(1),
	datab => \bo|reg_pB|currentState\(0),
	datac => \bo|reg_pA|currentState\(1),
	datad => \bo|reg_pA|currentState\(0),
	combout => \bo|subtractor|gera:1:fa|cout~0_combout\);

-- Location: LCCOMB_X24_Y19_N24
\bo|subtractor|gera:2:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:2:fa|cout~0_combout\ = (\bo|reg_pB|currentState\(2) & (\bo|reg_pA|currentState\(2) & \bo|subtractor|gera:1:fa|cout~0_combout\)) # (!\bo|reg_pB|currentState\(2) & ((\bo|reg_pA|currentState\(2)) # 
-- (\bo|subtractor|gera:1:fa|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pB|currentState\(2),
	datac => \bo|reg_pA|currentState\(2),
	datad => \bo|subtractor|gera:1:fa|cout~0_combout\,
	combout => \bo|subtractor|gera:2:fa|cout~0_combout\);

-- Location: LCCOMB_X24_Y19_N10
\bo|subtractor|gera:4:fa|cout~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:4:fa|cout~2_combout\ = (\bo|subtractor|gera:4:fa|cout~1_combout\ & ((\bo|reg_pA|currentState\(3) & ((\bo|subtractor|gera:2:fa|cout~0_combout\) # (!\bo|reg_pB|currentState\(3)))) # (!\bo|reg_pA|currentState\(3) & 
-- (!\bo|reg_pB|currentState\(3) & \bo|subtractor|gera:2:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:4:fa|cout~1_combout\,
	datab => \bo|reg_pA|currentState\(3),
	datac => \bo|reg_pB|currentState\(3),
	datad => \bo|subtractor|gera:2:fa|cout~0_combout\,
	combout => \bo|subtractor|gera:4:fa|cout~2_combout\);

-- Location: LCCOMB_X24_Y19_N16
\bo|subtractor|gera:5:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:5:fa|cout~0_combout\ = (\bo|reg_pA|currentState\(5) & ((\bo|subtractor|gera:4:fa|cout~0_combout\) # ((\bo|subtractor|gera:4:fa|cout~2_combout\) # (!\bo|reg_pB|currentState\(5))))) # (!\bo|reg_pA|currentState\(5) & 
-- (!\bo|reg_pB|currentState\(5) & ((\bo|subtractor|gera:4:fa|cout~0_combout\) # (\bo|subtractor|gera:4:fa|cout~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pA|currentState\(5),
	datab => \bo|subtractor|gera:4:fa|cout~0_combout\,
	datac => \bo|reg_pB|currentState\(5),
	datad => \bo|subtractor|gera:4:fa|cout~2_combout\,
	combout => \bo|subtractor|gera:5:fa|cout~0_combout\);

-- Location: LCCOMB_X24_Y19_N4
\bo|subtractor|gera:7:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:7:fa|sum~combout\ = \bo|subtractor|gera:7:fa|sum~0_combout\ $ (((\bo|reg_pA|currentState\(6) & ((\bo|subtractor|gera:5:fa|cout~0_combout\) # (!\bo|reg_pB|currentState\(6)))) # (!\bo|reg_pA|currentState\(6) & 
-- (!\bo|reg_pB|currentState\(6) & \bo|subtractor|gera:5:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001111000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pA|currentState\(6),
	datab => \bo|subtractor|gera:7:fa|sum~0_combout\,
	datac => \bo|reg_pB|currentState\(6),
	datad => \bo|subtractor|gera:5:fa|cout~0_combout\,
	combout => \bo|subtractor|gera:7:fa|sum~combout\);

-- Location: LCCOMB_X23_Y19_N2
\bo|absoluto|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~0_combout\ = \bo|reg_pA|currentState\(0) $ (\bo|reg_pB|currentState\(0) $ (GND))
-- \bo|absoluto|Add0~1\ = CARRY(\bo|reg_pA|currentState\(0) $ (!\bo|reg_pB|currentState\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pA|currentState\(0),
	datab => \bo|reg_pB|currentState\(0),
	datad => VCC,
	combout => \bo|absoluto|Add0~0_combout\,
	cout => \bo|absoluto|Add0~1\);

-- Location: LCCOMB_X22_Y19_N24
\bo|absoluto|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~2_combout\ = (\bo|subtractor|gera:7:fa|sum~combout\ & (\bo|reg_pB|currentState\(0) $ ((\bo|reg_pA|currentState\(0))))) # (!\bo|subtractor|gera:7:fa|sum~combout\ & (((\bo|absoluto|Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pB|currentState\(0),
	datab => \bo|subtractor|gera:7:fa|sum~combout\,
	datac => \bo|reg_pA|currentState\(0),
	datad => \bo|absoluto|Add0~0_combout\,
	combout => \bo|absoluto|Add0~2_combout\);

-- Location: LCCOMB_X22_Y19_N16
\bo|adder1|gera:0:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:0:fa|sum~combout\ = \bo|soma|currentState\(0) $ (\bo|absoluto|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(0),
	datad => \bo|absoluto|Add0~2_combout\,
	combout => \bo|adder1|gera:0:fa|sum~combout\);

-- Location: FF_X22_Y19_N17
\bo|soma|currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:0:fa|sum~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(0));

-- Location: LCCOMB_X26_Y19_N18
\bo|SAD_reg|currentState[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[0]~feeder_combout\ = \bo|soma|currentState\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo|soma|currentState\(0),
	combout => \bo|SAD_reg|currentState[0]~feeder_combout\);

-- Location: FF_X26_Y19_N19
\bo|SAD_reg|currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(0));

-- Location: LCCOMB_X23_Y19_N28
\bo|subtractor|gera:1:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:1:fa|sum~0_combout\ = \bo|reg_pA|currentState\(1) $ (\bo|reg_pB|currentState\(1) $ (((\bo|reg_pA|currentState\(0)) # (!\bo|reg_pB|currentState\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001000101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pB|currentState\(0),
	datab => \bo|reg_pA|currentState\(0),
	datac => \bo|reg_pA|currentState\(1),
	datad => \bo|reg_pB|currentState\(1),
	combout => \bo|subtractor|gera:1:fa|sum~0_combout\);

-- Location: LCCOMB_X23_Y19_N4
\bo|absoluto|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~3_combout\ = (\bo|subtractor|gera:1:fa|sum~0_combout\ & (!\bo|absoluto|Add0~1\)) # (!\bo|subtractor|gera:1:fa|sum~0_combout\ & ((\bo|absoluto|Add0~1\) # (GND)))
-- \bo|absoluto|Add0~4\ = CARRY((!\bo|absoluto|Add0~1\) # (!\bo|subtractor|gera:1:fa|sum~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo|subtractor|gera:1:fa|sum~0_combout\,
	datad => VCC,
	cin => \bo|absoluto|Add0~1\,
	combout => \bo|absoluto|Add0~3_combout\,
	cout => \bo|absoluto|Add0~4\);

-- Location: LCCOMB_X24_Y19_N22
\bo|absoluto|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~5_combout\ = (\bo|subtractor|gera:7:fa|sum~combout\ & ((!\bo|subtractor|gera:1:fa|sum~0_combout\))) # (!\bo|subtractor|gera:7:fa|sum~combout\ & (\bo|absoluto|Add0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:7:fa|sum~combout\,
	datab => \bo|absoluto|Add0~3_combout\,
	datad => \bo|subtractor|gera:1:fa|sum~0_combout\,
	combout => \bo|absoluto|Add0~5_combout\);

-- Location: LCCOMB_X26_Y19_N2
\bo|adder1|gera:1:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:1:fa|sum~combout\ = \bo|soma|currentState\(1) $ (\bo|absoluto|Add0~5_combout\ $ (((\bo|absoluto|Add0~2_combout\ & \bo|soma|currentState\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|absoluto|Add0~2_combout\,
	datab => \bo|soma|currentState\(0),
	datac => \bo|soma|currentState\(1),
	datad => \bo|absoluto|Add0~5_combout\,
	combout => \bo|adder1|gera:1:fa|sum~combout\);

-- Location: FF_X26_Y19_N3
\bo|soma|currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:1:fa|sum~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(1));

-- Location: LCCOMB_X26_Y19_N28
\bo|SAD_reg|currentState[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[1]~feeder_combout\ = \bo|soma|currentState\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo|soma|currentState\(1),
	combout => \bo|SAD_reg|currentState[1]~feeder_combout\);

-- Location: FF_X26_Y19_N29
\bo|SAD_reg|currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(1));

-- Location: LCCOMB_X24_Y19_N2
\bo|subtractor|gera:2:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:2:fa|sum~combout\ = \bo|reg_pB|currentState\(2) $ (\bo|reg_pA|currentState\(2) $ (\bo|subtractor|gera:1:fa|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pB|currentState\(2),
	datab => \bo|reg_pA|currentState\(2),
	datad => \bo|subtractor|gera:1:fa|cout~0_combout\,
	combout => \bo|subtractor|gera:2:fa|sum~combout\);

-- Location: LCCOMB_X23_Y19_N6
\bo|absoluto|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~6_combout\ = (\bo|subtractor|gera:2:fa|sum~combout\ & (\bo|absoluto|Add0~4\ $ (GND))) # (!\bo|subtractor|gera:2:fa|sum~combout\ & (!\bo|absoluto|Add0~4\ & VCC))
-- \bo|absoluto|Add0~7\ = CARRY((\bo|subtractor|gera:2:fa|sum~combout\ & !\bo|absoluto|Add0~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:2:fa|sum~combout\,
	datad => VCC,
	cin => \bo|absoluto|Add0~4\,
	combout => \bo|absoluto|Add0~6_combout\,
	cout => \bo|absoluto|Add0~7\);

-- Location: LCCOMB_X19_Y19_N20
\bo|absoluto|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~8_combout\ = (\bo|subtractor|gera:7:fa|sum~combout\ & (!\bo|subtractor|gera:2:fa|sum~combout\)) # (!\bo|subtractor|gera:7:fa|sum~combout\ & ((\bo|absoluto|Add0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:2:fa|sum~combout\,
	datac => \bo|absoluto|Add0~6_combout\,
	datad => \bo|subtractor|gera:7:fa|sum~combout\,
	combout => \bo|absoluto|Add0~8_combout\);

-- Location: LCCOMB_X23_Y19_N20
\bo|adder1|gera:1:fa|cout~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:1:fa|cout~2_combout\ = (\bo|soma|currentState\(0)) # ((\bo|soma|currentState\(1) & !\bo|subtractor|gera:1:fa|sum~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(0),
	datab => \bo|soma|currentState\(1),
	datad => \bo|subtractor|gera:1:fa|sum~0_combout\,
	combout => \bo|adder1|gera:1:fa|cout~2_combout\);

-- Location: LCCOMB_X23_Y19_N18
\bo|adder1|gera:1:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:1:fa|cout~0_combout\ = (\bo|soma|currentState\(1) & ((\bo|reg_pA|currentState\(0) $ (\bo|reg_pB|currentState\(0))) # (!\bo|subtractor|gera:1:fa|sum~0_combout\))) # (!\bo|soma|currentState\(1) & (!\bo|subtractor|gera:1:fa|sum~0_combout\ & 
-- (\bo|reg_pA|currentState\(0) $ (\bo|reg_pB|currentState\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pA|currentState\(0),
	datab => \bo|soma|currentState\(1),
	datac => \bo|reg_pB|currentState\(0),
	datad => \bo|subtractor|gera:1:fa|sum~0_combout\,
	combout => \bo|adder1|gera:1:fa|cout~0_combout\);

-- Location: LCCOMB_X23_Y19_N30
\bo|adder1|gera:1:fa|cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:1:fa|cout~1_combout\ = (\bo|soma|currentState\(1) & ((\bo|absoluto|Add0~3_combout\) # ((\bo|soma|currentState\(0) & \bo|absoluto|Add0~0_combout\)))) # (!\bo|soma|currentState\(1) & (\bo|soma|currentState\(0) & (\bo|absoluto|Add0~3_combout\ 
-- & \bo|absoluto|Add0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(0),
	datab => \bo|soma|currentState\(1),
	datac => \bo|absoluto|Add0~3_combout\,
	datad => \bo|absoluto|Add0~0_combout\,
	combout => \bo|adder1|gera:1:fa|cout~1_combout\);

-- Location: LCCOMB_X19_Y19_N30
\bo|adder1|gera:1:fa|cout~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:1:fa|cout~3_combout\ = (\bo|subtractor|gera:7:fa|sum~combout\ & (\bo|adder1|gera:1:fa|cout~2_combout\ & (\bo|adder1|gera:1:fa|cout~0_combout\))) # (!\bo|subtractor|gera:7:fa|sum~combout\ & (((\bo|adder1|gera:1:fa|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|adder1|gera:1:fa|cout~2_combout\,
	datab => \bo|adder1|gera:1:fa|cout~0_combout\,
	datac => \bo|adder1|gera:1:fa|cout~1_combout\,
	datad => \bo|subtractor|gera:7:fa|sum~combout\,
	combout => \bo|adder1|gera:1:fa|cout~3_combout\);

-- Location: LCCOMB_X19_Y19_N24
\bo|adder1|gera:2:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:2:fa|sum~combout\ = \bo|absoluto|Add0~8_combout\ $ (\bo|soma|currentState\(2) $ (\bo|adder1|gera:1:fa|cout~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|absoluto|Add0~8_combout\,
	datac => \bo|soma|currentState\(2),
	datad => \bo|adder1|gera:1:fa|cout~3_combout\,
	combout => \bo|adder1|gera:2:fa|sum~combout\);

-- Location: FF_X19_Y19_N25
\bo|soma|currentState[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:2:fa|sum~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(2));

-- Location: LCCOMB_X19_Y19_N28
\bo|SAD_reg|currentState[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[2]~feeder_combout\ = \bo|soma|currentState\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(2),
	combout => \bo|SAD_reg|currentState[2]~feeder_combout\);

-- Location: FF_X19_Y19_N29
\bo|SAD_reg|currentState[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(2));

-- Location: LCCOMB_X19_Y19_N10
\bo|adder1|gera:2:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:2:fa|cout~0_combout\ = (\bo|soma|currentState\(2) & ((\bo|subtractor|gera:7:fa|sum~combout\ & (!\bo|subtractor|gera:2:fa|sum~combout\)) # (!\bo|subtractor|gera:7:fa|sum~combout\ & ((\bo|absoluto|Add0~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:2:fa|sum~combout\,
	datab => \bo|soma|currentState\(2),
	datac => \bo|absoluto|Add0~6_combout\,
	datad => \bo|subtractor|gera:7:fa|sum~combout\,
	combout => \bo|adder1|gera:2:fa|cout~0_combout\);

-- Location: LCCOMB_X24_Y19_N20
\bo|subtractor|gera:3:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:3:fa|sum~combout\ = \bo|reg_pB|currentState\(3) $ (\bo|reg_pA|currentState\(3) $ (\bo|subtractor|gera:2:fa|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pB|currentState\(3),
	datac => \bo|reg_pA|currentState\(3),
	datad => \bo|subtractor|gera:2:fa|cout~0_combout\,
	combout => \bo|subtractor|gera:3:fa|sum~combout\);

-- Location: LCCOMB_X23_Y19_N8
\bo|absoluto|Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~9_combout\ = (\bo|subtractor|gera:3:fa|sum~combout\ & (!\bo|absoluto|Add0~7\)) # (!\bo|subtractor|gera:3:fa|sum~combout\ & ((\bo|absoluto|Add0~7\) # (GND)))
-- \bo|absoluto|Add0~10\ = CARRY((!\bo|absoluto|Add0~7\) # (!\bo|subtractor|gera:3:fa|sum~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:3:fa|sum~combout\,
	datad => VCC,
	cin => \bo|absoluto|Add0~7\,
	combout => \bo|absoluto|Add0~9_combout\,
	cout => \bo|absoluto|Add0~10\);

-- Location: LCCOMB_X19_Y19_N4
\bo|absoluto|Add0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~11_combout\ = (\bo|subtractor|gera:7:fa|sum~combout\ & (!\bo|subtractor|gera:3:fa|sum~combout\)) # (!\bo|subtractor|gera:7:fa|sum~combout\ & ((\bo|absoluto|Add0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|subtractor|gera:3:fa|sum~combout\,
	datac => \bo|absoluto|Add0~9_combout\,
	datad => \bo|subtractor|gera:7:fa|sum~combout\,
	combout => \bo|absoluto|Add0~11_combout\);

-- Location: LCCOMB_X19_Y19_N12
\bo|adder1|gera:2:fa|cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:2:fa|cout~1_combout\ = (\bo|adder1|gera:1:fa|cout~3_combout\ & ((\bo|soma|currentState\(2)) # (\bo|absoluto|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(2),
	datac => \bo|adder1|gera:1:fa|cout~3_combout\,
	datad => \bo|absoluto|Add0~8_combout\,
	combout => \bo|adder1|gera:2:fa|cout~1_combout\);

-- Location: LCCOMB_X19_Y19_N22
\bo|adder1|gera:3:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:3:fa|sum~combout\ = \bo|absoluto|Add0~11_combout\ $ (\bo|soma|currentState\(3) $ (((\bo|adder1|gera:2:fa|cout~0_combout\) # (\bo|adder1|gera:2:fa|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|adder1|gera:2:fa|cout~0_combout\,
	datab => \bo|absoluto|Add0~11_combout\,
	datac => \bo|soma|currentState\(3),
	datad => \bo|adder1|gera:2:fa|cout~1_combout\,
	combout => \bo|adder1|gera:3:fa|sum~combout\);

-- Location: FF_X19_Y19_N23
\bo|soma|currentState[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:3:fa|sum~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(3));

-- Location: LCCOMB_X19_Y19_N26
\bo|SAD_reg|currentState[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[3]~feeder_combout\ = \bo|soma|currentState\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo|soma|currentState\(3),
	combout => \bo|SAD_reg|currentState[3]~feeder_combout\);

-- Location: FF_X19_Y19_N27
\bo|SAD_reg|currentState[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(3));

-- Location: LCCOMB_X19_Y19_N0
\bo|adder1|gera:3:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:3:fa|cout~0_combout\ = (\bo|soma|currentState\(3) & ((\bo|adder1|gera:2:fa|cout~0_combout\) # ((\bo|absoluto|Add0~11_combout\) # (\bo|adder1|gera:2:fa|cout~1_combout\)))) # (!\bo|soma|currentState\(3) & (\bo|absoluto|Add0~11_combout\ & 
-- ((\bo|adder1|gera:2:fa|cout~0_combout\) # (\bo|adder1|gera:2:fa|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|adder1|gera:2:fa|cout~0_combout\,
	datab => \bo|soma|currentState\(3),
	datac => \bo|absoluto|Add0~11_combout\,
	datad => \bo|adder1|gera:2:fa|cout~1_combout\,
	combout => \bo|adder1|gera:3:fa|cout~0_combout\);

-- Location: LCCOMB_X24_Y19_N18
\bo|subtractor|gera:4:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:4:fa|sum~0_combout\ = \bo|reg_pB|currentState\(4) $ (\bo|reg_pA|currentState\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|reg_pB|currentState\(4),
	datad => \bo|reg_pA|currentState\(4),
	combout => \bo|subtractor|gera:4:fa|sum~0_combout\);

-- Location: LCCOMB_X24_Y19_N14
\bo|subtractor|gera:4:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:4:fa|sum~combout\ = \bo|subtractor|gera:4:fa|sum~0_combout\ $ (((\bo|reg_pA|currentState\(3) & ((\bo|subtractor|gera:2:fa|cout~0_combout\) # (!\bo|reg_pB|currentState\(3)))) # (!\bo|reg_pA|currentState\(3) & 
-- (!\bo|reg_pB|currentState\(3) & \bo|subtractor|gera:2:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001111000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pA|currentState\(3),
	datab => \bo|subtractor|gera:4:fa|sum~0_combout\,
	datac => \bo|reg_pB|currentState\(3),
	datad => \bo|subtractor|gera:2:fa|cout~0_combout\,
	combout => \bo|subtractor|gera:4:fa|sum~combout\);

-- Location: LCCOMB_X23_Y19_N10
\bo|absoluto|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~12_combout\ = (\bo|subtractor|gera:4:fa|sum~combout\ & (\bo|absoluto|Add0~10\ $ (GND))) # (!\bo|subtractor|gera:4:fa|sum~combout\ & (!\bo|absoluto|Add0~10\ & VCC))
-- \bo|absoluto|Add0~13\ = CARRY((\bo|subtractor|gera:4:fa|sum~combout\ & !\bo|absoluto|Add0~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo|subtractor|gera:4:fa|sum~combout\,
	datad => VCC,
	cin => \bo|absoluto|Add0~10\,
	combout => \bo|absoluto|Add0~12_combout\,
	cout => \bo|absoluto|Add0~13\);

-- Location: LCCOMB_X19_Y19_N14
\bo|absoluto|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~14_combout\ = (\bo|subtractor|gera:7:fa|sum~combout\ & (!\bo|subtractor|gera:4:fa|sum~combout\)) # (!\bo|subtractor|gera:7:fa|sum~combout\ & ((\bo|absoluto|Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:7:fa|sum~combout\,
	datac => \bo|subtractor|gera:4:fa|sum~combout\,
	datad => \bo|absoluto|Add0~12_combout\,
	combout => \bo|absoluto|Add0~14_combout\);

-- Location: LCCOMB_X19_Y19_N16
\bo|adder1|gera:4:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:4:fa|sum~combout\ = \bo|adder1|gera:3:fa|cout~0_combout\ $ (\bo|soma|currentState\(4) $ (\bo|absoluto|Add0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|adder1|gera:3:fa|cout~0_combout\,
	datac => \bo|soma|currentState\(4),
	datad => \bo|absoluto|Add0~14_combout\,
	combout => \bo|adder1|gera:4:fa|sum~combout\);

-- Location: FF_X19_Y19_N17
\bo|soma|currentState[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:4:fa|sum~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(4));

-- Location: LCCOMB_X21_Y19_N0
\bo|SAD_reg|currentState[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[4]~feeder_combout\ = \bo|soma|currentState\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo|soma|currentState\(4),
	combout => \bo|SAD_reg|currentState[4]~feeder_combout\);

-- Location: FF_X21_Y19_N1
\bo|SAD_reg|currentState[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(4));

-- Location: LCCOMB_X24_Y19_N0
\bo|subtractor|gera:5:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:5:fa|sum~combout\ = \bo|reg_pB|currentState\(5) $ (\bo|reg_pA|currentState\(5) $ (((\bo|subtractor|gera:4:fa|cout~0_combout\) # (\bo|subtractor|gera:4:fa|cout~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|reg_pB|currentState\(5),
	datab => \bo|subtractor|gera:4:fa|cout~0_combout\,
	datac => \bo|reg_pA|currentState\(5),
	datad => \bo|subtractor|gera:4:fa|cout~2_combout\,
	combout => \bo|subtractor|gera:5:fa|sum~combout\);

-- Location: LCCOMB_X23_Y19_N12
\bo|absoluto|Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~15_combout\ = (\bo|subtractor|gera:5:fa|sum~combout\ & (!\bo|absoluto|Add0~13\)) # (!\bo|subtractor|gera:5:fa|sum~combout\ & ((\bo|absoluto|Add0~13\) # (GND)))
-- \bo|absoluto|Add0~16\ = CARRY((!\bo|absoluto|Add0~13\) # (!\bo|subtractor|gera:5:fa|sum~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo|subtractor|gera:5:fa|sum~combout\,
	datad => VCC,
	cin => \bo|absoluto|Add0~13\,
	combout => \bo|absoluto|Add0~15_combout\,
	cout => \bo|absoluto|Add0~16\);

-- Location: LCCOMB_X23_Y19_N0
\bo|absoluto|Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~17_combout\ = (\bo|subtractor|gera:7:fa|sum~combout\ & (!\bo|subtractor|gera:5:fa|sum~combout\)) # (!\bo|subtractor|gera:7:fa|sum~combout\ & ((\bo|absoluto|Add0~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|subtractor|gera:7:fa|sum~combout\,
	datac => \bo|subtractor|gera:5:fa|sum~combout\,
	datad => \bo|absoluto|Add0~15_combout\,
	combout => \bo|absoluto|Add0~17_combout\);

-- Location: LCCOMB_X19_Y19_N18
\bo|adder1|gera:4:fa|cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:4:fa|cout~1_combout\ = (\bo|adder1|gera:3:fa|cout~0_combout\ & ((\bo|soma|currentState\(4)) # (\bo|absoluto|Add0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|soma|currentState\(4),
	datac => \bo|absoluto|Add0~14_combout\,
	datad => \bo|adder1|gera:3:fa|cout~0_combout\,
	combout => \bo|adder1|gera:4:fa|cout~1_combout\);

-- Location: LCCOMB_X23_Y19_N22
\bo|adder1|gera:4:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:4:fa|cout~0_combout\ = (\bo|soma|currentState\(4) & ((\bo|subtractor|gera:7:fa|sum~combout\ & (!\bo|subtractor|gera:4:fa|sum~combout\)) # (!\bo|subtractor|gera:7:fa|sum~combout\ & ((\bo|absoluto|Add0~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:4:fa|sum~combout\,
	datab => \bo|subtractor|gera:7:fa|sum~combout\,
	datac => \bo|soma|currentState\(4),
	datad => \bo|absoluto|Add0~12_combout\,
	combout => \bo|adder1|gera:4:fa|cout~0_combout\);

-- Location: LCCOMB_X19_Y19_N6
\bo|adder1|gera:5:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:5:fa|sum~combout\ = \bo|absoluto|Add0~17_combout\ $ (\bo|soma|currentState\(5) $ (((\bo|adder1|gera:4:fa|cout~1_combout\) # (\bo|adder1|gera:4:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|absoluto|Add0~17_combout\,
	datab => \bo|adder1|gera:4:fa|cout~1_combout\,
	datac => \bo|soma|currentState\(5),
	datad => \bo|adder1|gera:4:fa|cout~0_combout\,
	combout => \bo|adder1|gera:5:fa|sum~combout\);

-- Location: FF_X19_Y19_N7
\bo|soma|currentState[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:5:fa|sum~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(5));

-- Location: LCCOMB_X18_Y19_N12
\bo|SAD_reg|currentState[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[5]~feeder_combout\ = \bo|soma|currentState\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(5),
	combout => \bo|SAD_reg|currentState[5]~feeder_combout\);

-- Location: FF_X18_Y19_N13
\bo|SAD_reg|currentState[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(5));

-- Location: LCCOMB_X24_Y19_N26
\bo|subtractor|gera:6:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|subtractor|gera:6:fa|sum~combout\ = \bo|reg_pB|currentState\(6) $ (\bo|reg_pA|currentState\(6) $ (\bo|subtractor|gera:5:fa|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|reg_pB|currentState\(6),
	datac => \bo|reg_pA|currentState\(6),
	datad => \bo|subtractor|gera:5:fa|cout~0_combout\,
	combout => \bo|subtractor|gera:6:fa|sum~combout\);

-- Location: LCCOMB_X23_Y19_N14
\bo|absoluto|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~18_combout\ = (\bo|subtractor|gera:6:fa|sum~combout\ & (\bo|absoluto|Add0~16\ $ (GND))) # (!\bo|subtractor|gera:6:fa|sum~combout\ & (!\bo|absoluto|Add0~16\ & VCC))
-- \bo|absoluto|Add0~19\ = CARRY((\bo|subtractor|gera:6:fa|sum~combout\ & !\bo|absoluto|Add0~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo|subtractor|gera:6:fa|sum~combout\,
	datad => VCC,
	cin => \bo|absoluto|Add0~16\,
	combout => \bo|absoluto|Add0~18_combout\,
	cout => \bo|absoluto|Add0~19\);

-- Location: LCCOMB_X18_Y19_N14
\bo|absoluto|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~20_combout\ = (\bo|subtractor|gera:7:fa|sum~combout\ & (!\bo|subtractor|gera:6:fa|sum~combout\)) # (!\bo|subtractor|gera:7:fa|sum~combout\ & ((\bo|absoluto|Add0~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|subtractor|gera:7:fa|sum~combout\,
	datac => \bo|subtractor|gera:6:fa|sum~combout\,
	datad => \bo|absoluto|Add0~18_combout\,
	combout => \bo|absoluto|Add0~20_combout\);

-- Location: LCCOMB_X18_Y19_N20
\bo|adder1|gera:5:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:5:fa|cout~0_combout\ = (\bo|soma|currentState\(5) & ((\bo|adder1|gera:4:fa|cout~0_combout\) # ((\bo|absoluto|Add0~17_combout\) # (\bo|adder1|gera:4:fa|cout~1_combout\)))) # (!\bo|soma|currentState\(5) & (\bo|absoluto|Add0~17_combout\ & 
-- ((\bo|adder1|gera:4:fa|cout~0_combout\) # (\bo|adder1|gera:4:fa|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|adder1|gera:4:fa|cout~0_combout\,
	datab => \bo|soma|currentState\(5),
	datac => \bo|absoluto|Add0~17_combout\,
	datad => \bo|adder1|gera:4:fa|cout~1_combout\,
	combout => \bo|adder1|gera:5:fa|cout~0_combout\);

-- Location: LCCOMB_X18_Y19_N16
\bo|adder1|gera:6:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:6:fa|sum~combout\ = \bo|absoluto|Add0~20_combout\ $ (\bo|soma|currentState\(6) $ (\bo|adder1|gera:5:fa|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|absoluto|Add0~20_combout\,
	datac => \bo|soma|currentState\(6),
	datad => \bo|adder1|gera:5:fa|cout~0_combout\,
	combout => \bo|adder1|gera:6:fa|sum~combout\);

-- Location: FF_X18_Y19_N17
\bo|soma|currentState[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:6:fa|sum~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(6));

-- Location: FF_X23_Y19_N11
\bo|SAD_reg|currentState[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \bo|soma|currentState\(6),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(6));

-- Location: LCCOMB_X23_Y19_N26
\bo|adder1|gera:6:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:6:fa|cout~0_combout\ = (\bo|soma|currentState\(6) & ((\bo|subtractor|gera:7:fa|sum~combout\ & (!\bo|subtractor|gera:6:fa|sum~combout\)) # (!\bo|subtractor|gera:7:fa|sum~combout\ & ((\bo|absoluto|Add0~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(6),
	datab => \bo|subtractor|gera:6:fa|sum~combout\,
	datac => \bo|absoluto|Add0~18_combout\,
	datad => \bo|subtractor|gera:7:fa|sum~combout\,
	combout => \bo|adder1|gera:6:fa|cout~0_combout\);

-- Location: LCCOMB_X23_Y19_N16
\bo|absoluto|Add0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~21_combout\ = \bo|absoluto|Add0~19\ $ (\bo|subtractor|gera:7:fa|sum~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \bo|subtractor|gera:7:fa|sum~combout\,
	cin => \bo|absoluto|Add0~19\,
	combout => \bo|absoluto|Add0~21_combout\);

-- Location: LCCOMB_X23_Y19_N24
\bo|absoluto|Add0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|absoluto|Add0~23_combout\ = (!\bo|subtractor|gera:7:fa|sum~combout\ & \bo|absoluto|Add0~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|subtractor|gera:7:fa|sum~combout\,
	datad => \bo|absoluto|Add0~21_combout\,
	combout => \bo|absoluto|Add0~23_combout\);

-- Location: LCCOMB_X18_Y19_N10
\bo|adder1|gera:6:fa|cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:6:fa|cout~1_combout\ = (\bo|adder1|gera:5:fa|cout~0_combout\ & ((\bo|soma|currentState\(6)) # (\bo|absoluto|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|soma|currentState\(6),
	datac => \bo|absoluto|Add0~20_combout\,
	datad => \bo|adder1|gera:5:fa|cout~0_combout\,
	combout => \bo|adder1|gera:6:fa|cout~1_combout\);

-- Location: LCCOMB_X18_Y19_N18
\bo|adder1|gera:7:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:7:fa|sum~combout\ = \bo|absoluto|Add0~23_combout\ $ (\bo|soma|currentState\(7) $ (((\bo|adder1|gera:6:fa|cout~0_combout\) # (\bo|adder1|gera:6:fa|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|adder1|gera:6:fa|cout~0_combout\,
	datab => \bo|absoluto|Add0~23_combout\,
	datac => \bo|soma|currentState\(7),
	datad => \bo|adder1|gera:6:fa|cout~1_combout\,
	combout => \bo|adder1|gera:7:fa|sum~combout\);

-- Location: FF_X18_Y19_N19
\bo|soma|currentState[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:7:fa|sum~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(7));

-- Location: LCCOMB_X19_Y19_N8
\bo|SAD_reg|currentState[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[7]~feeder_combout\ = \bo|soma|currentState\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(7),
	combout => \bo|SAD_reg|currentState[7]~feeder_combout\);

-- Location: FF_X19_Y19_N9
\bo|SAD_reg|currentState[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[7]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(7));

-- Location: LCCOMB_X18_Y19_N28
\bo|adder1|gera:7:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:7:fa|cout~0_combout\ = (\bo|soma|currentState\(7) & ((\bo|absoluto|Add0~23_combout\) # ((\bo|adder1|gera:6:fa|cout~0_combout\) # (\bo|adder1|gera:6:fa|cout~1_combout\)))) # (!\bo|soma|currentState\(7) & (\bo|absoluto|Add0~23_combout\ & 
-- ((\bo|adder1|gera:6:fa|cout~0_combout\) # (\bo|adder1|gera:6:fa|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(7),
	datab => \bo|absoluto|Add0~23_combout\,
	datac => \bo|adder1|gera:6:fa|cout~0_combout\,
	datad => \bo|adder1|gera:6:fa|cout~1_combout\,
	combout => \bo|adder1|gera:7:fa|cout~0_combout\);

-- Location: LCCOMB_X18_Y19_N0
\bo|adder1|gera:8:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:8:fa|sum~0_combout\ = \bo|soma|currentState\(8) $ (\bo|adder1|gera:7:fa|cout~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(8),
	datad => \bo|adder1|gera:7:fa|cout~0_combout\,
	combout => \bo|adder1|gera:8:fa|sum~0_combout\);

-- Location: FF_X18_Y19_N1
\bo|soma|currentState[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:8:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(8));

-- Location: LCCOMB_X18_Y20_N12
\bo|SAD_reg|currentState[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[8]~feeder_combout\ = \bo|soma|currentState\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo|soma|currentState\(8),
	combout => \bo|SAD_reg|currentState[8]~feeder_combout\);

-- Location: FF_X18_Y20_N13
\bo|SAD_reg|currentState[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[8]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(8));

-- Location: LCCOMB_X18_Y19_N30
\bo|adder1|gera:9:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:9:fa|sum~0_combout\ = \bo|soma|currentState\(9) $ (((\bo|soma|currentState\(8) & \bo|adder1|gera:7:fa|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo|soma|currentState\(8),
	datac => \bo|soma|currentState\(9),
	datad => \bo|adder1|gera:7:fa|cout~0_combout\,
	combout => \bo|adder1|gera:9:fa|sum~0_combout\);

-- Location: FF_X18_Y19_N31
\bo|soma|currentState[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:9:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(9));

-- Location: LCCOMB_X18_Y20_N14
\bo|SAD_reg|currentState[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[9]~feeder_combout\ = \bo|soma|currentState\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo|soma|currentState\(9),
	combout => \bo|SAD_reg|currentState[9]~feeder_combout\);

-- Location: FF_X18_Y20_N15
\bo|SAD_reg|currentState[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[9]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(9));

-- Location: LCCOMB_X18_Y19_N4
\bo|adder1|gera:10:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:10:fa|sum~0_combout\ = \bo|soma|currentState\(10) $ (((\bo|soma|currentState\(9) & (\bo|soma|currentState\(8) & \bo|adder1|gera:7:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(9),
	datab => \bo|soma|currentState\(8),
	datac => \bo|soma|currentState\(10),
	datad => \bo|adder1|gera:7:fa|cout~0_combout\,
	combout => \bo|adder1|gera:10:fa|sum~0_combout\);

-- Location: FF_X18_Y19_N5
\bo|soma|currentState[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:10:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(10));

-- Location: LCCOMB_X18_Y19_N6
\bo|SAD_reg|currentState[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[10]~feeder_combout\ = \bo|soma|currentState\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(10),
	combout => \bo|SAD_reg|currentState[10]~feeder_combout\);

-- Location: FF_X18_Y19_N7
\bo|SAD_reg|currentState[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[10]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(10));

-- Location: LCCOMB_X18_Y19_N2
\bo|adder1|gera:10:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:10:fa|cout~0_combout\ = (\bo|soma|currentState\(9) & (\bo|soma|currentState\(8) & (\bo|soma|currentState\(10) & \bo|adder1|gera:7:fa|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(9),
	datab => \bo|soma|currentState\(8),
	datac => \bo|soma|currentState\(10),
	datad => \bo|adder1|gera:7:fa|cout~0_combout\,
	combout => \bo|adder1|gera:10:fa|cout~0_combout\);

-- Location: LCCOMB_X18_Y19_N22
\bo|adder1|gera:11:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:11:fa|sum~0_combout\ = \bo|soma|currentState\(11) $ (\bo|adder1|gera:10:fa|cout~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(11),
	datad => \bo|adder1|gera:10:fa|cout~0_combout\,
	combout => \bo|adder1|gera:11:fa|sum~0_combout\);

-- Location: FF_X18_Y19_N23
\bo|soma|currentState[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:11:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(11));

-- Location: FF_X18_Y20_N5
\bo|SAD_reg|currentState[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \bo|soma|currentState\(11),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(11));

-- Location: LCCOMB_X18_Y19_N8
\bo|adder1|gera:12:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:12:fa|sum~0_combout\ = \bo|soma|currentState\(12) $ (((\bo|soma|currentState\(11) & \bo|adder1|gera:10:fa|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(11),
	datac => \bo|soma|currentState\(12),
	datad => \bo|adder1|gera:10:fa|cout~0_combout\,
	combout => \bo|adder1|gera:12:fa|sum~0_combout\);

-- Location: FF_X18_Y19_N9
\bo|soma|currentState[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:12:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(12));

-- Location: LCCOMB_X18_Y19_N24
\bo|SAD_reg|currentState[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[12]~feeder_combout\ = \bo|soma|currentState\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(12),
	combout => \bo|SAD_reg|currentState[12]~feeder_combout\);

-- Location: FF_X18_Y19_N25
\bo|SAD_reg|currentState[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[12]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(12));

-- Location: LCCOMB_X18_Y19_N26
\bo|adder1|gera:13:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|adder1|gera:13:fa|sum~0_combout\ = \bo|soma|currentState\(13) $ (((\bo|soma|currentState\(11) & (\bo|soma|currentState\(12) & \bo|adder1|gera:10:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo|soma|currentState\(11),
	datab => \bo|soma|currentState\(12),
	datac => \bo|soma|currentState\(13),
	datad => \bo|adder1|gera:10:fa|cout~0_combout\,
	combout => \bo|adder1|gera:13:fa|sum~0_combout\);

-- Location: FF_X18_Y19_N27
\bo|soma|currentState[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|adder1|gera:13:fa|sum~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \bc|currentState.s1~q\,
	ena => \bc|nextState.s2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|soma|currentState\(13));

-- Location: LCCOMB_X19_Y19_N2
\bo|SAD_reg|currentState[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bo|SAD_reg|currentState[13]~feeder_combout\ = \bo|soma|currentState\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bo|soma|currentState\(13),
	combout => \bo|SAD_reg|currentState[13]~feeder_combout\);

-- Location: FF_X19_Y19_N3
\bo|SAD_reg|currentState[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \bo|SAD_reg|currentState[13]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \bc|currentState.s5~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bo|SAD_reg|currentState\(13));

ww_ender(0) <= \ender[0]~output_o\;

ww_ender(1) <= \ender[1]~output_o\;

ww_ender(2) <= \ender[2]~output_o\;

ww_ender(3) <= \ender[3]~output_o\;

ww_ender(4) <= \ender[4]~output_o\;

ww_ender(5) <= \ender[5]~output_o\;

ww_readmem <= \readmem~output_o\;

ww_pronto <= \pronto~output_o\;

ww_sad(0) <= \sad[0]~output_o\;

ww_sad(1) <= \sad[1]~output_o\;

ww_sad(2) <= \sad[2]~output_o\;

ww_sad(3) <= \sad[3]~output_o\;

ww_sad(4) <= \sad[4]~output_o\;

ww_sad(5) <= \sad[5]~output_o\;

ww_sad(6) <= \sad[6]~output_o\;

ww_sad(7) <= \sad[7]~output_o\;

ww_sad(8) <= \sad[8]~output_o\;

ww_sad(9) <= \sad[9]~output_o\;

ww_sad(10) <= \sad[10]~output_o\;

ww_sad(11) <= \sad[11]~output_o\;

ww_sad(12) <= \sad[12]~output_o\;

ww_sad(13) <= \sad[13]~output_o\;
END structure;


