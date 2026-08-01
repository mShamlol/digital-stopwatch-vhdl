library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch_tb is
end stopwatch_tb;

architecture Behavioral of stopwatch_tb is

-- Component declaration
component stopwatch
    Port (
        clock     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        enable  : in  STD_LOGIC;
        sec_u   : out INTEGER range 0 to 9;
        sec_t   : out INTEGER range 0 to 5;
        min_u   : out INTEGER range 0 to 9;
        min_t   : out INTEGER range 0 to 5
    );
end component;

-- Signals
signal clock     : STD_LOGIC := '0';
signal reset   : STD_LOGIC := '1';
signal enable  : STD_LOGIC := '0';

signal sec_u   : INTEGER;
signal sec_t   : INTEGER;
signal min_u   : INTEGER;
signal min_t   : INTEGER;

begin

-- Instantiate the stopwatch
uut: stopwatch
port map (
    clock => clock,
    reset => reset,
    enable => enable,
    sec_u => sec_u,
    sec_t => sec_t,
    min_u => min_u,
    min_t => min_t
);

-- Clock generation (fast for simulation)
clk_process : process
begin
    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
end process;

-- Stimulus process
stim_proc: process
begin
    -- Initial reset
    wait for 50 ns;
    reset <= '0';
    enable <= '1';

    -- Run for some time
    wait for 500 ns;

    -- Pause
    enable <= '0';
    wait for 200 ns;

    -- Resume
    enable <= '1';
    wait for 500 ns;

    -- Reset again
    reset <= '1';
    wait for 50 ns;
    reset <= '0';

    wait;
end process;

end Behavioral;