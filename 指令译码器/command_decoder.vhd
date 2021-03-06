library ieee;
use ieee.std_logic_1164.all;

entity command_decoder is
port(a,b: in std_logic_vector(3 downto 0);
	 EN: in std_logic;
	 MOVA,MOVB,MOVC,ADD,SUB,OR0,NOT0,RSR,RSL,JMP,JZ,JC,IN0,OUT0,NOP,HALT:out std_logic);
end command_decoder;

architecture structural of command_decoder is
	signal temp: std_logic_vector(15 downto 0):="0000000000000000";
	signal prev: std_logic_vector(3 downto 0);
	signal r1,r2: std_logic_vector(1 downto 0);
begin
process(a,b,EN,temp,prev,r1,r2)
	begin	
	temp<="0000000000000000";
	prev<=a;
	r1<=b(3)&b(2);
	r2<=b(1)&b(0);
	if EN='1' then
		case prev is  
		when "1111"=>			
			if r1/="11" and r2/="11" then temp<="1000000000000000";
			elsif r1/="11" and r2="11" then temp<="0010000000000000";	
			elsif r1 ="11" and r2/="11" then temp<="0100000000000000";
			end if;	
		when "1001"=> temp<="0001000000000000";
		when "0110"=> temp<="0000100000000000";
		when "1011"=> temp<="0000010000000000";
		when "0101"=> temp<="0000001000000000";
		when "1010"=> 
			if r2="00" then temp<=   "0000000100000000";	
			elsif r2="11" then temp<="0000000010000000";
			end if;	
		when "0011"=>
		if r1="00" then 
			if r2="00" then temp<=   "0000000001000000";
		    elsif r2="01" then temp<="0000000000100000";
		    elsif r2="10" then temp<="0000000000010000";
			end if;
		end if;
		when "0010"=> temp<="0000000000001000";
		when "0100"=> temp<="0000000000000100";		
		when "0111"=> 
		if(r1="00" and r2="00") then temp<="0000000000000010";
		end if;
		when "1000"=> 
		if(r1="00" and r2="00") then temp<="0000000000000001";
		end if;
		when others=>temp<="0000000000000010"; 
		end case;
	end if;
	
	if temp(15)='1' then MOVA <='1';
	else MOVA<='0';
	end if;
	
	if temp(14)='1' then MOVB <='1';
	else MOVB<='0';
	end if;
	
	if temp(13)='1' then MOVC <='1';
	else MOVC<='0';
	end if;

	if temp(12)='1' then ADD<='1';
	else ADD<='0';
	end if;
	if temp(11)='1' then SUB<='1';
	else SUB<='0';
	end if;
	if temp(10)='1' then OR0<='1';
	else OR0<='0';
	end if;
	
	if temp(9)='1' then NOT0 <='1';
	else NOT0<='0';
	end if;
	
	if temp(8)='1' then RSR <='1';
	else RSR<='0';
	end if;
	
	if temp(7)='1' then RSL <='1';
	else RSL<='0';
	end if;
	
	if temp(6)='1' then JMP <='1';
	else JMP<='0';
	end if;
	
	if temp(5)='1' then JZ <='1';
	else JZ<='0';
	end if;
	
	if temp(4)='1' then JC <='1';
	else JC<='0';
	end if;
	
	if temp(3)='1' then IN0 <='1';
	else IN0<='0';
	end if;
	
	if temp(2)='1' then OUT0 <='1';
	else OUT0<='0';
	end if;
	
	if temp(1)='1' then NOP<='1';
	else NOP<='0';
	end if;
	
	if temp(0)='1' then HALT <='1';
	else HALT<='0';
	end if;
  end process;
end structural;