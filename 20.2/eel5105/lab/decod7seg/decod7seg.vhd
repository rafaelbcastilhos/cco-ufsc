library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod is
port (decod_in:  in std_logic_vector(3 downto 0);
      out_7seg:  out std_logic_vector(6 downto 0)
    );
end decod;

architecture mydecod of decod is
begin 
  out_7seg <=  "1000000" when decod_in = "0000" else
              "1111001" when decod_in = "0001" else
              "0100100" when decod_in = "0010" else
              "0110000" when decod_in = "0011" else
              "0011001" when decod_in = "0100" else
              "0010010" when decod_in = "0101" else
              "0000010" when decod_in = "0110" else
              "1111000" when decod_in = "0111" else
              "0000000" when decod_in = "1000" else
              "0011000" when decod_in = "1001" else
              "0001000" when decod_in = "1010" else
              "0000011" when decod_in = "1011" else
              "1000110" when decod_in = "1100" else
              "0100001" when decod_in = "1101" else
              "0000110" when decod_in = "1110" else
              "0001110" when decod_in = "1111" else
              "1111111";
end mydecod;
