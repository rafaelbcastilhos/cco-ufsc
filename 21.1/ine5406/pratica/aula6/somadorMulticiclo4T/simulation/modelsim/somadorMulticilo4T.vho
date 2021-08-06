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

-- DATE "07/28/2021 18:35:30"

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

ENTITY 	somadorMulticilo4T IS
    PORT (
	ck : IN std_logic;
	reset : IN std_logic;
	iniciar : IN std_logic;
	erro : OUT std_logic;
	pronto : OUT std_logic;
	ent : IN std_logic_vector(7 DOWNTO 0);
	n : IN std_logic_vector(3 DOWNTO 0);
	soma : OUT std_logic_vector(7 DOWNTO 0);
	\stateBC.S0\ : OUT std_logic;
	\stateBC.S1\ : OUT std_logic;
	\stateBC.S2\ : OUT std_logic;
	\stateBC.S3\ : OUT std_logic;
	\stateBC.E\ : OUT std_logic
	);
END somadorMulticilo4T;

-- Design Ports Information
-- erro	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pronto	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- soma[0]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- soma[1]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- soma[2]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- soma[3]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- soma[4]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- soma[5]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- soma[6]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- soma[7]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stateBC.S0	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stateBC.S1	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stateBC.S2	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stateBC.S3	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stateBC.E	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ck	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iniciar	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ent[0]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ent[1]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ent[2]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ent[3]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ent[4]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ent[5]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ent[6]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ent[7]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- n[3]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- n[2]	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- n[1]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- n[0]	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF somadorMulticilo4T IS
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
SIGNAL ww_erro : std_logic;
SIGNAL ww_pronto : std_logic;
SIGNAL ww_ent : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_n : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_soma : std_logic_vector(7 DOWNTO 0);
SIGNAL \ww_stateBC.S0\ : std_logic;
SIGNAL \ww_stateBC.S1\ : std_logic;
SIGNAL \ww_stateBC.S2\ : std_logic;
SIGNAL \ww_stateBC.S3\ : std_logic;
SIGNAL \ww_stateBC.E\ : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ck~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \erro~output_o\ : std_logic;
SIGNAL \pronto~output_o\ : std_logic;
SIGNAL \soma[0]~output_o\ : std_logic;
SIGNAL \soma[1]~output_o\ : std_logic;
SIGNAL \soma[2]~output_o\ : std_logic;
SIGNAL \soma[3]~output_o\ : std_logic;
SIGNAL \soma[4]~output_o\ : std_logic;
SIGNAL \soma[5]~output_o\ : std_logic;
SIGNAL \soma[6]~output_o\ : std_logic;
SIGNAL \soma[7]~output_o\ : std_logic;
SIGNAL \stateBC.S0~output_o\ : std_logic;
SIGNAL \stateBC.S1~output_o\ : std_logic;
SIGNAL \stateBC.S2~output_o\ : std_logic;
SIGNAL \stateBC.S3~output_o\ : std_logic;
SIGNAL \stateBC.E~output_o\ : std_logic;
SIGNAL \ck~input_o\ : std_logic;
SIGNAL \ck~inputclkctrl_outclk\ : std_logic;
SIGNAL \ent[5]~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \n[0]~input_o\ : std_logic;
SIGNAL \BO|mux0|output[0]~4_combout\ : std_logic;
SIGNAL \n[1]~input_o\ : std_logic;
SIGNAL \BO|mux0|output[1]~3_combout\ : std_logic;
SIGNAL \BO|mux0|output[2]~1_combout\ : std_logic;
SIGNAL \n[2]~input_o\ : std_logic;
SIGNAL \BO|mux0|output[2]~2_combout\ : std_logic;
SIGNAL \BC|nextState~8_combout\ : std_logic;
SIGNAL \n[3]~input_o\ : std_logic;
SIGNAL \BO|mux0|output[3]~0_combout\ : std_logic;
SIGNAL \BC|nextState~4_combout\ : std_logic;
SIGNAL \iniciar~input_o\ : std_logic;
SIGNAL \BC|nextState~5_combout\ : std_logic;
SIGNAL \BC|comb~2_combout\ : std_logic;
SIGNAL \BC|nextState.S0_194~combout\ : std_logic;
SIGNAL \BC|currentState.S0~0_combout\ : std_logic;
SIGNAL \BC|currentState.S0~q\ : std_logic;
SIGNAL \BC|nextState~6_combout\ : std_logic;
SIGNAL \BC|nextState.E~0_combout\ : std_logic;
SIGNAL \BC|comb~6_combout\ : std_logic;
SIGNAL \BC|nextState.S3_161~combout\ : std_logic;
SIGNAL \BC|currentState.S3~q\ : std_logic;
SIGNAL \BC|nextState.S2~0_combout\ : std_logic;
SIGNAL \BC|nextState.S2~1_combout\ : std_logic;
SIGNAL \BC|comb~5_combout\ : std_logic;
SIGNAL \BC|comb~4_combout\ : std_logic;
SIGNAL \BC|nextState.S2_172~combout\ : std_logic;
SIGNAL \BC|currentState.S2~q\ : std_logic;
SIGNAL \BC|nextState~7_combout\ : std_logic;
SIGNAL \BC|comb~3_combout\ : std_logic;
SIGNAL \BC|nextState.S1_183~combout\ : std_logic;
SIGNAL \BC|currentState.S1~q\ : std_logic;
SIGNAL \BC|cAC~combout\ : std_logic;
SIGNAL \ent[4]~input_o\ : std_logic;
SIGNAL \ent[3]~input_o\ : std_logic;
SIGNAL \ent[2]~input_o\ : std_logic;
SIGNAL \ent[1]~input_o\ : std_logic;
SIGNAL \ent[0]~input_o\ : std_logic;
SIGNAL \BO|mux1|output[0]~0_combout\ : std_logic;
SIGNAL \BO|adder0|gera:1:fa|sum~0_combout\ : std_logic;
SIGNAL \BO|mux1|output[1]~1_combout\ : std_logic;
SIGNAL \BO|adder0|gera:1:fa|cout~0_combout\ : std_logic;
SIGNAL \BO|mux1|output[2]~2_combout\ : std_logic;
SIGNAL \BO|adder0|gera:2:fa|cout~1_combout\ : std_logic;
SIGNAL \BO|adder0|gera:2:fa|cout~0_combout\ : std_logic;
SIGNAL \BO|adder0|gera:3:fa|sum~combout\ : std_logic;
SIGNAL \BO|mux1|output[3]~3_combout\ : std_logic;
SIGNAL \BO|adder0|gera:3:fa|cout~0_combout\ : std_logic;
SIGNAL \BO|mux1|output[4]~4_combout\ : std_logic;
SIGNAL \BO|adder0|gera:5:fa|sum~0_combout\ : std_logic;
SIGNAL \BO|mux1|output[5]~5_combout\ : std_logic;
SIGNAL \BO|adder0|gera:5:fa|cout~0_combout\ : std_logic;
SIGNAL \BO|adder0|gera:5:fa|cout~1_combout\ : std_logic;
SIGNAL \BO|adder0|gera:5:fa|cout~2_combout\ : std_logic;
SIGNAL \ent[6]~input_o\ : std_logic;
SIGNAL \BO|mux1|output[6]~6_combout\ : std_logic;
SIGNAL \BO|adder0|gera:7:fa|cout~0_combout\ : std_logic;
SIGNAL \ent[7]~input_o\ : std_logic;
SIGNAL \BO|adder0|gera:7:fa|sum~0_combout\ : std_logic;
SIGNAL \BO|mux1|output[7]~7_combout\ : std_logic;
SIGNAL \BO|adder0|gera:7:fa|cout~1_combout\ : std_logic;
SIGNAL \BC|nextState.E~1_combout\ : std_logic;
SIGNAL \BC|nextState.E~2_combout\ : std_logic;
SIGNAL \BC|comb~1_combout\ : std_logic;
SIGNAL \BC|comb~0_combout\ : std_logic;
SIGNAL \BC|nextState.E_150~combout\ : std_logic;
SIGNAL \BC|currentState.E~q\ : std_logic;
SIGNAL \BC|pronto~combout\ : std_logic;
SIGNAL \BO|cont|currentState\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \BO|T|currentState\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \BO|AC|currentState\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \BC|ALT_INV_currentState.S0~q\ : std_logic;

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
erro <= ww_erro;
pronto <= ww_pronto;
ww_ent <= ent;
ww_n <= n;
soma <= ww_soma;
\stateBC.S0\ <= \ww_stateBC.S0\;
\stateBC.S1\ <= \ww_stateBC.S1\;
\stateBC.S2\ <= \ww_stateBC.S2\;
\stateBC.S3\ <= \ww_stateBC.S3\;
\stateBC.E\ <= \ww_stateBC.E\;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\ck~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ck~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\BC|ALT_INV_currentState.S0~q\ <= NOT \BC|currentState.S0~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X16_Y24_N2
\erro~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BC|currentState.E~q\,
	devoe => ww_devoe,
	o => \erro~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\pronto~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BC|pronto~combout\,
	devoe => ww_devoe,
	o => \pronto~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\soma[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BO|AC|currentState\(0),
	devoe => ww_devoe,
	o => \soma[0]~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\soma[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BO|AC|currentState\(1),
	devoe => ww_devoe,
	o => \soma[1]~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\soma[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BO|AC|currentState\(2),
	devoe => ww_devoe,
	o => \soma[2]~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\soma[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BO|AC|currentState\(3),
	devoe => ww_devoe,
	o => \soma[3]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\soma[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BO|AC|currentState\(4),
	devoe => ww_devoe,
	o => \soma[4]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\soma[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BO|AC|currentState\(5),
	devoe => ww_devoe,
	o => \soma[5]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\soma[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BO|AC|currentState\(6),
	devoe => ww_devoe,
	o => \soma[6]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\soma[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BO|AC|currentState\(7),
	devoe => ww_devoe,
	o => \soma[7]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\stateBC.S0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BC|ALT_INV_currentState.S0~q\,
	devoe => ww_devoe,
	o => \stateBC.S0~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\stateBC.S1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BC|currentState.S1~q\,
	devoe => ww_devoe,
	o => \stateBC.S1~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\stateBC.S2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BC|currentState.S2~q\,
	devoe => ww_devoe,
	o => \stateBC.S2~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\stateBC.S3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BC|currentState.S3~q\,
	devoe => ww_devoe,
	o => \stateBC.S3~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\stateBC.E~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BC|currentState.E~q\,
	devoe => ww_devoe,
	o => \stateBC.E~output_o\);

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

-- Location: IOIBUF_X16_Y24_N15
\ent[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ent(5),
	o => \ent[5]~input_o\);

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

-- Location: IOIBUF_X34_Y17_N15
\n[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_n(0),
	o => \n[0]~input_o\);

-- Location: LCCOMB_X33_Y19_N4
\BO|mux0|output[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux0|output[0]~4_combout\ = (\BC|currentState.S1~q\ & ((\n[0]~input_o\))) # (!\BC|currentState.S1~q\ & (!\BO|cont|currentState\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|currentState.S1~q\,
	datac => \BO|cont|currentState\(0),
	datad => \n[0]~input_o\,
	combout => \BO|mux0|output[0]~4_combout\);

-- Location: FF_X33_Y19_N5
\BO|cont|currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux0|output[0]~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|cont|currentState\(0));

-- Location: IOIBUF_X34_Y17_N1
\n[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_n(1),
	o => \n[1]~input_o\);

-- Location: LCCOMB_X33_Y19_N26
\BO|mux0|output[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux0|output[1]~3_combout\ = (\BC|currentState.S1~q\ & (\n[1]~input_o\)) # (!\BC|currentState.S1~q\ & ((\BO|cont|currentState\(0) $ (!\BO|cont|currentState\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \n[1]~input_o\,
	datab => \BO|cont|currentState\(0),
	datac => \BO|cont|currentState\(1),
	datad => \BC|currentState.S1~q\,
	combout => \BO|mux0|output[1]~3_combout\);

-- Location: FF_X33_Y19_N27
\BO|cont|currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux0|output[1]~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|cont|currentState\(1));

-- Location: LCCOMB_X32_Y19_N24
\BO|mux0|output[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux0|output[2]~1_combout\ = (!\BC|currentState.S1~q\ & (\BO|cont|currentState\(2) $ (((!\BO|cont|currentState\(1) & !\BO|cont|currentState\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|cont|currentState\(2),
	datab => \BO|cont|currentState\(1),
	datac => \BC|currentState.S1~q\,
	datad => \BO|cont|currentState\(0),
	combout => \BO|mux0|output[2]~1_combout\);

-- Location: IOIBUF_X34_Y20_N8
\n[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_n(2),
	o => \n[2]~input_o\);

-- Location: LCCOMB_X32_Y19_N26
\BO|mux0|output[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux0|output[2]~2_combout\ = (\BO|mux0|output[2]~1_combout\) # ((\n[2]~input_o\ & \BC|currentState.S1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BO|mux0|output[2]~1_combout\,
	datac => \n[2]~input_o\,
	datad => \BC|currentState.S1~q\,
	combout => \BO|mux0|output[2]~2_combout\);

-- Location: FF_X32_Y19_N27
\BO|cont|currentState[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux0|output[2]~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|cont|currentState\(2));

-- Location: LCCOMB_X32_Y19_N22
\BC|nextState~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState~8_combout\ = (!\BO|cont|currentState\(0) & (!\BO|cont|currentState\(2) & !\BO|cont|currentState\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|cont|currentState\(0),
	datac => \BO|cont|currentState\(2),
	datad => \BO|cont|currentState\(1),
	combout => \BC|nextState~8_combout\);

-- Location: IOIBUF_X34_Y9_N22
\n[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_n(3),
	o => \n[3]~input_o\);

-- Location: LCCOMB_X32_Y19_N12
\BO|mux0|output[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux0|output[3]~0_combout\ = (\BC|currentState.S1~q\ & (((\n[3]~input_o\)))) # (!\BC|currentState.S1~q\ & (\BC|nextState~8_combout\ $ ((\BO|cont|currentState\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|nextState~8_combout\,
	datab => \BC|currentState.S1~q\,
	datac => \BO|cont|currentState\(3),
	datad => \n[3]~input_o\,
	combout => \BO|mux0|output[3]~0_combout\);

-- Location: FF_X32_Y19_N13
\BO|cont|currentState[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux0|output[3]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|cont|currentState\(3));

-- Location: LCCOMB_X32_Y19_N16
\BC|nextState~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState~4_combout\ = (!\BO|cont|currentState\(3) & (!\BO|cont|currentState\(1) & (!\BO|cont|currentState\(2) & !\BO|cont|currentState\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|cont|currentState\(3),
	datab => \BO|cont|currentState\(1),
	datac => \BO|cont|currentState\(2),
	datad => \BO|cont|currentState\(0),
	combout => \BC|nextState~4_combout\);

-- Location: IOIBUF_X34_Y17_N22
\iniciar~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iniciar,
	o => \iniciar~input_o\);

-- Location: LCCOMB_X33_Y19_N22
\BC|nextState~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState~5_combout\ = (\iniciar~input_o\ & (\BC|currentState.S2~q\ & (\BC|nextState~4_combout\))) # (!\iniciar~input_o\ & (((\BC|currentState.S2~q\ & \BC|nextState~4_combout\)) # (!\BC|currentState.S0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iniciar~input_o\,
	datab => \BC|currentState.S2~q\,
	datac => \BC|nextState~4_combout\,
	datad => \BC|currentState.S0~q\,
	combout => \BC|nextState~5_combout\);

-- Location: LCCOMB_X32_Y19_N8
\BC|comb~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|comb~2_combout\ = (!\BC|nextState~5_combout\ & ((\BC|cAC~combout\) # ((\BC|nextState~6_combout\) # (!\BC|nextState~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|cAC~combout\,
	datab => \BC|nextState~7_combout\,
	datac => \BC|nextState~6_combout\,
	datad => \BC|nextState~5_combout\,
	combout => \BC|comb~2_combout\);

-- Location: LCCOMB_X32_Y19_N2
\BC|nextState.S0_194\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.S0_194~combout\ = (!\BC|comb~2_combout\ & ((\BC|nextState~5_combout\) # (\BC|nextState.S0_194~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BC|nextState~5_combout\,
	datac => \BC|comb~2_combout\,
	datad => \BC|nextState.S0_194~combout\,
	combout => \BC|nextState.S0_194~combout\);

-- Location: LCCOMB_X33_Y19_N18
\BC|currentState.S0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|currentState.S0~0_combout\ = !\BC|nextState.S0_194~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \BC|nextState.S0_194~combout\,
	combout => \BC|currentState.S0~0_combout\);

-- Location: FF_X33_Y19_N19
\BC|currentState.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BC|currentState.S0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BC|currentState.S0~q\);

-- Location: LCCOMB_X33_Y19_N0
\BC|nextState~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState~6_combout\ = (\iniciar~input_o\ & ((\BC|currentState.E~q\) # (!\BC|currentState.S0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BC|currentState.S0~q\,
	datac => \BC|currentState.E~q\,
	datad => \iniciar~input_o\,
	combout => \BC|nextState~6_combout\);

-- Location: LCCOMB_X32_Y19_N30
\BC|nextState.E~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.E~0_combout\ = (\BC|cAC~combout\) # (((\BC|nextState~6_combout\) # (\BC|nextState~5_combout\)) # (!\BC|nextState~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|cAC~combout\,
	datab => \BC|nextState~7_combout\,
	datac => \BC|nextState~6_combout\,
	datad => \BC|nextState~5_combout\,
	combout => \BC|nextState.E~0_combout\);

-- Location: LCCOMB_X32_Y19_N20
\BC|comb~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|comb~6_combout\ = (\BC|nextState~7_combout\ & ((\BC|cAC~combout\) # ((\BC|nextState~6_combout\) # (\BC|nextState~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|cAC~combout\,
	datab => \BC|nextState~7_combout\,
	datac => \BC|nextState~6_combout\,
	datad => \BC|nextState~5_combout\,
	combout => \BC|comb~6_combout\);

-- Location: LCCOMB_X32_Y19_N0
\BC|nextState.S3_161\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.S3_161~combout\ = (!\BC|comb~6_combout\ & ((\BC|nextState.S3_161~combout\) # (!\BC|nextState~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BC|comb~6_combout\,
	datac => \BC|nextState~7_combout\,
	datad => \BC|nextState.S3_161~combout\,
	combout => \BC|nextState.S3_161~combout\);

-- Location: FF_X32_Y19_N1
\BC|currentState.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BC|nextState.S3_161~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BC|currentState.S3~q\);

-- Location: LCCOMB_X33_Y19_N20
\BC|nextState.S2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.S2~0_combout\ = (!\BC|nextState~5_combout\ & (((!\BC|currentState.E~q\ & \BC|currentState.S0~q\)) # (!\iniciar~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|currentState.E~q\,
	datab => \BC|currentState.S0~q\,
	datac => \BC|nextState~5_combout\,
	datad => \iniciar~input_o\,
	combout => \BC|nextState.S2~0_combout\);

-- Location: LCCOMB_X33_Y19_N2
\BC|nextState.S2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.S2~1_combout\ = (\BC|nextState.S2~0_combout\ & ((\BC|currentState.S1~q\) # ((!\BO|adder0|gera:7:fa|cout~1_combout\ & \BC|currentState.S3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|adder0|gera:7:fa|cout~1_combout\,
	datab => \BC|currentState.S1~q\,
	datac => \BC|currentState.S3~q\,
	datad => \BC|nextState.S2~0_combout\,
	combout => \BC|nextState.S2~1_combout\);

-- Location: LCCOMB_X33_Y19_N10
\BC|comb~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|comb~5_combout\ = (\BC|nextState.E~0_combout\ & \BC|nextState.S2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BC|nextState.E~0_combout\,
	datad => \BC|nextState.S2~1_combout\,
	combout => \BC|comb~5_combout\);

-- Location: LCCOMB_X33_Y19_N28
\BC|comb~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|comb~4_combout\ = (\BC|nextState.E~0_combout\ & !\BC|nextState.S2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BC|nextState.E~0_combout\,
	datad => \BC|nextState.S2~1_combout\,
	combout => \BC|comb~4_combout\);

-- Location: LCCOMB_X33_Y19_N16
\BC|nextState.S2_172\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.S2_172~combout\ = (!\BC|comb~4_combout\ & ((\BC|comb~5_combout\) # (\BC|nextState.S2_172~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|comb~5_combout\,
	datac => \BC|comb~4_combout\,
	datad => \BC|nextState.S2_172~combout\,
	combout => \BC|nextState.S2_172~combout\);

-- Location: FF_X33_Y19_N17
\BC|currentState.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BC|nextState.S2_172~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BC|currentState.S2~q\);

-- Location: LCCOMB_X33_Y19_N14
\BC|nextState~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState~7_combout\ = (\BC|nextState~4_combout\) # (!\BC|currentState.S2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \BC|nextState~4_combout\,
	datad => \BC|currentState.S2~q\,
	combout => \BC|nextState~7_combout\);

-- Location: LCCOMB_X32_Y19_N10
\BC|comb~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|comb~3_combout\ = (\BC|nextState~5_combout\) # ((!\BC|nextState~6_combout\ & ((\BC|cAC~combout\) # (!\BC|nextState~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|cAC~combout\,
	datab => \BC|nextState~7_combout\,
	datac => \BC|nextState~6_combout\,
	datad => \BC|nextState~5_combout\,
	combout => \BC|comb~3_combout\);

-- Location: LCCOMB_X32_Y19_N6
\BC|nextState.S1_183\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.S1_183~combout\ = (!\BC|comb~3_combout\ & ((\BC|nextState~6_combout\) # (\BC|nextState.S1_183~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|comb~3_combout\,
	datac => \BC|nextState~6_combout\,
	datad => \BC|nextState.S1_183~combout\,
	combout => \BC|nextState.S1_183~combout\);

-- Location: FF_X32_Y19_N7
\BC|currentState.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BC|nextState.S1_183~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BC|currentState.S1~q\);

-- Location: LCCOMB_X32_Y19_N18
\BC|cAC\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|cAC~combout\ = (\BC|currentState.S1~q\) # (\BC|currentState.S3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BC|currentState.S1~q\,
	datac => \BC|currentState.S3~q\,
	combout => \BC|cAC~combout\);

-- Location: FF_X31_Y19_N7
\BO|T|currentState[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \ent[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|T|currentState\(5));

-- Location: IOIBUF_X30_Y24_N22
\ent[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ent(4),
	o => \ent[4]~input_o\);

-- Location: FF_X31_Y19_N3
\BO|T|currentState[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \ent[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|T|currentState\(4));

-- Location: IOIBUF_X28_Y24_N15
\ent[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ent(3),
	o => \ent[3]~input_o\);

-- Location: FF_X31_Y19_N23
\BO|T|currentState[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \ent[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|T|currentState\(3));

-- Location: IOIBUF_X30_Y0_N22
\ent[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ent(2),
	o => \ent[2]~input_o\);

-- Location: FF_X31_Y19_N5
\BO|T|currentState[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \ent[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|T|currentState\(2));

-- Location: IOIBUF_X23_Y24_N15
\ent[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ent(1),
	o => \ent[1]~input_o\);

-- Location: FF_X31_Y19_N27
\BO|T|currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \ent[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|T|currentState\(1));

-- Location: IOIBUF_X28_Y24_N22
\ent[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ent(0),
	o => \ent[0]~input_o\);

-- Location: FF_X31_Y19_N21
\BO|T|currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \ent[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|T|currentState\(0));

-- Location: LCCOMB_X31_Y19_N16
\BO|mux1|output[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux1|output[0]~0_combout\ = (!\BC|currentState.S1~q\ & (\BO|AC|currentState\(0) $ (\BO|T|currentState\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|currentState.S1~q\,
	datac => \BO|AC|currentState\(0),
	datad => \BO|T|currentState\(0),
	combout => \BO|mux1|output[0]~0_combout\);

-- Location: FF_X31_Y19_N17
\BO|AC|currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux1|output[0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|AC|currentState\(0));

-- Location: LCCOMB_X31_Y19_N26
\BO|adder0|gera:1:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:1:fa|sum~0_combout\ = \BO|AC|currentState\(1) $ (\BO|T|currentState\(1) $ (((\BO|AC|currentState\(0) & \BO|T|currentState\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|AC|currentState\(1),
	datab => \BO|AC|currentState\(0),
	datac => \BO|T|currentState\(1),
	datad => \BO|T|currentState\(0),
	combout => \BO|adder0|gera:1:fa|sum~0_combout\);

-- Location: LCCOMB_X31_Y19_N10
\BO|mux1|output[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux1|output[1]~1_combout\ = (!\BC|currentState.S1~q\ & \BO|adder0|gera:1:fa|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|currentState.S1~q\,
	datad => \BO|adder0|gera:1:fa|sum~0_combout\,
	combout => \BO|mux1|output[1]~1_combout\);

-- Location: FF_X31_Y19_N11
\BO|AC|currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux1|output[1]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|AC|currentState\(1));

-- Location: LCCOMB_X31_Y19_N20
\BO|adder0|gera:1:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:1:fa|cout~0_combout\ = (\BO|T|currentState\(1) & ((\BO|AC|currentState\(1)) # ((\BO|AC|currentState\(0) & \BO|T|currentState\(0))))) # (!\BO|T|currentState\(1) & (\BO|AC|currentState\(0) & (\BO|T|currentState\(0) & 
-- \BO|AC|currentState\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|T|currentState\(1),
	datab => \BO|AC|currentState\(0),
	datac => \BO|T|currentState\(0),
	datad => \BO|AC|currentState\(1),
	combout => \BO|adder0|gera:1:fa|cout~0_combout\);

-- Location: LCCOMB_X31_Y19_N12
\BO|mux1|output[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux1|output[2]~2_combout\ = (!\BC|currentState.S1~q\ & (\BO|T|currentState\(2) $ (\BO|AC|currentState\(2) $ (\BO|adder0|gera:1:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|currentState.S1~q\,
	datab => \BO|T|currentState\(2),
	datac => \BO|AC|currentState\(2),
	datad => \BO|adder0|gera:1:fa|cout~0_combout\,
	combout => \BO|mux1|output[2]~2_combout\);

-- Location: FF_X31_Y19_N13
\BO|AC|currentState[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux1|output[2]~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|AC|currentState\(2));

-- Location: LCCOMB_X31_Y19_N24
\BO|adder0|gera:2:fa|cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:2:fa|cout~1_combout\ = (\BO|adder0|gera:1:fa|cout~0_combout\ & ((\BO|AC|currentState\(2)) # (\BO|T|currentState\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|AC|currentState\(2),
	datac => \BO|T|currentState\(2),
	datad => \BO|adder0|gera:1:fa|cout~0_combout\,
	combout => \BO|adder0|gera:2:fa|cout~1_combout\);

-- Location: LCCOMB_X31_Y19_N22
\BO|adder0|gera:2:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:2:fa|cout~0_combout\ = (\BO|T|currentState\(2) & \BO|AC|currentState\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BO|T|currentState\(2),
	datad => \BO|AC|currentState\(2),
	combout => \BO|adder0|gera:2:fa|cout~0_combout\);

-- Location: LCCOMB_X32_Y19_N28
\BO|adder0|gera:3:fa|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:3:fa|sum~combout\ = \BO|T|currentState\(3) $ (\BO|AC|currentState\(3) $ (((\BO|adder0|gera:2:fa|cout~1_combout\) # (\BO|adder0|gera:2:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|T|currentState\(3),
	datab => \BO|adder0|gera:2:fa|cout~1_combout\,
	datac => \BO|AC|currentState\(3),
	datad => \BO|adder0|gera:2:fa|cout~0_combout\,
	combout => \BO|adder0|gera:3:fa|sum~combout\);

-- Location: LCCOMB_X32_Y19_N4
\BO|mux1|output[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux1|output[3]~3_combout\ = (!\BC|currentState.S1~q\ & \BO|adder0|gera:3:fa|sum~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \BC|currentState.S1~q\,
	datad => \BO|adder0|gera:3:fa|sum~combout\,
	combout => \BO|mux1|output[3]~3_combout\);

-- Location: FF_X32_Y19_N5
\BO|AC|currentState[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux1|output[3]~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|AC|currentState\(3));

-- Location: LCCOMB_X31_Y19_N0
\BO|adder0|gera:3:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:3:fa|cout~0_combout\ = (\BO|AC|currentState\(3) & ((\BO|T|currentState\(3)) # ((\BO|adder0|gera:2:fa|cout~0_combout\) # (\BO|adder0|gera:2:fa|cout~1_combout\)))) # (!\BO|AC|currentState\(3) & (\BO|T|currentState\(3) & 
-- ((\BO|adder0|gera:2:fa|cout~0_combout\) # (\BO|adder0|gera:2:fa|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|AC|currentState\(3),
	datab => \BO|T|currentState\(3),
	datac => \BO|adder0|gera:2:fa|cout~0_combout\,
	datad => \BO|adder0|gera:2:fa|cout~1_combout\,
	combout => \BO|adder0|gera:3:fa|cout~0_combout\);

-- Location: LCCOMB_X31_Y19_N14
\BO|mux1|output[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux1|output[4]~4_combout\ = (!\BC|currentState.S1~q\ & (\BO|T|currentState\(4) $ (\BO|AC|currentState\(4) $ (\BO|adder0|gera:3:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|currentState.S1~q\,
	datab => \BO|T|currentState\(4),
	datac => \BO|AC|currentState\(4),
	datad => \BO|adder0|gera:3:fa|cout~0_combout\,
	combout => \BO|mux1|output[4]~4_combout\);

-- Location: FF_X31_Y19_N15
\BO|AC|currentState[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux1|output[4]~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|AC|currentState\(4));

-- Location: LCCOMB_X30_Y19_N18
\BO|adder0|gera:5:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:5:fa|sum~0_combout\ = \BO|AC|currentState\(5) $ (((\BO|AC|currentState\(4) & ((\BO|T|currentState\(4)) # (\BO|adder0|gera:3:fa|cout~0_combout\))) # (!\BO|AC|currentState\(4) & (\BO|T|currentState\(4) & 
-- \BO|adder0|gera:3:fa|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|AC|currentState\(4),
	datab => \BO|T|currentState\(4),
	datac => \BO|adder0|gera:3:fa|cout~0_combout\,
	datad => \BO|AC|currentState\(5),
	combout => \BO|adder0|gera:5:fa|sum~0_combout\);

-- Location: LCCOMB_X30_Y19_N12
\BO|mux1|output[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux1|output[5]~5_combout\ = (!\BC|currentState.S1~q\ & (\BO|T|currentState\(5) $ (\BO|adder0|gera:5:fa|sum~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|T|currentState\(5),
	datac => \BC|currentState.S1~q\,
	datad => \BO|adder0|gera:5:fa|sum~0_combout\,
	combout => \BO|mux1|output[5]~5_combout\);

-- Location: FF_X30_Y19_N13
\BO|AC|currentState[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux1|output[5]~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|AC|currentState\(5));

-- Location: LCCOMB_X31_Y19_N18
\BO|adder0|gera:5:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:5:fa|cout~0_combout\ = (\BO|AC|currentState\(3) & ((\BO|T|currentState\(3)) # ((\BO|adder0|gera:2:fa|cout~0_combout\) # (\BO|adder0|gera:2:fa|cout~1_combout\)))) # (!\BO|AC|currentState\(3) & (\BO|T|currentState\(3) & 
-- ((\BO|adder0|gera:2:fa|cout~0_combout\) # (\BO|adder0|gera:2:fa|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|AC|currentState\(3),
	datab => \BO|T|currentState\(3),
	datac => \BO|adder0|gera:2:fa|cout~0_combout\,
	datad => \BO|adder0|gera:2:fa|cout~1_combout\,
	combout => \BO|adder0|gera:5:fa|cout~0_combout\);

-- Location: LCCOMB_X31_Y19_N2
\BO|adder0|gera:5:fa|cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:5:fa|cout~1_combout\ = (\BO|AC|currentState\(4) & ((\BO|T|currentState\(4)) # (\BO|adder0|gera:5:fa|cout~0_combout\))) # (!\BO|AC|currentState\(4) & (\BO|T|currentState\(4) & \BO|adder0|gera:5:fa|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BO|AC|currentState\(4),
	datac => \BO|T|currentState\(4),
	datad => \BO|adder0|gera:5:fa|cout~0_combout\,
	combout => \BO|adder0|gera:5:fa|cout~1_combout\);

-- Location: LCCOMB_X31_Y19_N6
\BO|adder0|gera:5:fa|cout~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:5:fa|cout~2_combout\ = (\BO|AC|currentState\(5) & ((\BO|T|currentState\(5)) # (\BO|adder0|gera:5:fa|cout~1_combout\))) # (!\BO|AC|currentState\(5) & (\BO|T|currentState\(5) & \BO|adder0|gera:5:fa|cout~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|AC|currentState\(5),
	datac => \BO|T|currentState\(5),
	datad => \BO|adder0|gera:5:fa|cout~1_combout\,
	combout => \BO|adder0|gera:5:fa|cout~2_combout\);

-- Location: IOIBUF_X34_Y10_N8
\ent[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ent(6),
	o => \ent[6]~input_o\);

-- Location: FF_X31_Y19_N29
\BO|T|currentState[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \ent[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|T|currentState\(6));

-- Location: LCCOMB_X31_Y19_N8
\BO|mux1|output[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux1|output[6]~6_combout\ = (!\BC|currentState.S1~q\ & (\BO|T|currentState\(6) $ (\BO|AC|currentState\(6) $ (\BO|adder0|gera:5:fa|cout~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|currentState.S1~q\,
	datab => \BO|T|currentState\(6),
	datac => \BO|AC|currentState\(6),
	datad => \BO|adder0|gera:5:fa|cout~2_combout\,
	combout => \BO|mux1|output[6]~6_combout\);

-- Location: FF_X31_Y19_N9
\BO|AC|currentState[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux1|output[6]~6_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|AC|currentState\(6));

-- Location: LCCOMB_X31_Y19_N4
\BO|adder0|gera:7:fa|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:7:fa|cout~0_combout\ = (\BO|adder0|gera:5:fa|cout~2_combout\ & ((\BO|AC|currentState\(6)) # (\BO|T|currentState\(6)))) # (!\BO|adder0|gera:5:fa|cout~2_combout\ & (\BO|AC|currentState\(6) & \BO|T|currentState\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|adder0|gera:5:fa|cout~2_combout\,
	datab => \BO|AC|currentState\(6),
	datad => \BO|T|currentState\(6),
	combout => \BO|adder0|gera:7:fa|cout~0_combout\);

-- Location: IOIBUF_X34_Y9_N15
\ent[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ent(7),
	o => \ent[7]~input_o\);

-- Location: FF_X32_Y19_N15
\BO|T|currentState[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	asdata => \ent[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|T|currentState\(7));

-- Location: LCCOMB_X31_Y19_N28
\BO|adder0|gera:7:fa|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:7:fa|sum~0_combout\ = \BO|AC|currentState\(7) $ (((\BO|AC|currentState\(6) & ((\BO|T|currentState\(6)) # (\BO|adder0|gera:5:fa|cout~2_combout\))) # (!\BO|AC|currentState\(6) & (\BO|T|currentState\(6) & 
-- \BO|adder0|gera:5:fa|cout~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|AC|currentState\(7),
	datab => \BO|AC|currentState\(6),
	datac => \BO|T|currentState\(6),
	datad => \BO|adder0|gera:5:fa|cout~2_combout\,
	combout => \BO|adder0|gera:7:fa|sum~0_combout\);

-- Location: LCCOMB_X31_Y19_N30
\BO|mux1|output[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|mux1|output[7]~7_combout\ = (!\BC|currentState.S1~q\ & (\BO|T|currentState\(7) $ (\BO|adder0|gera:7:fa|sum~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|currentState.S1~q\,
	datac => \BO|T|currentState\(7),
	datad => \BO|adder0|gera:7:fa|sum~0_combout\,
	combout => \BO|mux1|output[7]~7_combout\);

-- Location: FF_X31_Y19_N31
\BO|AC|currentState[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BO|mux1|output[7]~7_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \BC|cAC~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BO|AC|currentState\(7));

-- Location: LCCOMB_X32_Y19_N14
\BO|adder0|gera:7:fa|cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BO|adder0|gera:7:fa|cout~1_combout\ = (\BO|adder0|gera:7:fa|cout~0_combout\ & ((\BO|T|currentState\(7)) # (\BO|AC|currentState\(7)))) # (!\BO|adder0|gera:7:fa|cout~0_combout\ & (\BO|T|currentState\(7) & \BO|AC|currentState\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|adder0|gera:7:fa|cout~0_combout\,
	datac => \BO|T|currentState\(7),
	datad => \BO|AC|currentState\(7),
	combout => \BO|adder0|gera:7:fa|cout~1_combout\);

-- Location: LCCOMB_X33_Y19_N12
\BC|nextState.E~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.E~1_combout\ = (!\BC|nextState~5_combout\ & (!\BC|nextState~6_combout\ & ((\BC|nextState~4_combout\) # (!\BC|currentState.S2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|nextState~5_combout\,
	datab => \BC|currentState.S2~q\,
	datac => \BC|nextState~4_combout\,
	datad => \BC|nextState~6_combout\,
	combout => \BC|nextState.E~1_combout\);

-- Location: LCCOMB_X33_Y19_N30
\BC|nextState.E~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.E~2_combout\ = (\BC|nextState.E~1_combout\ & (!\BC|currentState.S1~q\ & ((\BO|adder0|gera:7:fa|cout~1_combout\) # (!\BC|currentState.S3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BO|adder0|gera:7:fa|cout~1_combout\,
	datab => \BC|nextState.E~1_combout\,
	datac => \BC|currentState.S3~q\,
	datad => \BC|currentState.S1~q\,
	combout => \BC|nextState.E~2_combout\);

-- Location: LCCOMB_X33_Y19_N6
\BC|comb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|comb~1_combout\ = (\BC|nextState.E~2_combout\ & \BC|nextState.E~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|nextState.E~2_combout\,
	datad => \BC|nextState.E~0_combout\,
	combout => \BC|comb~1_combout\);

-- Location: LCCOMB_X33_Y19_N8
\BC|comb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|comb~0_combout\ = (!\BC|nextState.E~2_combout\ & \BC|nextState.E~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|nextState.E~2_combout\,
	datad => \BC|nextState.E~0_combout\,
	combout => \BC|comb~0_combout\);

-- Location: LCCOMB_X33_Y19_N24
\BC|nextState.E_150\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|nextState.E_150~combout\ = (!\BC|comb~0_combout\ & ((\BC|comb~1_combout\) # (\BC|nextState.E_150~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BC|comb~1_combout\,
	datac => \BC|comb~0_combout\,
	datad => \BC|nextState.E_150~combout\,
	combout => \BC|nextState.E_150~combout\);

-- Location: FF_X33_Y19_N25
\BC|currentState.E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ck~inputclkctrl_outclk\,
	d => \BC|nextState.E_150~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BC|currentState.E~q\);

-- Location: LCCOMB_X18_Y23_N0
\BC|pronto\ : cycloneive_lcell_comb
-- Equation(s):
-- \BC|pronto~combout\ = (\BC|currentState.E~q\) # (!\BC|currentState.S0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BC|currentState.S0~q\,
	datad => \BC|currentState.E~q\,
	combout => \BC|pronto~combout\);

ww_erro <= \erro~output_o\;

ww_pronto <= \pronto~output_o\;

ww_soma(0) <= \soma[0]~output_o\;

ww_soma(1) <= \soma[1]~output_o\;

ww_soma(2) <= \soma[2]~output_o\;

ww_soma(3) <= \soma[3]~output_o\;

ww_soma(4) <= \soma[4]~output_o\;

ww_soma(5) <= \soma[5]~output_o\;

ww_soma(6) <= \soma[6]~output_o\;

ww_soma(7) <= \soma[7]~output_o\;

\ww_stateBC.S0\ <= \stateBC.S0~output_o\;

\ww_stateBC.S1\ <= \stateBC.S1~output_o\;

\ww_stateBC.S2\ <= \stateBC.S2~output_o\;

\ww_stateBC.S3\ <= \stateBC.S3~output_o\;

\ww_stateBC.E\ <= \stateBC.E~output_o\;
END structure;


