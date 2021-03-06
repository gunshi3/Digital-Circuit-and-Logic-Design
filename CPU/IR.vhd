library ieee;
use ieee.std_logic_1164.all;
entity IR is
	port(input:in std_logic_vector(7 downto 0);
		ld,clock:in std_logic;
		R:out std_logic_vector(7 downto 0);
		output_a:out std_logic_vector(3 downto 0):="0000";
		output_b:out std_logic_vector(3 downto 0):="0000");
end IR;
architecture bhv of IR is
begin
	process(clock,ld)
	begin
		if clock'event and clock='0' then
			if ld='1' then
				R<=input;
				output_a<=input(7 downto 4);
				output_b<=input(3 downto 0);
			end if;
		end if;
	end process;
end bhv;