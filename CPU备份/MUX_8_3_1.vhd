library ieee;
use ieee.std_logic_1164.all;
entity MUX_8_3_1 is
	port(S:in std_logic_vector(1 downto 0);
		I0,I1,I2:in std_logic_vector(7 downto 0);
		Y:out std_logic_vector(7 downto 0));
end entity;
architecture behavior of MUX_8_3_1 is
begin
	Y<=I0 when S="00" else
	   I1 when S="01" else
	   I2 when S="10" else
	   "XXXXXXXX";
end behavior;