library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
    port (mux_in0: in std_logic_vector(3 downto 0);
        mux_in1: in std_logic_vector(3 downto 0);
        selector: in std_logic;
        mux_out: out std_logic_vector(3 downto 0));
end mux;

architecture mux4to4 of mux is

begin

    mux_out <= mux_in0 when selector = '0' else mux_in1;

end mux4to4;