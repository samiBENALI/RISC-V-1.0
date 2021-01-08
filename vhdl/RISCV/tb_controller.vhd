
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



library RISCV;
use RISCV.pack_RISCV32I.all;

entity tb_controller is 
end tb_controller;

architecture archi of tb_controller is 

	   
	   signal inst         :  std_logic_vector(32-1 downto 0);
      signal decoded_inst :  tinstruction ;
COMPONENT controller
	port(
      inst         : in  std_logic_vector(32-1 downto 0);
      decoded_inst : out tinstruction
	);
	
end COMPONENT ;
begin 
	uut:controller
	port map(
		inst => inst,
		decoded_inst => decoded_inst
		
	);
  process   
     begin               
        inst <= x"0000B" & b"00101" & b"0110111"; wait for 10 ns ;
		inst <= x"0000B" & b"00101" & b"0010111"; wait for 10ns;
		inst <= x"0000B" & b"00101" & b"1101111"; wait for 10ns;
   
        inst <= b"1" & x"0000" & b"000" & b"00001" & b"1100111"; wait for 10ns;
		inst <= b"1" & x"0000" & b"010" & b"00001" & b"1100111"; wait for 10ns; --NOP
		inst <= b"1" & x"0000" & b"000" & b"00101" & b"1100011"; wait for 10ns;
		inst <= b"1" & x"0000" & b"001" & b"00101" & b"1100011"; wait for 10ns;
		inst <= b"1" & x"0000" & b"100" & b"00101" & b"1100011"; wait for 10ns;
		inst <= b"1" & x"0000" & b"101" & b"00101" & b"1100011"; wait for 10ns;
		inst <= b"1" & x"0000" & b"110" & b"00101" & b"1100011"; wait for 10ns;
		inst <= b"1" & x"0000" & b"111" & b"00101" & b"1100011"; wait for 10ns;
		
		inst <= b"1" & x"0000" & b"010" & b"00101" & b"1100011"; wait for 10ns; --NOP
		inst <= b"1" & x"0000" & b"000" & b"00101" & b"0000011"; wait for 10ns;
		inst <= b"1" & x"0000" & b"001" & b"00101" & b"0000011"; wait for 10ns;
		inst <= b"1" & x"0000" & b"010" & b"00101" & b"0000011"; wait for 10ns;
		inst <= b"1" & x"0000" & b"100" & b"00101" & b"0000011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"101" & b"00101" & b"0000011";
		wait for 10ns;
		
		inst <= b"1" & x"0000" & b"000" & b"00101" & b"0100011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"001" & b"00101" & b"0100011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"010" & b"00101" & b"0100011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"100" & b"00101" & b"0100011"; --NOP
		wait for 10ns;
		
		inst <= b"1" & x"0000" & b"000" & b"00101" & b"0010011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"010" & b"00101" & b"0010011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"011" & b"00101" & b"0010011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"100" & b"00101" & b"0010011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"111" & b"00101" & b"0010011";
		wait for 10ns;
		inst <= b"1" & x"0000" & b"110" & b"00101" & b"0010011"; 
		wait for 10ns;
		inst <= b"0000000" & x"00"& b"00" & b"001" & b"00101" & b"0010011";
		wait for 10ns;
		inst <= b"0000000" & x"00"& b"00" & b"101" & b"00101" & b"0010011";
		wait for 10ns;
		inst <= b"0100000" & x"00"& b"00" & b"101" & b"00101" & b"0010011";
		wait for 10ns;
		
		inst <= b"0000000" & x"00"& b"00" & b"000" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0100000" & x"00"& b"00" & b"000" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0000000" & x"00"& b"00" & b"001" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0000000" & x"00"& b"00" & b"010" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0000000" & x"00"& b"00" & b"011" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0000000" & x"00"& b"00" & b"100" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0000000" & x"00"& b"00" & b"101" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0100000" & x"00"& b"00" & b"101" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0100000" & x"00"& b"00" & b"110" & b"00101" & b"0110011";
		wait for 10ns;
		inst <= b"0100000" & x"00"& b"00" & b"111" & b"00101" & b"0110011";
		wait for 10ns;
		
		inst <= b"0100000" & x"00"& b"00" & b"000" & b"00101" & b"0001111";
		wait for 10ns;
		inst <= b"0100000" & x"00"& b"00" & b"001" & b"00101" & b"0110011";
		wait for 10ns;
		
		
		
		inst <= b"0000_00000000_00000_000_00000_0001111"; --FENCE
		wait for 10ns;
		inst <= b"00000000000000000001000000001111"; --FENCEI
		wait for 10ns;
		inst <= b"00000000001000000000000000001111"; --NOP
		wait for 10ns;
		
end process;
 
end archi ;
