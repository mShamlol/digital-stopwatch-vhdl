library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stopwatch is
    Port (
        clock     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        enable  : in  STD_LOGIC;
        sec_u   : out INTEGER range 0 to 9;
        sec_t   : out INTEGER range 0 to 5;
        min_u   : out INTEGER range 0 to 9;
        min_t   : out INTEGER range 0 to 5
    );
end stopwatch;

architecture Behavioral of stopwatch is

signal s_u, s_t, m_u, m_t : INTEGER := 0;

begin

process(clock, reset)
begin
    if reset = '1' then
        s_u <= 0;
        s_t <= 0;
        m_u <= 0;
        m_t <= 0;

    elsif rising_edge(clock) then
        if enable = '1' then

            if s_u = 9 then
                s_u <= 0;

                if s_t = 5 then
                    s_t <= 0;

                    if m_u = 9 then
                        m_u <= 0;

                        if m_t = 5 then
                            m_t <= 0;
                        else
                            m_t <= m_t + 1;
                        end if;

                    else
                        m_u <= m_u + 1;
                    end if;

                else
                    s_t <= s_t + 1;
                end if;

            else
                s_u <= s_u + 1;
            end if;

        end if;
    end if;
end process;

sec_u <= s_u;
sec_t <= s_t;
min_u <= m_u;
min_t <= m_t;

end Behavioral;
