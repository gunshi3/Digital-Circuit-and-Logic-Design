library ieee;
use ieee.std_logic_1164.all;
entity SM is
	port(clk,EN:in std_logic;
		Z:out std_logic);
end SM;
architecture bhv of SM is
signal SM:std_logic:='0';
begin
process(clk,EN)
begin
if clk'event and clk='0' then 
	if EN='1' then
		SM<=not SM;
	end if;
end if;
Z<=SM;
end process;
end bhv;