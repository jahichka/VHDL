library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end top_tb;

architecture arctop_tb of top_tb is

    component top is
      port (
        fclk: in std_logic;
        insig: in std_logic;
        avrval: out unsigned (7 downto 0) := (others => '0')
        );
    end component;


signal fclk: std_logic:='1';
signal insig: std_logic:='0';
signal avrval: unsigned (7 downto 0);


begin
	a: top port map (fclk=>fclk, insig=>insig, avrval=>avrval);

	clk: process
	
	begin
        assert false report "test began";
		fclk <= 'X';
		wait for 1 ns;
		
	
		for k in 0 to 200 loop
			fclk <= '0';
			wait for 1 ns;
			
			fclk <= '1';
			wait for 1 ns;	
		end loop;
			
		assert false report "test completed";
		wait;
		
	end process;

    avr: process
    begin
        insig <= '0';

        wait for 20 ns;
        insig <= '1';

        wait for 20 ns;
        insig <= '0';

        wait for 20 ns;
        insig <='1';

        wait for 60 ns;
        insig <= '0';

        wait for 10 ns;
        insig <='1';

        wait for 30 ns;
        insig <='0';

        wait for 20 ns;        

        wait;


    end process;

end arctop_tb;