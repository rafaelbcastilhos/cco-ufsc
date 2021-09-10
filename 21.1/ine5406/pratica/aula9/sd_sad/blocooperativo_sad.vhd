library ieee;
use ieee.std_logic_1164.all;

entity blocooperativo_sad is
	generic(
		datawidth: positive;
		addresswidth: positive);
	port(
		-- control in
		ck, reset, zi, ci, cpA, cpB, zsoma, csoma, csad_reg : in std_logic;
		-- data in
		pA, pB: in std_logic_vector(datawidth-1 downto 0);
		-- controll out
		ender: out std_logic_vector(addresswidth-1 downto 0);
		menor: out std_logic;
		sad: out std_logic_vector(datawidth+addresswidth-1 downto 0)
	);
end entity;

architecture archstruct of blocooperativo_sad is
-- COMPLETE
	component multiplexer2x1 is
		generic (width: positive );
		port(input0, input1: in std_logic_vector(width-1 downto 0);
				sel: in std_logic;
				output: out std_logic_vector(width-1 downto 0));
	end component;
	component addersubtractor is
		generic (N: positive;
					isAdder: boolean;
					isSubtractor: boolean);
		port(op: in std_logic;
				a, b: in std_logic_vector(N-1 downto 0);
				result: out std_logic_vector(N-1 downto 0);
				ovf, cout: out std_logic);
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
	component absN is
		generic(width: positive);
		port(input: in std_logic_vector(width-1 downto 0);
				output: out std_logic_vector(width-1 downto 0));
	end component;

	signal out_mux0: std_logic_vector(addresswidth downto 0);
	signal out_i: std_logic_vector(addresswidth downto 0);
	signal cout_adder: std_logic;
	signal out_adder0: std_logic_vector(addresswidth-1 downto 0);
	signal adder0_concat: std_logic_vector(addresswidth downto 0);

	signal out_ender: std_logic_vector(addresswidth-1 downto 0);

	signal out_pA: std_logic_vector(datawidth-1 downto 0);
	signal out_pB: std_logic_vector(datawidth-1 downto 0);
	signal out_subtractor: std_logic_vector(datawidth-1 downto 0);
	signal not_out_subtractor: std_logic_vector(datawidth-1 downto 0);
	signal input_absol: std_logic_vector(datawidth-1 downto 0);
	signal complemento: std_logic_vector(datawidth-1 downto 0);
	signal pos_abs: std_logic_vector(datawidth-1 downto 0);
	signal abs_concat: std_logic_vector(datawidth+addresswidth-1 downto 0);
	signal out_abs: std_logic_vector(datawidth-1 downto 0);
	signal out_adder1: std_logic_vector(datawidth+addresswidth-1 downto 0);
	signal out_mux1: std_logic_vector(datawidth+addresswidth-1 downto 0);
	signal out_soma: std_logic_vector(datawidth+addresswidth-1 downto 0);
	signal out_SAD_reg: std_logic_vector(datawidth+addresswidth-1 downto 0);	

	signal input_mux0: std_logic_vector(addresswidth downto 0);
	signal input_adder0: std_logic_vector(addresswidth-1 downto 0);
	signal input_mux1: std_logic_vector(datawidth+addresswidth-1 downto 0);
begin
    -- COMPLETE
	input_mux0 <= (others=>'0');
	input_mux1 <= (others=>'0');
	input_adder0 <= (0 => '1', others => '0');
	input_absol <= (0 => '1', others => '0');

	menor <= not out_i(addresswidth);
	ender <= out_i(addresswidth-1 downto 0);

	adder0_concat(addresswidth) <= cout_adder;
	adder0_concat(addresswidth-1 downto 0) <= out_adder0;

	abs_concat(datawidth+addresswidth-1 downto datawidth) <= (others=>'0');
	abs_concat(datawidth-1 downto 0) <= out_abs;
	
	sad <= out_SAD_reg;

	mux0: multiplexer2x1 
			generic map(width=>addresswidth+1)
			port map(input0=> adder0_concat, input1=> input_mux0, sel=> zi, output=> out_mux0);
	reg_i: registerN 
			generic map(width=>addresswidth+1, resetValue => 0)
			port map(clock=> ck, reset=> reset, load=> ci,
				input=> out_mux0,	output=> out_i);
	adder0: addersubtractor 
			generic map(N=>addresswidth, isAdder=>true, isSubtractor=>false)
			port map(op=>'0', a=>out_i(addresswidth-1 downto 0), b=>input_adder0, result=>out_adder0, ovf=>open, cout=>cout_adder);

	reg_pA: registerN 
			generic map(width=>datawidth, resetValue => 0)
			port map(clock=> ck, reset=> reset, load=> cpA, input=> pA, output=> out_pA);
	reg_pB: registerN 
			generic map(width=>datawidth, resetValue => 0)
			port map(clock=> ck, reset=> reset, load=> cpB, input=> pB, output=> out_pB);
	subtractor: addersubtractor 
			generic map(N=>datawidth, isAdder=>false, isSubtractor=>true)
			port map(op=>'1', a=>out_pA, b=>out_pB, result=>out_subtractor, ovf=>open, cout=>open);

	absoluto: absN
			generic map(width=>datawidth)
			port map(input=>out_subtractor, output=>out_abs);

	adder1: addersubtractor 
			generic map(N=>abs_concat'length, isAdder=>true, isSubtractor=>false)
			port map(op=>'0', a=>out_soma, b=>abs_concat, result=>out_adder1, ovf=>open, cout=>open);
	mux1: multiplexer2x1 
			generic map(width=>out_adder1'length)
			port map(input0=> out_adder1, input1=> input_mux1, sel=> zsoma, output=> out_mux1);
	soma: registerN 
			generic map(width=>out_mux1'length, resetValue => 0)
			port map(clock=> ck, reset=> reset, load=> csoma, input=> out_mux1, output=> out_soma);
	SAD_reg: registerN 
			generic map(width=>out_soma'length, resetValue => 0)
			port map(clock=> ck, reset=> reset, load=> csad_reg, input=> out_soma, output=> out_SAD_reg);
			
end architecture;