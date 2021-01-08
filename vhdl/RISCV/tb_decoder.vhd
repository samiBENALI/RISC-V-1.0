

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



library RISCV;
use RISCV.pack_RISCV32I.all;

entity tb_decoder is 
end tb_decoder;

architecture archi of tb_decoder is 
	signal inst :   std_logic_vector(32-1 downto 0);
       signal rs1a :  std_logic_vector( 5-1 downto 0);
       signal rs2a : std_logic_vector( 5-1 downto 0);
       signal rda  :  std_logic_vector(5-1 downto 0);
      signal immS :  std_logic_vector(32-1 downto 0);
      signal immB :  std_logic_vector(32-1 downto 0);
      signal immU :  std_logic_vector(32-1 downto 0);
      signal immJ :  std_logic_vector(32-1 downto 0);
	   signal immI :  std_logic_vector(32-1 downto 0);
COMPONENT decoder
	port(
      inst : in  std_logic_vector(32-1 downto 0);
      rs1a : out std_logic_vector( 5-1 downto 0);
      rs2a : out std_logic_vector( 5-1 downto 0);
      rda  : out std_logic_vector( 5-1 downto 0);
      immI : out std_logic_vector(32-1 downto 0);
      immS : out std_logic_vector(32-1 downto 0);
      immB : out std_logic_vector(32-1 downto 0);
      immU : out std_logic_vector(32-1 downto 0);
      immJ : out std_logic_vector(32-1 downto 0)
	);
end COMPONENT ;
begin 
	uut:DECODER
	port map(
		inst => inst,
		rs1a => rs1a,
		rs2a => rs2a,
		rda=> rda,
		immI => immI,
		immS => immS,
		immB => immB,
		immU=> immU,
		immJ => immJ
		
	);
  process   
     begin               
        inst <= x"0000B" & b"00101" & b"0110111";
		
		wait  ;
end process;
 
end archi ;

