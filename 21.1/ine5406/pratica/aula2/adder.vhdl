library ieee;
use ieee.std_logic_1164.all;

entity adder is
	generic(N: positive);
	port(a, b: in std_logic_vector(N-1 downto 0);
        result: out std_logic_vector(N-1 downto 0);
        ovf, cout: out std_logic
    );
end entity;


architecture arch1 of adder is
	component fulladder1bit is
		port(cin, a, b: in std_logic;
            sum: out std_logic;
            cout: out std_logic
        );
	end component;
	signal carry: std_logic_vector(N downto 0);
begin
	gera: for i in result'range generate
		fa: fulladder1bit port map (carry(i), a(i), b(i), result(i), carry(i+1));
	end generate;
	carry(0) <= '0';
	cout <= carry(N);
	ovf <= carry(N) xor carry(N-1);
end architecture;