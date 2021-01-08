library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library RISCV;


entity tb_output_data_manager is 
end entity; 

architecture a of tb_output_data_manager is
	signal inst : std_logic_vector(32-1 downto 0);	
	signal data_in :  std_logic_vector(32-1 downto 0);
	signal data_out : std_logic_vector(32-1 downto 0);
component output_data_manager
	port(
	inst : in std_logic_vector(32-1 downto 0);
	data_in : in std_logic_vector(32-1 downto 0);
	data_out : out std_logic_vector(32-1 downto 0)
	
);
end component ;
begin 
  DUT : output_data_manager

port map (
	inst =>inst,
	data_in => data_in,
	data_out => data_out
);

   process
    begin
	data_in <= x"11110000";
	inst <= x"01042023";
	wait for 100 ns; --sw x16 0(x8)
	inst <= x"01041023";
	wait for 100 ns; --sh x16 0(x8)
	inst <= x"01040023";
	wait for 100 ns; --sb x16 0(x8)
	

    end process;
end a; 

