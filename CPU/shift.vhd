library ieee;
use ieee.std_logic_1164.all;
entity shift is
	port(fbus,flbus,frbus:in std_logic;
		A:in std_logic_vector(7 downto 0);
		W:out std_logic_vector(7 downto 0);
		cf:out std_logic:='0');
end shift;
architecture bhv of shift is
begin
process(fbus,flbus,frbus)
	begin
	if fbus='1' then
		if flbus='1' then 
			W<=A(6 downto 0)&A(7);
			cf<=A(7);
		elsif frbus='1' then 
			W<=A(0)&A(7 downto 1);
			cf<=A(0);
		else 
			W<=A;
			cf<='0';
		end if;
	else 
		W<="ZZZZZZZZ";
		cf<='0';
	end if;
end process;
end bhv;