
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library RISCV;



entity tb_input_data_manager is 
end entity; 

architecture a of tb_input_data_manager is
	signal inst : std_logic_vector(32-1 downto 0);	
	signal BE :  std_logic_vector(4-1 downto 0);	
	signal data_in :  std_logic_vector(32-1 downto 0);
	signal data_out : std_logic_vector(32-1 downto 0);

component input_data_manager
	port(
	inst : in std_logic_vector(32-1 downto 0);
	BE : in std_logic_vector(4-1 downto 0);
	data_in : in std_logic_vector(32-1 downto 0);
	data_out : out std_logic_vector(32-1 downto 0)
	
);
end component ;

begin 
  DUT : input_data_manager
port map (
	inst =>inst,
	BE => BE,
	data_in => data_in,
	data_out => data_out
);

   process 
   begin
	
	
	data_in <= x"11110000";
	inst <= x"00042483"; BE <= b"1111" ; wait for 100 ns; --lw x9 0(x8)
	
	inst <= x"00241483";BE <= b"0011" ;  wait for 100 ns; --lh x9 2(x8)
	inst <= x"00c50583"; BE <= b"0100" ;wait for 100 ns; --lb x11 12(x10)
	inst <= x"00c54583"; BE <= b"0100" ;wait for 100 ns; --lbu x11 12(x10)
	inst <= x"00245483"; BE<= b"0011"; wait for 100 ns; --lhu x11 12(x10)
end process ;
end a;
