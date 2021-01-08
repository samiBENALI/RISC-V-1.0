
library ieee;
use ieee.std_logic_1164.all;

entity decoder is
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
end entity;

architecture a of decoder is

   signal sign31_11 : std_logic_vector(20 downto 0);
   
   
   
begin
	sign31_11 <= (others => inst (31));
        rs1a <= inst ( 19 downto 15);
	rs2a <= inst (24 downto 20);
	rda <= inst (11 downto 7);
	immI <= sign31_11 & inst (30 downto 20) ;
	immS <= sign31_11 & inst(30 downto 25) & inst (11 downto 8)& inst(7)  ;
	immB <=  sign31_11( 20 downto 1) & inst (7) & inst ( 30 downto 25) & inst (11 downto 8) &'0';
	immU <= inst (31 downto 12) & x"000" ;
	immJ <= sign31_11(12 downto 1) & inst (19 downto 12) & inst (20)& inst (30 downto 21)&'0'    ;
	
	

end a;