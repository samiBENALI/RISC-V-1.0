
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RegBank is
   port(
       --Contrôles
      reset        : in  std_logic;
      clk          : in  std_logic;
      --Ports de lecture
      address_out1 : in  std_logic_vector( 5-1 downto 0);
      data_out1    : out std_logic_vector(32-1 downto 0);
      address_out2 : in  std_logic_vector( 5-1 downto 0);
      data_out2    : out std_logic_vector(32-1 downto 0);
      --Port d'écriture
      wr           : in  std_logic;
      address_in   : in  std_logic_vector( 5-1 downto 0);
      data_in      : in  std_logic_vector(32-1 downto 0)
   );
end entity;

architecture a of RegBank is
    
   type ttab is array (0 to (2**5)-1) of std_logic_vector(32-1 downto 0);
    
   signal tab : ttab;
begin
   process(reset,clk)
	begin
		if(reset='1') then 
			for i in 0 to (2**5)-1 loop
				tab(i) <= (others =>'0') ;
			end loop ;
		else if (clk'event and clk='1')
			then if(wr='1') then
				tab(CONV_INTEGER(address_in))<= data_in ;
			end if ;
		else tab(CONV_INTEGER(address_in))<= tab(CONV_INTEGER(address_in));
		end if;
		end if ; 
		
   end process ;   
		data_out1 <= (others =>'0') when (address_out1 = b"00000") else tab(CONV_INTEGER(address_out1));
		data_out2 <= (others =>'0') when (address_out1 = b"00000") else tab(CONV_INTEGER(address_out2));
		
      
end a;
