library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(
        fclk: in std_logic;
        insig: in std_logic;
        avrval: out unsigned (7 downto 0) := (others => '0')
       );
end top;


architecture arctop of top is
    begin
        main: process(fclk)
        variable last_state: std_logic :='0';
        variable length : integer := 0;
        variable count : integer := 0;
        variable result: integer range 1 to 100;
    
        begin
            if falling_edge(fclk) then
                length:=length+1;

                if insig = '1' then
                    count:=count+1;
                end if;

                if insig = '0' and last_state='1' then
                    result:=(count*100)/length;
                    count:= 0;
                    length:= 0;
                    avrval<=to_unsigned(result,8);
                end if;

                last_state:=insig;
            end if;
        end process;
            

end arctop;