
library ieee;
use  ieee.std_logic_1164.all;

--use ieee.std_logic_unsigned.all;

--use ieee.std_logic_signed.all;

use ieee.numeric_std.all;

library RISCV;
use RISCV.pack_RISCV32I.all;

entity ALU is
	port(
      op    : in  toperation;
      a     : in  std_logic_vector(32-1 downto 0);
      b     : in  std_logic_vector(32-1 downto 0);
      c     : out std_logic_vector(32-1 downto 0)
	);
end entity;

architecture archi of ALU is

begin

process(a,b,op)
begin
   case op is
      when OP_ADD => c <= std_logic_vector(signed(a)+signed(b));
      when OP_SUB => c <= std_logic_vector(signed(a)-signed(b));
     when OP_AND  => c <=  std_logic_vector(a and b);
	when OP_OR  => c <= std_logic_vector(a or b);
when OP_XOR => c <= std_logic_vector(a xor b);
when OP_EQ   => if ( signed(a)=signed(b)) then c <= x"00000001";
		else c <= x"00000000";
		end if;
when OP_NEQ => if (signed(a)=signed(b)) then c <= x"00000000";
		else c <= x"00000001";
		end if;
 when OP_SLT => if (signed(a) < signed(b)) then c <= x"00000001";
		     else c <=x"00000000";
end if;
      when OP_SLTU => if (unsigned(a) < unsigned(b)) then c <= x"00000001";
		     else c <= x"00000000";
end if;
      when OP_SGE => if (signed(a) >= signed(b)) then c <= x"00000001";
		     else c <=x"00000000";
end if;
      when OP_SGEU => if (unsigned(a) >= unsigned(b)) then c <= x"00000001";
		     else c <= x"00000000";
end if;
      when OP_SLL => c <=  std_logic_vector ( shift_left( unsigned(a) , to_integer(unsigned(b(4 downto 0)))));
      when OP_SRL => c <= std_logic_vector ( shift_right( unsigned(a) , to_integer(unsigned(b(4 downto 0)))));
      when OP_SRA => c <= std_logic_vector ( shift_right( signed(a) , to_integer(signed(b(4 downto 0)))));
      when OP_PASSA => c <= a;
      when OP_PASSB => c <= b;

   
   end case;
end process;

end archi;