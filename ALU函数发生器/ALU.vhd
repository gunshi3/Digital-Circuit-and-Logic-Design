library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ALU is
	port(M:in std_logic;
		S:in std_logic_vector(3 downto 0);
		A,B:in std_logic_vector(7 downto 0);
		T:out std_logic_vector(7 downto 0);
		Cf:out std_logic:='0';
		Zf:out std_logic:='0');
end ALU;
architecture bhv of ALU is
signal temp:std_logic_vector(8 downto 0);
begin
	process(M,S,A,B)
	begin
	if M='0' then
		if S="1001" then
			T<=A+B;
			temp<=('0'&A)+('0'&B);
			Cf<=temp(8);
			if temp="000000000" then Zf<='1';
			else Zf<='0';
			end if;
		elsif S="0110" then
			T<=B-A;
			temp<=('0'&B)-('0'&A);
			Cf<=temp(8);
			if temp="000000000" then Zf<='1';
			else Zf<='0';
			end if;
		else 
			if S="1010" or S="0100" then T<=B;
			else T<=A;
			end if;
			Cf<='0';
			Zf<='0';
		end if;
	elsif M='1' then
		if S="1011" then
			T<=A or B;
		elsif S="0101" then
			T<= not B;
		else 
			if S="1010" or S="0100" then T<=B;
			else T<=A;
			end if;
		end if;	
		Cf<='0';
		Zf<='0';
	end if;
	end process;
end bhv;