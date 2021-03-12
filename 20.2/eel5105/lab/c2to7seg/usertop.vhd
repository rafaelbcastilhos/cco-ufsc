library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
	HEX0: out std_logic_vector(6 downto 0)
);
end usertop;

architecture decodC2to7seg of usertop is
    component decod is
        port(decod_in: in std_logic_vector(3 downto 0);
            out_7seg: out std_logic_vector(6 downto 0));
        end component;

    component compl2 is
        port (X: in std_logic_vector(3 downto 0);
            Y: out std_logic_vector(3 downto 0));
    end component;

    component mux is
        port (mux_in0: in std_logic_vector(3 downto 0);
            mux_in1: in std_logic_vector(3 downto 0);
            selector: in std_logic;
            mux_out: out std_logic_vector(3 downto 0));
    end component;

    signal input, compl2_out, mux44_out: std_logic_vector(3 downto 0);
begin

    input <= SW(3 downto 0);

    COMP2: compl2 port map(input, compl2_out);

    MUX44: mux port map(input, compl2_out, input(3), mux44_out);

    SEG1: decod port map(mux44_out, HEX0); 

end decodC2to7seg;