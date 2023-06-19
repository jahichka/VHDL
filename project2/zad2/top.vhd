library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(
        fclk: in std_logic:= '0';
        ina: in std_logic:='0';
        inb: in std_logic:='0';
        cwout: out std_logic:='0';
        ccwout: out std_logic:='0'
       );
end top;

architecture arctop of top is
    begin

        main: process(ina,inb)
        variable cw_flag: std_logic:='0';
        variable ccw_flag: std_logic:='0';

        begin

        if falling_edge(fclk) then 

            if falling_edge(ina) and inb='1' then
               cw_flag:='1';
               ccw_flag:='0';
            end if;

            if falling_edge(inb) and ina='1' then
                ccw_flag:='1';
                cw_flag:='0';
            end if;

            cwout<=cw_flag;
            ccwout<=ccw_flag;
        end if;

        end process;

            

end arctop;