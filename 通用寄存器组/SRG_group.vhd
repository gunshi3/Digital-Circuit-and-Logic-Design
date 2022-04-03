library ieee;
use ieee.std_logic_1164.all;
entity SRG_group is
	port(clk,WE:in std_logic;
		RA,WA:in std_logic_vector(1 downto 0);
		I:in std_logic_vector(7 downto 0);
		S,D:out std_logic_vector(7 downto 0);
		aa,bb,cc:out std_logic_vector(7 downto 0):="00000000");
end entity;
architecture bhv of SRG_group is
signal a,b,c:std_logic_vector(7 downto 0):="00000000";
begin
process(clk,RA,WA)
begin
if RA="00" then S<=a;
elsif RA="01" then S<=b;
elsif RA="10" or RA="11" then S<=c;
end if;
if WA="00" then D<=a;
elsif WA="01" then D<=b;
elsif WA="10" or WA="11" then D<=c;
end if;
if clk'event and clk='0' then
	if WE='0' then
		if WA="00" then a<=I;
		elsif WA="01" then b<=I;
		elsif WA="10" or WA="11" then c<=I;
		end if;
	end if;
end if;
end process;
aa<=a;
bb<=b;
cc<=c;
end bhv;