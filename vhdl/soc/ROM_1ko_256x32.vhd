library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_1ko_256x32 is
   port(
      address : in  std_logic_vector(10-1 downto 2);
      data    : out std_logic_vector(32-1 downto 0)
	 
   );
end entity;

architecture a of ROM_1ko_256x32 is
    
   type ttab is array (0 to 2**8-1) of std_logic_vector(32-1 downto 0);
    
   signal tab : ttab;
   

begin   
    
   data <= tab(to_integer(unsigned(address)));    
   
end a;