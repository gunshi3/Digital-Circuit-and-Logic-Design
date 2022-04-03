library ieee;
use ieee.std_logic_1164.all;
entity controller is
	port(IR:in std_logic_vector(7 downto 0);
		MOVA,MOVB,MOVC,ADD,SUB,OR0,NOT0,SHR,SHL,JMP,JZ,JC,IN0,OUT0,NOP,HALT,SM,Cf,Zf:in std_logic;
		RA,WA,MADD:out std_logic_vector(1 downto 0);
		ALU_S:out std_logic_vector(3 downto 0);
		WE,M,FBUS,FR,FL,PC_LD,PC_IN,IR_LD,XL,DL,Cf_EN,Zf_EN,IN_EN,OUT_EN,SM_EN:out std_logic);
end controller;
architecture bhv of controller is
begin
process(MOVA,MOVB,MOVC,ADD,SUB,OR0,NOT0,SHR,SHL,JMP,JZ,JC,IN0,OUT0,NOP,HALT,IR,SM,Zf,Cf)
begin
RA<=IR(1 downto 0);
WA<=IR(3 downto 2);
ALU_S<=IR(7 downto 4);
if SM='0' or JC='1' OR JZ='1' OR JMP='1' then MADD<="00";
elsif (SM='1' and MOVC='1') then MADD<="01";
elsif (SM='1' and MOVB='1') then MADD<="10";
else MADD<="00";
end if;
M<=OR0 or NOT0;
WE<=not(MOVA or MOVC or ADD or SUB or OR0 or NOT0 or SHR or SHL or IN0) or (not SM);
FBUS<=(MOVA or MOVB or ADD or SUB or OR0 or NOT0 or SHR or SHL or OUT0) and SM and (not IN0);
FR<=SHR and SM;
FL<=SHL and SM;
Cf_EN<=(ADD or SUB or SHR or SHL) and SM;
Zf_EN<=(ADD or SUB) and SM;
IN_EN<=IN0 and SM;
OUT_EN<=OUT0 and SM;
SM_EN<=not HALT;
PC_LD<=(JMP or (JZ and Zf) or (JC and Cf)) and SM;
PC_IN<=(JZ and not Zf) or (JC and not Cf) or (not SM);
IR_LD<=not SM;
XL<=MOVB and SM;
DL<=((MOVC or JMP or (JC and Cf) or (JZ and Zf)) and SM and (not IN0) and (not OUT0)) or (not SM);
end process;
end bhv;		