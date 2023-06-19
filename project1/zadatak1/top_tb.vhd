library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end top_tb;

architecture arctop_tb of top_tb is

    component top is
      port (
            fclk: in std_logic;
            adcval, thresh: in unsigned (7 downto 0) := (others => '0');
            result: out std_logic:='1';
            qi: in std_logic:='1';
            qc: out std_logic:='0'
        );
    end component;


signal fclk: std_logic:='0';
signal adcval: unsigned (7 downto 0):=(others => '0');
signal thresh: unsigned (7 downto 0):=(others => '0');
signal result: std_logic:='0';
signal qi: std_logic:='1';
signal qc: std_logic:='0';


begin
	counter: top port map (fclk=>fclk, adcval=>adcval, thresh=>thresh, result => result,qi=>qi,qc=>qc);


    quantizer: process
    begin
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        fclk <= '0';
        adcval <= x"A5";
        thresh <= x"21";
        qi<='1';        
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        qi<='0';
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        
        adcval <= x"7F";
        thresh <= x"7F";
        qi<='1';        
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        qi<='0';
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        
        adcval <= x"3A";
        thresh <= x"5A";
        qi<='1';        
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        qi<='0';
        for i in 0 to 5 loop
            wait for 0.5 ns;
            fclk <= '1';
            wait for 0.5 ns;
            fclk <= '0';
        end loop;
        wait;
     end process;
end arctop_tb;