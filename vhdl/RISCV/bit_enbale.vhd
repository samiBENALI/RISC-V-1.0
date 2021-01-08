
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity bit_enable is 
port (
	inst: in std_logic_vector(32-1 downto 0);	
	address: in std_logic_vector(2-1 downto 0);
	BE: out std_logic_vector(4-1 downto 0)
);
end entity ;

architecture a of bit_enable is
   alias funct3   : std_logic_vector(2-1 downto 0) is inst(13 downto 12);
 


begin 
	process (inst , address)
	begin 
	case funct3 is 
		 when b"00" => 
			case address is  
			when b"00" => BE <=b"0001" ;
			when b"01" => BE <=b"0010" ;
			when b"10" => BE <=b"0100" ;
			when others  => BE <=b"1000" ;
	
                        end case;

		 when b"01" => 
			case address is  
			when b"00" => BE <= b"0011" ;
                        when others => 	BE <=  b"1100" ;
                end case;
                 when others =>
			case address is  
			when others => BE <=b"1111" ;
	
                 end case;
			
       end case;
   end process;
   
end a;
