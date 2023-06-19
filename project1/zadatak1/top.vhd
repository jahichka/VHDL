library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(
        fclk: in std_logic:='0';
        adcval, thresh: in unsigned (7 downto 0) := (others => '0');
        result: out std_logic:='1';
        qi: in std_logic:='1';
        qc: out std_logic:='0'                         
       );
end top;



architecture arctop of top is
    begin

        main: process(fclk)

        begin
            if falling_edge(fclk) then

                if falling_edge(qi) or qi='0' then
                    qc<='1';
                    result <= '0';
                end if; 

                if rising_edge(qi) then
                    qc<='0';
                end if;

                if qi='1' then
                    qc<='0';
                    if adcval >= thresh then
                           result <= '1';
                       else 
                       result<='0';
                   end if;
                end if;
          
            end if;


        end process;

            

end arctop;