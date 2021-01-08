
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

library RISCV;
use RISCV.pack_RISCV32I.all;


entity tb_regbank is
end entity;

architecture a of tb_regbank is

   --Contrôles
      signal reset        : std_logic;
      signal clk          : std_logic := '0';
      --Ports de lecture
      signal address_out1 : std_logic_vector( 5-1 downto 0);
      signal data_out1    : std_logic_vector(32-1 downto 0);
      signal address_out2 : std_logic_vector( 5-1 downto 0);
      signal data_out2    : std_logic_vector(32-1 downto 0);
      --Port d'écriture
      signal wr           : std_logic;
      signal address_in   : std_logic_vector( 5-1 downto 0);
      signal data_in      : std_logic_vector(32-1 downto 0);



begin


   DUT : regbank
   port map(
	reset => reset,
	clk => clk ,
	address_out1 => address_out1 ,
	data_out1 => data_out1 ,
	address_out2 => address_out2 ,
	data_out2 => data_out2,
	wr => wr ,
	address_in => address_in,
	data_in => data_in      
   );
   
   reset <= '0' ,'1' after  10600 ns;
   clk <= not clk after 50 ns ;
   

 process
	
   begin
      wr  <= '0';
      data_in <= (others=>'U');
      wait for 170 ns;
      --Initialisation
      wr <= '1';
      for i in 0 to (2**5)-1 loop
         address_in <= conv_std_logic_vector(i,5);
         data_in <= conv_std_logic_vector(i,32);
         wait for 100 ns;
      end loop;
      wr <= '0';
      --Attente
      data_in <= (others=>'U');
      wait for 200 ns;
      --Lectures
      for i in 0 to (2**5)-1 loop
         address_out1 <= conv_std_logic_vector(i,5);
	 address_out2 <= conv_std_logic_vector(i,5);
         wait for 100 ns;
      end loop;
      --Attente
      data_in <= (others=>'U');
      wait for 200 ns;
      --Ecritures
      wr <= '1';
      for i in 0 to (2**5)-1 loop
         address_in <= conv_std_logic_vector(i,5);
         data_in <= conv_std_logic_vector((2**5-1)-i,32);
         wait for 100 ns;
      end loop;
      wr <= '0';
      wait;
   end process;
   
end a;