



library ieee;
use ieee.std_logic_1164.all;

entity input_data_manager is
   port(
      inst : in  std_logic_vector(32-1 downto 0);
	  BE : in   std_logic_vector(4-1 downto 0);
	  data_in : in  std_logic_vector(32-1 downto 0);
	  
	  
	  data_out : out  std_logic_vector(32-1 downto 0)
		
   );
end entity;

architecture a of input_data_manager is

	
  alias funct3   : std_logic_vector(3-1 downto 0) is inst(14 downto 12);
 

   
   
begin


	


				
				
process(funct3,BE,data_in)
   begin
      case (funct3) is
         when "000"  => --LB
                        case (BE) is
                           when "0001" => data_out(31 downto  8) <= (others=>data_in( 7)); 
													data_out( 7 downto  0) <= data_in( 7 downto  0);
													
							when b"0010" => data_out(7 downto 0) <= data_in ( 15 downto 8);
											data_out (31 downto 8) <= (others => data_in(31)) ;
							when b"0100" => data_out(7 downto 0) <= data_in ( 23 downto 16);
											data_out (31 downto 8) <= (others => data_in(31)) ;
							when others => data_out(7 downto 0) <= data_in ( 31 downto 24);
											data_out (31 downto 8) <= (others => data_in(31)) ;
											
											
						end case;

						
													
						
		when "001" =>  --LH
                        case (BE) is
                           when "0011" => data_out(31 downto  16) <= ( others => data_in(15)); 
													data_out( 15 downto  0) <= data_in( 15 downto  0);
													
							
							when others => data_out(31 downto 16) <= ( others => data_in (31)); 
											data_out (15 downto 0) <= ( data_in ( 31 downto 16) ) ; --quoi metre içi ?
											
											
									
											
						end case;
						
						
		when "010" =>  --LW
                       
						data_out <= data_in;
						
						
		when "100" =>  --LBU
					case (BE) is
                           when "0001" => data_out(31 downto  8) <= (others=>funct3(0));  -- les bits de signe deviennet des 1 tjrs ??
													data_out( 7 downto  0) <= data_in( 7 downto  0);
													
							when b"0010" => data_out(7 downto 0) <= data_in ( 15 downto 8);
											data_out (31 downto 8) <= (others => funct3(0)) ;
							when b"0100" => data_out(7 downto 0) <= data_in ( 23 downto 16);
											data_out (31 downto 8) <= (others => funct3(0)) ;
							when others => data_out(7 downto 0) <= data_in ( 31 downto 24);
											data_out (31 downto 8) <= (others => funct3(0)) ;
											
											
						end case;
                        
						
						
		when others =>  --LHU
                        case (BE) is
                           when "0011" => data_out(31 downto  16) <= (others=>BE(2)); 
													data_out( 15 downto  0) <= data_in( 15 downto  0);
													
							
							when others => data_out(31 downto 16) <= data_in ( 15 downto 0); 
											data_out (15 downto 0) <= (others => BE(2)) ; --quoi metre içi ?
											
											
									
											
						end case;				
										
		
	 
		end case;			


end process; 	
	
end a;