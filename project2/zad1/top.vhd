library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(
        fclk: in std_logic:= '0';
        rgbin: in std_logic_vector(23 downto 0) := (others => '0');
        rgbout: out std_logic_vector(15 downto 0) := (others => '0')
       );
end top;

architecture arctop of top is
    begin

        main: process(rgbin)
        variable convert: std_logic_vector (15 downto 0) := (others => '0');

        begin

            for i in 23 downto 19 loop
                convert(i-8):=rgbin(i);
            end loop;

            for i in 15 downto 10 loop
                convert(i-5):=rgbin(i);
            end loop;

            for i in 7 downto 3 loop
                convert(i-3):=rgbin(i);
            end loop;

            rgbout<=convert;


        end process;

            

end arctop;