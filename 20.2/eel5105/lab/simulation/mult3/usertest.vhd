library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertest is
end usertest;

architecture mult34bits of usertest is
    signal A1: std_logic_vector(3 downto 0);
    signal Soma, Saida: std_logic_vector(4 downto 0);

    component mult is
        port (A, B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(4 downto 0));
        end component;

begin

    SUM1: mult port map(A => A1,
                        B => A1,
                        S => Soma);

    SUM2: mult port map(A => A1,
                        B => Soma(3 downto 0),
                        S => Saida);

    process
    constant period: time := 10 ns;
    begin
        A1 <= "0000";
        wait for period;
        assert Saida = "00000"
        report "Failed for 0000." severity error;

        A1 <= "0001";
        wait for period;
        assert Saida = "00011"
        report "Failed for 0001." severity error;

        A1 <= "0010";
        wait for period;
        assert Saida = "00110"
        report "Failed for 0010." severity error;

        A1 <= "0011";
        wait for period;
        assert Saida = "01001"
        report "Failed for 0011." severity error;

        A1 <= "0100";
        wait for period;
        assert Saida = "01100"
        report "Failed for 0100." severity error;

        A1 <= "0101";
        wait for period;
        assert Saida = "01111"
        report "Failed for 0101." severity error;

        A1 <= "0110";
        wait for period;
        assert Saida = "10010"
        report "Failed for 0110." severity error;

        A1 <= "0111";
        wait for period;
        assert Saida = "10101"
        report "Failed for 0111." severity error;
        wait;
    end process;
end mult34bits;