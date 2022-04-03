library ieee;
use ieee.std_logic_1164.all;
entity  command_decoder is 
port(a,b:in std_logic_vector(3 downto 0);
	en:in std_logic;
	MOVA,MOVB,MOVC,ALU,NOT0,SHR,SHL,JMP,JZ,JC,IN0,OUT0,NOP,HALT:out std_logic);
end entity;
architecture structural of command_decoder is
	signal temp:std_logic_vector(15 downto 0):="0000000000000000";
	signal R1,R2:std_logic_vector(1 downto 0);
	signal prev:std_logic_vector(3 downto 0);
begin
prev<=a;
R1<=b(3)&b(2);
   R2<=b(1)&b(0);
process(a,b,en)
	begin
	
	if en='1' then
	
		if prev="1111" then
			if R1/="11" and R2/="11" then temp<="1000000000000000";
			elsif R1="11" and R2/="11" then temp<="0100000000000000";
			elsif R1/="11" and R2="11" then temp<="0010000000000000";
			end if;
		elsif prev="1001" then temp<="0001000000000000";
		elsif prev="0110" then temp<="0000100000000000";
		elsif prev="1011" then temp<="0000010000000000";
		elsif prev="0101" then temp<="0000001000000000";
		elsif prev="1010" then
			if R2="00" then temp<="0000000100000000";
			elsif R2="11" then temp<="0000000010000000";
			end if;
		elsif prev="0011" and R1="00" then
			if R2="00" then temp<="0000000001000000";
			elsif R2="01" then temp<="0000000000100000";
			elsif R2="10" then temp<="0000000000010000";
			end if;
		elsif prev="0010" then temp<="0000000000001000";
		elsif prev="0100" then temp<="0000000000000100";
		elsif prev="0111" and R1="00" and R2="00" then temp<="0000000000000010";
		elsif prev="1000" and R1="00" and R2="00" then temp<="0000000000000001";
		else temp<="0000000000000010";
		end if;
	end if;
	if temp(15)='1' then MOVA<='1';
	else MOVA<='0';
	end if;
	if temp(14)='1' then MOVB<='1';
	else MOVB<='0';
	end if;
	if temp(13)='1' then MOVC<='1';
	else MOVC<='0';
	end if;
	if temp(12)='1' or temp(11)='1' or temp(10)='1' then ALU<='1';
	else ALU<='0';
	end if;
	if temp(9)='1' then NOT0<='1';
	else NOT0<='0';
	end if;
	if temp(8)='1' then SHR<='1';
	else SHR<='0';
	end if;
	if temp(7)='1' then SHL<='1';
	else SHL<='0';
	end if;
	if temp(6)='1' then JMP<='1';
	else JMP<='0';
	end if;
	if temp(5)='1' then JZ<='1';
	else JZ<='0';
	end if;
	if temp(4)='1' then JC<='1';
	else JC<='0';
	end if;
	if temp(3)='1' then IN0<='1';
	else IN0<='0';
	end if;
	if temp(2)='1' then OUT0<='1';
	else OUT0<='0';
	end if;
	if temp(1)='1' then NOP<='1';
	else NOP<='0';
	end if;
	if temp(0)='1' then HALT<='1';
	else HALT<='0';
	end if;
end process;
end architecture;