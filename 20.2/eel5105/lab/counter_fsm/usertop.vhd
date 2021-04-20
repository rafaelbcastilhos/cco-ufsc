library ieee;
use ieee.std_logic_1164.all;

entity usertop is port (
        SW: in std_logic_vector(17 downto 0);
        CLK_1Hz: in std_logic
    );
end usertop;

architecture fsm1arq of usertop is
    signal reset, clkout: std_logic;
    signal countout: std_logic_vector(2 downto 0);

    component FSM1 is
        port (
            CLKI: in std_logic;
            RST: in std_logic;
            CLKO: out std_logic;
            CNTO: out std_logic_vector(2 downto 0)
        );
    end component;
begin
    reset <= SW(0);

    -- port map para fsm
    FSM: FSM1 port map(CLK_1Hz, reset, clkout, countout);

end fsm1arq;
