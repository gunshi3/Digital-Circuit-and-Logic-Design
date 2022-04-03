library ieee;
use ieee.std_logic_1164.all;
entity Zf_dff is
	port(clk,EN,X:in std_logic;
		Zf:out std_logic);
end Zf_dff;
architecture bhv of Zf_dff is
begin
process(clk,EN)
	begin
	if clk'event and clk='0' then
		if EN='1' then Zf<=X;
		end if;
	end if;
end process;
end bhv;