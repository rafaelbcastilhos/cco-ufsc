-- MAIN_TESTBENCH
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use ieee.math_real.all;
use std.textio.all;
use work.BC_State.all;

entity tsd is
    generic(
        LATENCY: time := 20 ns;
        MAXPULSES: integer := 100;
        WIDTH_ENT: positive := 8;
	WIDTH_N: positive := 4
    );
end entity;

architecture arch_test of tsd is

function to_string (arg : std_logic_vector) return string is
  variable result : string (1 to arg'length);
  variable v : std_logic_vector (result'range) := arg;
begin
  for i in result'range loop
    case v(i) is
      when 'U' => result(i) := 'U';
      when 'X' => result(i) := 'X';
      when '0' => result(i) := '0';
      when '1' => result(i) := '1';
      when 'Z' => result(i) := 'Z';
      when 'W' => result(i) := 'W';
      when 'L' => result(i) := 'L';
      when 'H' => result(i) := 'H';
      when '-' => result(i) := '-';
    end case;
  end loop;
  return result;
end function;

component somadorMulticilo4T is
	generic(width_ent: positive := 8;
			width_n: positive := 4);
	port(
		-- control in
		ck, reset, iniciar: in std_logic;
		-- control out
		erro, pronto: out std_logic;
		-- data in
		ent: in std_logic_vector(width_ent-1 downto 0);
		n: in std_logic_vector(width_n-1 downto 0);
		-- data out
		soma: out std_logic_vector(width_ent-1 downto 0);
		-- Tests
		stateBC: out State
	);
end component;

component somadorMulticilo4T_sol is
	generic(width_ent: positive := 8;
			width_n: positive := 4);
	port(
		-- control in
		ck, reset, iniciar: in std_logic;
		-- control out
		erro, pronto: out std_logic;
		-- data in
		ent: in std_logic_vector(width_ent-1 downto 0);
		n: in std_logic_vector(width_n-1 downto 0);
		-- data out
		soma: out std_logic_vector(width_ent-1 downto 0);
		-- Tests
		stateBC: out State
	);
end component;

signal clock, reset, iniciar: std_logic;
signal erro, pronto, erroSol, prontoSol: std_logic;
signal ent: std_logic_vector(WIDTH_ENT-1 downto 0);
signal n: std_logic_vector(WIDTH_N-1 downto 0);
signal soma, somaSol: std_logic_vector(WIDTH_ENT-1 downto 0);
signal stateBC, stateBCSol: State;
--
signal pulse: integer := 0;
signal step: integer := 0;
begin
	-- instantiate 
	uut: somadorMulticilo4T     generic map (WIDTH_ENT, WIDTH_N) port map(clock, reset, iniciar, erro,    pronto,    ent, n, soma,    stateBC);
	sol: somadorMulticilo4T_sol generic map (WIDTH_ENT, WIDTH_N) port map(clock, reset, iniciar, erroSol, prontoSol, ent, n, somaSol, stateBCSol);

	-- test uut
	setaSentradas: process is
        	variable errors: integer := 0;
		variable seed1: positive := 1;
        	variable seed2: positive := 1;
		variable rand1: integer;
		variable x : real;
	begin
        if step = 0 then
            -- falling edge
          clock <= '0';
          step <= 1;
        elsif step = 1 then
            -- set inputs
            uniform(seed1, seed2, x);
            rand1 := integer(floor(x * real(2**(WIDTH_ENT-2)-1)));
            ent <= std_logic_vector(to_unsigned(rand1,WIDTH_ENT));
		    if pulse = 0 then
			    reset <= '1';
		    else
			    reset <= '0';
		    end if;
            if pronto='1' and reset='0' then
                iniciar <= '1';
                uniform(seed1, seed2, x);
                rand1 := integer(floor(x * real(2**(WIDTH_N)-1)));
                n <= std_logic_vector(to_unsigned(rand1,WIDTH_N));
            else
                iniciar <= '0';
            end if;
            step <= 2;
        elsif step = 2 then
            -- wait before rising edge
            step <= 3;
        elsif step = 3 then
            -- rising edge
		    clock <= '1';
            step <= 4;
        elsif step = 4 then
            -- show inputs and outputs
            if pulse = 0 then
                report  "reset, iniciar, ent, n ==> soma, pronto, erro, (state)";
            end if;
            report  "" & std_logic'image(reset) &
                ", " & std_logic'image(iniciar) &
            	", " & integer'image(to_integer(unsigned(ent))) &
            	", " & integer'image(to_integer(unsigned(n))) &
	            " ==> " &
            	"" & integer'image(to_integer(unsigned(soma))) &
                ", " & std_logic'image(pronto) &
                ", " & std_logic'image(erro) &
                ", (S" & integer'image(State'POS(stateBC)) & ")";
            -- compare outputs
            assert soma=somaSol report "ERROR: soma should be:" &  to_string(somaSol) severity error;
            assert pronto=prontoSol report "ERROR: pronto should be:" &  std_logic'image(prontoSol) severity error;
            assert erro=erroSol report "ERROR: erro should be:" &  std_logic'image(erroSol) severity error;
            -- check end of simulation
            if not (soma=somaSol and pronto=prontoSol and erro=erroSol) then
		       errors := errors + 1;
            end if;
            -- check results
	    if errors > 0 then
		    report "Your code is NOT working properly :-(";
		    report "Simulation ended with errors";
		    wait;
	    end if;
	    if pulse > MAXPULSES then
		    report "Your code is working fine :-)";
		    report "DigitalSystem Simulation successfully completed";
		    wait; -- simulation end with success
	    end if;
	    pulse <= pulse + 1;
            step <= 0;
        end if;
        wait for LATENCY / 5;
    end process;
	
end architecture;