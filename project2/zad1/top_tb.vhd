library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end top_tb;

architecture arctop_tb of top_tb is

    component top is
      port (
        fclk: in std_logic:= '0';
        rgbin: in std_logic_vector(23 downto 0) := (others => '0');
        rgbout:out std_logic_vector(15 downto 0) := (others => '0')
        );
    end component;


signal fclk: std_logic:='0';
signal rgbin: std_logic_vector (23 downto 0):=(others => '0');
signal rgbout: std_logic_vector (15 downto 0):=(others => '0');



begin
	zad1: top port map (fclk=>fclk, rgbin=>rgbin, rgbout=>rgbout);

    converter: process
    begin
        
        rgbin<=x"202306";
    
        for i in 0 to 10 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        rgbin<=x"ADBEEF";

        for i in 0 to 10 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        rgbin<=x"123456";

        for i in 0 to 10 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;

        wait;
     end process;
end arctop_tb;