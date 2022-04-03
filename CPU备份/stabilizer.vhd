library ieee;
use ieee.std_logic_1164.all;
entity stabilizer is
	port(EN,clk:in std_logic;
		X:in std_logic_vector(7 downto 0);
		BU:out std_logic_vector(7 downto 0));
end stabilizer;
architecture bhv of stabilizer is
signal temp:std_logic_vector(7 downto 0):="00000000";
begin
process(EN,clk)
begin
if EN='1' and clk='1' then temp<=X;
else temp<="ZZZZZZZZ";
end if;
end process;
BU<=temp;
end bhv;