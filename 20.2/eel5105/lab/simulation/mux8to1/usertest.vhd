library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertest is
end usertest;

architecture mult34bits of usertest is
    signal A: std_logic_vector(7 downto 0);
    signal SEL: std_logic_vector(2 downto 0);
    signal ENA: std_logic;
    signal OTPT: std_logic;

    component mux8 is
        port (
            INPUT: in std_logic_vector(7 downto 0);
            INPUT_SELECT: in std_logic_vector(2 downto 0);
            ENABLE: in std_logic;
            OUTPUT: out std_logic
        );
    end component;
begin

    MUX8p1: mux8 port map(A, SEL, ENA, OTPT);

    process
      constant period: time := 10 ns;
      begin
        A <= "00000001"; SEL <= "000"; ENA <= '1';
        wait for period;
        assert OTPT = '1'
        report "Failed for 0." severity error;

        A <= "00000010"; SEL <= "001"; ENA <= '1';
        wait for period;
        assert OTPT = '1'
        report "Failed for 1." severity error;

        A <= "00000100"; SEL <= "010"; ENA <= '1';
        wait for period;
        assert OTPT = '1'
        report "Failed for 2." severity error;
        wait;

        A <= "01000000"; SEL <= "110"; ENA <= '1';
        wait for period;
        assert OTPT = '1'
        report "Failed for 6." severity error;
        wait;

        A <= "10000000"; SEL <= "111"; ENA <= '1';
        wait for period;
        assert OTPT = '1'
        report "Failed for 7." severity error;
        wait;

        A <= "00000000"; SEL <= "100"; ENA <= '1';
        wait for period;
        assert OTPT = '1'
        report "Failed random." severity error;
        wait;
     end process;
end mult34bits;