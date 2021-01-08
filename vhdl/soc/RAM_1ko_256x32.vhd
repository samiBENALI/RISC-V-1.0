library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_1ko_256x32 is
   port(
      clk      : in  std_logic;
      RnW      : in  std_logic;
      address  : in  std_logic_vector(10-1 downto 2);
      BE       : in  std_logic_vector( 4-1 downto 0);
      data_in  : in  std_logic_vector(32-1 downto 0);
      data_out : out std_logic_vector(32-1 downto 0)
   );
end entity;

architecture a of RAM_1ko_256x32 is
    
   type ttab is array (0 to 2**8-1) of std_logic_vector(32-1 downto 0);
    
   signal tab : ttab;
   
begin   
   
   process(clk)
   begin
      tab <= tab;
      if (clk'event and clk='1')
         then if (RnW='0')
                 then if (BE(0)='1') then tab(to_integer(unsigned(address(10-1 downto 2))))( 7 downto  0) <= data_in( 7 downto  0); end if;
                      if (BE(1)='1') then tab(to_integer(unsigned(address(10-1 downto 2))))(15 downto  8) <= data_in(15 downto  8); end if;
                      if (BE(2)='1') then tab(to_integer(unsigned(address(10-1 downto 2))))(23 downto 16) <= data_in(23 downto 16); end if;
                      if (BE(3)='1') then tab(to_integer(unsigned(address(10-1 downto 2))))(31 downto 24) <= data_in(31 downto 24); end if;
              end if;
      end if;
   end process;
   
   data_out <= tab(to_integer(unsigned(address)));
      
end a;