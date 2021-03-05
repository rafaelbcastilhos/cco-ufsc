library IEEE;
use IEEE.Std_Logic_1164.all;

entity sumsub is
port (A,B: in std_logic_vector(3 downto 0);
    C: in std_logic_vector(1 downto 0);
    S: out std_logic_vector(4 downto 0);
    Overflow: out std_logic);
end sumsub;

architecture sumsub4 of sumsub is
    signal C0out, C1out, C2out, C3out,
            B0out, B1out, B2out, B3out: std_logic;

    component modb is
        port (B: in std_logic;
            C1: in std_logic;
            C0: in std_logic;
            Bout: out std_logic);
    end component;

    component fulladder is
        port (A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            S: out std_logic;
            Cout: out std_logic);
    end component;

begin
    MODB1: modb port map (B => B(0),
                            C1 => C(1),
                            C0 => C(0),
                            Bout => B0out);

    FA1: fulladder port map (A => A(0),
                            B => B0out,
                            Cin => C(0),
                            S => S(0),
                            Cout => C0out);
-- -------------------------------------------------------
    MODB2: modb port map (B => B(1),
                            C1 => C(1),
                            C0 => C(0),
                            Bout => B1out);

    FA2: fulladder port map (A => A(1),
                            B => B1out,
                            Cin => C0out,
                            S => S(1),
                            Cout => C1out);
-- -------------------------------------------------------
    MODB3: modb port map (B => B(2),
                            C1 => C(1),
                            C0 => C(0),
                            Bout => B2out);

    FA3: fulladder port map (A => A(2),
                            B => B2out,
                            Cin => C1out,
                            S => S(2),
                            Cout => C2out);
-- -------------------------------------------------------
    MODB4: modb port map (B => B(3),
                            C1 => C(1),
                            C0 => C(0),
                            Bout => B3out);

    FA4: fulladder port map (A => A(3),
                            B => B3out,
                            Cin => C2out,
                            S => S(3),
                            Cout => C3out);
-- -------------------------------------------------------

    Overflow <= C2out xor C3out;
end sumsub4;