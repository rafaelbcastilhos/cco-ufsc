library ieee;
use ieee.std_logic_1164.all;

entity usertop is port (
        SW: in std_logic_vector(17 downto 0);
        CLK_1Hz: in std_logic;
        LEDR: out std_logic_vector(17 downto 0)
    );
end usertop;

architecture fsm1arq of usertop is
    signal CLK, RESET, A, B, X: std_logic;
    component FSM1 is
        port (
           clock: in std_logic;
           reset: in std_logic;
           a: in std_logic;
           b: in std_logic;
           x: out std_logic );
    end component;
begin
    RESET <= SW(0);
    A <= SW(1);
    B <= SW(2);
    CLK <= CLK_1Hz;

    FSM: FSM1 port map(CLK, RESET, A, B, X);

    LEDR(0) <= X;
end fsm1arq;


