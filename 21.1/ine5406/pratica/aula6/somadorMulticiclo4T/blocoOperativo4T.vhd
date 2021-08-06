library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity blocoOperativo4T is
	generic(width_ent: positive;
			width_n: positive);
	port(
		-- control in
		clock, reset: in std_logic;
		-- control in (command signals from BC)
		scont, ccont, zAC, cAC, cT: in std_logic;		
		-- control out (status signals to BC)
		zero, ov: out std_logic;
		-- data in
		ent: in std_logic_vector(width_ent-1 downto 0);
		n: in std_logic_vector(width_n-1 downto 0);
		-- data out
		soma: out std_logic_vector(width_ent-1 downto 0) 
	);
end entity;

architecture descricaoEstrutural of blocoOperativo4T is
	component multiplexer2x1 is
		generic (	width: positive );
		port(	input0, input1: in std_logic_vector(width-1 downto 0);
				sel: in std_logic;
				output: out std_logic_vector(width-1 downto 0) );
	end component;
	component addersubtractor is
		generic (	N: positive;
					isAdder: boolean;
					isSubtractor: boolean;
					generateOvf: boolean);
		port(	op: in std_logic;
				a, b: in std_logic_vector(N-1 downto 0);
				result: out std_logic_vector(N-1 downto 0);
				ovf, cout: out std_logic );
	end component;
	component registerN is
		generic(	width: natural;
					resetValue: integer := 0 );
		port(	-- control
				clock, reset, load: in std_logic;
				-- data
				input: in std_logic_vector(width-1 downto 0);
				output: out std_logic_vector(width-1 downto 0));
	end component;
	component compare is
		generic(	width: natural;
					isSigned: boolean;
					generateLessThan: boolean;
					generateEqual: boolean );
		port(	input0, input1: in std_logic_vector(width-1 downto 0);
				lessThan, equal: out std_logic );
	end component;
	-- COMPLETE COM EVENTUAIS SINAIS INTERNOS
	signal out_mux0: std_logic_vector(width_n-1 downto 0);
	signal out_cont: std_logic_vector(width_n-1 downto 0);
	signal out_subtractor: std_logic_vector(width_n-1 downto 0);
	signal subtractor_b: std_logic_vector(width_n-1 downto 0);
	signal compare_input1: std_logic_vector(width_n-1 downto 0);

	signal out_mux1: std_logic_vector(width_ent-1 downto 0);
	signal out_t, out_ac: std_logic_vector(width_ent-1 downto 0);
	signal out_adder: std_logic_vector(width_ent-1 downto 0);
	signal multiplexer2x1_input1: std_logic_vector(width_ent-1 downto 0);

begin
   -- COMPLETE COM EVENTUAIS COMANDOS CONCORRENTES
   subtractor_b(0) <= '1';
   subtractor_b(width_n - 1 DOWNTO 1) <= (OTHERS => '0');
	multiplexer2x1_input1 <= (others=>'0');
	compare_input1 <= (others=>'0');

	-- COMPLETE OS COMANDOS DE INSTANCIACAO ABAIXO
	mux0: multiplexer2x1 
			generic map(width=>width_n)
			port map(input0=> out_subtractor, input1=> n, sel=> scont, output=> out_mux0);
	cont: component registerN 
			generic map(width=>width_n)
			port map(clock=> clock, reset=> reset, load=> ccont,
				input=> out_mux0,	output=> out_cont);
	subtractor0: addersubtractor 
			generic map(N=>width_n, isAdder=> false, isSubtractor=> true, generateOvf=> false)
			port map(op=>'1', a=>out_cont, b=> subtractor_b, result=> out_subtractor, ovf=> open, cout=> open);
	compare0: compare
			generic map (width=>width_n, isSigned=> false, generateLessThan=> false, generateEqual=> true	)
			port map (input0=> out_cont, input1=> compare_input1, lessThan=> open, equal=> zero);
			
	mux1: multiplexer2x1 
			generic map(width=>width_ent)
			port map(input0=> out_adder, input1=> multiplexer2x1_input1, sel=>zAC, output=> out_mux1);
	AC: component registerN 
			generic map(width=>width_ent)
			port map(clock=> clock, reset=> reset, load=> cAC,
				input=>out_mux1, output=> out_ac);
	T: component registerN 
			generic map(width=>width_ent)
			port map(clock=> clock, reset=> reset, load=> cT,
				input=> ent, output=>out_t);
	adder0: addersubtractor 
			generic map(N=>width_ent, isAdder=>true, isSubtractor=>false, generateOvf=>true)
			port map(op=>'0', a=>out_ac, b=>out_t, result=>out_adder, ovf=>open, cout=>ov);
	soma <= out_ac;
end architecture;