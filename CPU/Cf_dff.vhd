library ieee;
use ieee.std_logic_1164.all;
entity Cf_dff is
	port(X,EN,clk:in std_logic;
		Cf:out std_logic);
end Cf_dff;
architecture bhv of Cf_dff is
begin
process(clk,en)
begin
if clk'event and clk='0' then
	if EN='1' then Cf<=X;
	end if;
end if;
end process;
end bhv;