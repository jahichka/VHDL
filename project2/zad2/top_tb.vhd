library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end top_tb;

architecture arctop_tb of top_tb is

    component top is
      port (
        fclk: in std_logic:= '0';
        ina: in std_logic:='0';
        inb: in std_logic:='0';
        cwout: out std_logic:='0';
        ccwout: out std_logic:='0'
        );
    end component;


signal fclk: std_logic:='0';
signal ina:  std_logic:='0';
signal inb: std_logic:='0';
signal cwout: std_logic:='0';
signal ccwout: std_logic:='0';



begin
	zad2: top port map (fclk=>fclk, ina=>ina, inb=>inb, cwout=>cwout, ccwout=>ccwout);

    encoder: process
    begin
        
        ina<='1';
        inb<='0';
        for i in 0 to 10 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='1';
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='0';
        for i in 0 to 15 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='0';
        for i in 0 to 20 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='1';
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='1';
        for i in 0 to 10 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='0';
        for i in 0 to 20 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='0';
        for i in 0 to 15 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='1';
        for i in 0 to 10 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='1';
        for i in 0 to 20 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='0';
        for i in 0 to 15 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='0';

        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='1';
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='1';
        for i in 0 to 10 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='0';
        for i in 0 to 15 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='0';
        for i in 0 to 20 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='1';
        for i in 0 to 10 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='1';
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        inb<='0';
        for i in 0 to 20 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        ina<='0';
        

        

        wait;
     end process;
end arctop_tb;