library ieee;
use ieee.std_logic_1164.all;

package pack_system is

   component ROM_1ko_256x32
      port(
         address : in  std_logic_vector(10-1 downto 2);
         data    : out std_logic_vector(32-1 downto 0)
      );
   end component;
                        
   component RAM_1ko_256x32
      port(
         clk      : in  std_logic;
         RnW      : in  std_logic;
         address  : in  std_logic_vector(10-1 downto 2);
         BE       : in  std_logic_vector( 4-1 downto 0);
         data_in  : in  std_logic_vector(32-1 downto 0);
         data_out : out std_logic_vector(32-1 downto 0)
      );
   end component;

   component system
      generic(
         --RISCV
         PROG_ENTRY_POINT_ADDRESS : std_logic_vector(32-1 downto 0);
         PROG_EXIT_POINT_ADDRESS  : std_logic_vector(32-1 downto 0);
         --Data bus       
         ----D0       
         D0_START : std_logic_vector(32-1 downto 0);
         D0_END   : std_logic_vector(32-1 downto 0);
         ----D1   
         D1_START : std_logic_vector(32-1 downto 0);
         D1_END   : std_logic_vector(32-1 downto 0)
      );
      port(
         reset       : in std_logic;
         clk         : in std_logic; 
         enable      : in std_logic
      );
   end component;

end package;
