library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertest is
end usertest;

architecture exe4 of usertest is
    signal reset, clkout: std_logic;
    signal clkin : std_logic := '0';
    constant period : time := 10 ns;
    signal countout: std_logic_vector(2 downto 0);

    component FSM1 is
        port (
            CLKI: in std_logic;
            RST: in std_logic;
            CLKO: out std_logic;
            CNTO: out std_logic_vector(2 downto 0)
        );
    end component;
begin

    -- emulando clock
    process
        begin
            clkin <= '0';
            wait for period/2;
            clkin <= '1';
            wait for period/2;
    end process;


    -- port map para fsm
    FSM: FSM1 port map(clkin, reset, clkout, countout);

    -- testbench verificando countout e clkout
    process
    begin
        reset <= '1';
        wait for period;
        assert countout = "000" and clkout = '0'
        report "Failed for countout = 000 and clkout = 0" severity error;

        reset <= '0';
        wait for period;
        assert countout = "001" and clkout = '0'
        report "Failed for countout = 001 and clkout = 0" severity error;

        wait for period;
        assert countout = "010" and clkout = '0'
        report "Failed for countout = 010 and clkout = 0" severity error;

        wait for period;
        assert countout = "011" and clkout = '0'
        report "Failed for countout = 011 and clkout = 0" severity error;

        wait for period;
        assert countout = "100" and clkout = '1'
        report "Failed for countout = 100 and clkout = 1" severity error;
        wait;
    end process;
end exe4;