library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod is
port (
        E: in std_logic_vector(1 downto 0);
        En: in std_logic;
        S: out std_logic_vector(7 downto 0)
    );
end decod;

architecture mydec of decod is
begin
     S <= "11111111" when En = '0' else
          "10000001" when E = "11" else
          "01000010" when E = "10" else
          "00100100" when E = "01" else
          "00011000";
end mydec;
