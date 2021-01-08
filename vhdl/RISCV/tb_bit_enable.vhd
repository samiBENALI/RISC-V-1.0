library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;



entity tb_bit_enable is 
end entity; 

architecture a of tb_bit_enable is
	signal inst : std_logic_vector(32-1 downto 0);
	signal address : std_logic_vector(2-1 downto 0);
	signal BE : std_logic_vector(4-1 downto 0);

component bit_enable
	port(
	inst : in std_logic_vector(32-1 downto 0);
	address : in std_logic_vector(2-1 downto 0);
	BE : out std_logic_vector(4-1 downto 0)
);
end component ;
	 
begin 
  DUT : bit_enable
port map (
	inst =>inst,
	address => address,
	BE => BE
);

   process
    begin
	inst <= x"00042483";
	address <= b"11"; wait for 100 ns; --lw x9 0(x8)
	inst <= x"00241483"; 
	address <= b"10" ;wait for 100 ns; --lh x9 2(x8)
	inst <= x"00c50583"; 
	address <= b"11" ;wait for 100 ns; --lb x11 12(x10)
	inst <= x"00c54583"; 
	address <= b"10" ;wait for 100 ns; --lbu x11 12(x10)
	inst <= x"00245483"; 
	address <= b"00" ;wait for 100 ns; --lhu x11 12(x10)
	inst <= x"01042023"; 
	address <= b"11" ;wait for 100 ns; --sw x16 0(x8)
	inst <= x"01041023"; 
	address <= b"00" ;wait for 100 ns; --sh x16 0(x8)
	inst <= x"01040023"; 
	address <= b"00" ;wait for 100 ns; --sb x16 0(x8)

  end process;
end a;

