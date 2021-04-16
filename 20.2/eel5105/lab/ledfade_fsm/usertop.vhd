library ieee;
use ieee.std_logic_1164.all;

entity usertop is port (
        SW: in std_logic(0);
        CLK_1Hz: in std_logic;
        LEDR: out std_logic_vector(17 downto 0)
    );
end usertop;

architecture fsm1arq of usertop is
    signal CLK, RESET, X: std_logic;
    signal O: std_logic_vector(2 downto 0);
    component FSM1 is
        port (
            clock: in std_logic;
            reset: in std_logic;
            x: out std_logic_vector(2 downto 0)
        );
    end component;
begin
    RESET <= SW(0);
    CLK <= CLK_1Hz;

    FSM: FSM1 port map(CLK, RESET, O);

    LEDR(2 downto 0) <= O;
end fsm1arq;
