library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity SM is
	port(clk,EN:in std_logic;
		Z:out std_logic);
end entity;
architecture bhv of SM is
signal SM:std_logic:='0';
begin
process(EN,clk)
begin	
	if(clk'event and clk='0') then
		if(EN='1') then SM<=not SM;
		else NULL;
	    end if;
	end if;
end process;
Z<=SM;
end bhv;