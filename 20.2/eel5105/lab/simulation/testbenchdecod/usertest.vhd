library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertest is
end usertest;

architecture exe3 of usertest is
    signal Input: std_logic_vector(1 downto 0);
    signal Enable: std_logic;
    signal Output: std_logic_vector(7 downto 0);

    component decod is
        port(
            E: in std_logic_vector(1 downto 0);
            En: in std_logic;
            S: out std_logic_vector(7 downto 0)
        );
        end component;
begin

    DUT: decod port map(Input, Enable, Output); 

    process
    constant period: time := 10 ns;
    begin
        -- testes com o enable desativado
        Enable <= '0';
        wait for period;
        assert Output = "11111111"
        report "Failed for En = 0." severity error;

        Input <= "00";
        wait for period;
        assert Output = "11111111"
        report "Failed for E = 00 and En = 0." severity error;

        Input <= "01";
        wait for period;
        assert Output = "11111111"
        report "Failed for E = 01 and En = 0." severity error;

        Input <= "10";
        wait for period;
        assert Output = "11111111"
        report "Failed for E = 10 and En = 0." severity error;

        Input <= "11";
        wait for period;
        assert Output = "11111111"
        report "Failed for E = 11 and En = 0." severity error;

        -- testes com o enable ativado
        Enable <= '1';

        Input <= "00";
        wait for period;
        assert Output = "00011000"
        report "Failed for E = 00 and En = 1." severity error;

        Input <= "01";
        wait for period;
        assert Output = "00100100"
        report "Failed for E = 01 and En = 1." severity error;

        Input <= "10";
        wait for period;
        assert Output = "01000010"
        report "Failed for E = 10 and En = 1." severity error;

        Input <= "11";
        wait for period;
        assert Output = "10000001"
        report "Failed for E = 11 and En = 1." severity error;
        wait;

    end process;
end exe3;
