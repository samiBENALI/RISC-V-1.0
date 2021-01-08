
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



library RISCV;
use RISCV.pack_RISCV32I.all;

entity tb_alu is 
end tb_alu;

architecture archi of tb_alu is 
	 signal op    : toperation;
         signal a     : std_logic_vector(32-1 downto 0);
         signal b     : std_logic_vector(32-1 downto 0);
         signal c     : std_logic_vector(32-1 downto 0);
COMPONENT ALU
	port(
      op    : in  toperation;
      a     : in  std_logic_vector(32-1 downto 0);
      b     : in  std_logic_vector(32-1 downto 0);
      c     : out std_logic_vector(32-1 downto 0)
	);
end COMPONENT ;
begin 
	uut:ALU
	port map(
		op => op,
		a => a,
		b => b,
		c => c
	);
  process   
     begin               
        op <= OP_ADD ; 
			a <= x"00000001";
			 b <= x"00000001" ;
			wait for 10ns;
                       a <= x"80000001"; 
			b <= x"80000001" ;
			wait for 10ns;
                     
      	op <= OP_SUB ; 
			a <= x"00000001"; 
			b <=x"00000001" ;
			wait for 10ns;
                       a <= x"80000001";
			 b <=x"80000001" ;
			wait for 10ns;

    	op <= OP_AND ; 
			a <= x"00000011";
			 b <=x"00000011" ;
			wait for 10ns;
                        a <=  x"80000011"; 
			b <=x"80000011" ;
			wait for 10ns;

	op <= OP_OR  ; 
			a <= x"00000011"; 
			b <=x"00000011" ;
			wait for 10ns;
                       a <=  x"80000011"; 
			b <=x"80000011" ;
			wait for 10ns;

	op <= OP_XOR ; 
			a <= x"00000011"; 
			b <=x"00000011" ;
			wait for 10ns;
                       a <=  x"00000101"; 
			b <=x"00000101" ;
			wait for 10ns;

	op <= OP_EQ  ; 
			a <= x"00000001";
			 b <=x"00000001" ;
			wait for 10ns;
                        a <=  x"80000001";
			 b <=x"00000001" ;
			wait for 10ns;

	op <= OP_NEQ ;
			 a <= x"00000001";
			 b <=x"00000001" ;
			wait for 10ns;
                       a <=  x"80000001";
			 b <=x"00000001" ;
			wait for 10ns;

 	op <= OP_SLT ; 
			a <= x"00000001";
			 b <=x"00000011" ;
			wait for 10ns;
                       a <= x"80000011";
			 b <=x"80000001" ;
			wait for 10ns;

      	op <= OP_SLTU ;
			 a <= x"00000001";
			 b <=x"00000011" ;
			wait for 10ns;
                       a <=  x"80000001";
			 b <=x"00000001" ;
			wait for 10ns;

     	op <= OP_SGE ; 
			a <= x"00000011";
			 b <=x"00000001" ;
			wait for 10ns;
                       a <= x"80000011";
			 b <=x"80000001" ;
			wait for 10ns;

     	 op <= OP_SGEU ;
			 a <= x"00000011";
			 b <=x"00000001" ;
			wait for 10ns;
                         a <= x"80000011";
			 b<=x"80000001" ;
			wait for 10ns;

      op <= OP_SLL ; 
			a <= x"00000001";
			 b <=x"00000001" ;
			wait for 10ns;
                     a <=  x"80000001";
			 b <=x"00000011" ;
			wait for 10ns;

      op <= OP_SRL ; 
			a<= x"00000100";
			 b <=x"00000011" ;
			wait for 10ns;
                     a <=  x"80000010";
			 b <=x"00000001" ;
			wait for 10ns;

      op <= OP_SRA ; 
			a <= x"80001100";
			 b <=x"00000001" ;
			wait for 10ns;
                     a <= x"80001100";
			 b <=x"00000011" ;
			wait for 10ns;

      op <= OP_PASSA ; 
			 a <= x"80001100";
			 b <=x"80000001" ;
			wait for 10ns;
                        a <=  x"80000001";
			 b <=x"00000011" ;
			wait for 10ns;

      op <= OP_PASSB ; 
			a <= x"80001100";
			 b <=x"80000001" ;
			wait for 10ns;
                       a <=  x"80000001"; 
			b <=x"00000011" ;wait;	
end process;
 
end archi ;

