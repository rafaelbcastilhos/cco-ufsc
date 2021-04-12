library ieee;
use ieee.std_logic_1164.all;

entity usertop is port (
        KEY: in std_logic_vector(3 downto 0);
        CLK_500Hz: in std_logic;
        LEDR: out std_logic_vector(17 downto 0)
    );
end usertop;

architecture fsm1arq of usertop is
    signal CLK, RESET, O: std_logic;
    signal TRY: std_logic_vector(2 downto 0);
    component FSM1 is
        port (
           clock: in std_logic;
           reset: in std_logic;
           TRY: in std_logic_vector(2 downto 0);
           O: out std_logic
        );
    end component;
begin
    RESET <= KEY(3);
    TRY <= KEY(2 downto 0);
    CLK <= CLK_500Hz;

    FSM: FSM1 port map(CLK, RESET, TRY, O);

    LEDR(0) <= O;
end fsm1arq;


