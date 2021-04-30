library ieee;   
use ieee.std_logic_1164.all;

entity decBCD is port (
    bin_in: in std_logic_vector(3 downto 0);
    bcd_out: out std_logic_vector(7 downto 0)
);
end entity decBCD;

architecture binBCD of decBCD is
begin
    with bin_in select
    bcd_out <= "00000000" when "0000",
                "00000001" when "0001",
                "00000010" when "0010",
                "00000011" when "0011",
                "00000100" when "0100",
                "00000101" when "0101",
                "00000110" when "0110",
                "00000111" when "0111",
                "00001000" when "1000",
                "00001001" when "1001",
                "00010000" when "1010",
                "00010001" when "1011",
                "00010010" when "1100",
                "00010011" when "1101",
                "00010100" when "1110",
                "00010101" when "1111",
                "11111111" when others;

end architecture binBCD;