library ieee;
use ieee.std_logic_1164.all;

entity usertest is
end usertest;

architecture tb of usertest is
    signal A1, A2, A3, Soma, FAout : std_logic;

    component fulladder is
        port (A: in std_logic;
            B: in std_logic;
            C: in std_logic;
            S: out std_logic;
            Cout: out std_logic);
    end component;

begin
    DUT: fulladder port map (A1, A2, A3, Soma, FAout);

    process
    constant period: time := 10 ns;
    begin
        A1 <= '0'; A2 <= '0'; A3 <= '0';
        wait for period;
        assert ((Soma = '0') and (FAout = '0'))
        report "Failed for 000." severity error;

        A1 <= '0'; A2 <= '0'; A3 <= '1';
        wait for period;
        assert ((Soma = '1') and (FAout = '0'))
        report "Failed for 001." severity error;

        A1 <= '0'; A2 <= '1'; A3 <= '0';
        wait for period;
        assert ((Soma = '1') and (FAout = '0'))
        report "Failed for 010." severity error;

        A1 <= '0'; A2 <= '1'; A3 <= '1';
        wait for period;
        assert ((Soma = '0') and (FAout = '1'))
        report "Failed for 011." severity error;

        A1 <= '1'; A2 <= '0'; A3 <= '0';
        wait for period;
        assert ((Soma = '1') and (FAout = '0'))
        report "Failed for 100." severity error;

        A1 <= '1'; A2 <= '0'; A3 <= '1';
        wait for period;
        assert ((Soma = '0') and (FAout = '1'))
        report "Failed for 101." severity error;

        A1 <= '1'; A2 <= '1'; A3 <= '0';
        wait for period;
        assert ((Soma = '0') and (FAout = '1'))
        report "Failed for 110." severity error;

        A1 <= '1'; A2 <= '1'; A3 <= '1';
        wait for period;
        assert ((Soma = '1') and (FAout = '1'))
        report "Failed for 111." severity error;
        wait;
    end process;
end tb;