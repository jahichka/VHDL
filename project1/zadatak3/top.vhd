library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--mc out

entity top is
    port(
        fclk: in std_logic;
        oneh: in unsigned (7 downto 0) := (others => '0');
        onel: in unsigned (7 downto 0) := (others => '0');
        onesubper: in unsigned (7 downto 0) := (others => '0');
        zeroh: in unsigned (7 downto 0) := (others => '0');
        zerol: in unsigned (7 downto 0) := (others => '0');
        zerosubper: in unsigned (7 downto 0) := (others => '0');
        sigval: in std_logic_vector (7 downto 0) := (others => '0');
        mi: in std_logic;
        mc: out std_logic:='0';
        modsig: out std_logic:='0'
       );
end top;


architecture arctop of top is

    begin
        main: process(fclk)
        variable ctr: unsigned (7 downto 0):= "00000000";
        variable ctrh: unsigned (7 downto 0):= "00000000";
        variable ctrl: unsigned (7 downto 0):= "00000000";
        variable ctrsub: unsigned (7 downto 0):= "00000000";
        variable idx: integer:=7;

        begin
            
            if falling_edge(fclk) then
                if rising_edge(mi) then
                    mc<='0';
                end if;

                if falling_edge(mi) then
                    mc<='1';
                    ctr:="00000000";
                    ctrh:="00000000";
                    ctrl:="00000000";
                    ctrsub:="00000000";
                    idx:=0;
                end if;

                if mi='1' then

                    if idx>-1 then

                    if sigval(idx)='1' then
                        ctr:=ctr+1;
                        
                        if ctr<=onel then
                            modsig<='0';
                            last_state:='0';
                        end if;

                        if ctr>onel and ctr<=(onel+oneh) then

                            if ctrsub<(onesubper/2) then
                                modsig<='0';
                                ctrsub:=ctrsub+1;
                            elsif ctrsub>=(onesubper/2) and ctrsub<onesubper-1 then
                                modsig<='1';
                                ctrsub:=ctrsub+1;
                            elsif ctrsub>=onesubper-1 then
                                ctrsub:="00000000";
                            end if;
                        end if;

                        if ctr>(onel+oneh) then
                            ctr:="00000000";
                            ctrh:="00000000";
                            ctrl:="00000000";
                            ctrsub:="00000000";
                            idx:=idx-1;
                        end if;

                    else

                        ctr:=ctr+1;

                        if ctr<=zeroh then

                            if ctrsub<=(zerosubper/2) then
                                modsig<='0';
                                ctrsub:=ctrsub+1;
                            end if;

                            if ctrsub>(zerosubper/2) and ctrsub<=zerosubper then
                                modsig<='1';
                                ctrsub:=ctrsub+1;
                            end if;

                            if ctrsub=zerosubper+1 then
                                ctrsub:="00000000";
                            end if;

                        end if;

                        if ctr>zeroh and ctr<=zeroh+zerol then

                            modsig<='0';

                        end if;

                        if ctr=zeroh+zerol then
                            ctr:="00000000";
                            ctrh:="00000000";
                            ctrl:="00000000";
                            ctrsub:="00000000";
                            idx:=idx-1;
                        end if;
                    end if;

                        if idx<0 then
                            idx:=7;
                            modsig<='0';
                        end if;

                    end if;

                end if;
            end if;
        end process;
end arctop;