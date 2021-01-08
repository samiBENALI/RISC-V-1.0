


library ieee;
use ieee.std_logic_1164.all;

entity output_data_manager is
   port(
      inst : in  std_logic_vector(32-1 downto 0);
	  data_in : in  std_logic_vector(32-1 downto 0);
	  data_out : out  std_logic_vector(32-1 downto 0)
		
   );
end entity;

architecture a of output_data_manager is

	
    signal funct3   : std_logic_vector(2-1 downto 0)  ;
	signal temp  :std_logic_vector(32-1 downto 0); 

   signal sig8 : std_logic_vector (7 downto 0);
 signal sig16 : std_logic_vector (15 downto 0);
   
   
begin
	funct3 <= inst(13 downto 12) ;
process(inst,data_in,funct3)
begin	
                case funct3 is
				
				
				when b"00" =>  sig8 <= data_in( 7 downto 0) ;

					temp <= data_in(7 downto 0) & data_in(7 downto 0) &data_in(7 downto 0)& data_in(7 downto 0) ;
				
				when b"01" =>  sig16 <= data_in( 15 downto 0) ;
					temp <= data_in(15 downto 0) & data_in(15 downto 0)  ;
					
				when others => temp <= data_in ;
				
					 
				end case;			

         
			 
					


end process; 	

data_out <= temp ; 
	
end a;