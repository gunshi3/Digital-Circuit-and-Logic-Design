library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity PC is
	port(clk,in_pc,ld_pc:in std_logic;
		a:in std_logic_vector(7 downto 0);
		c:out std_logic_vector(7 downto 0));
end entity;
architecture bhv of PC is
signal address:std_logic_vector(7 downto 0):="00000000";
begin
process(clk)
begin
if clk'event and clk='0' then
	if in_pc='1' and ld_pc='0' then
		address<=address+"00000001";
	elsif in_pc='0' and ld_pc='1' then
		address<=a;
	else NULL;
	end if;
end if;
end process;
c<=address;
end bhv;