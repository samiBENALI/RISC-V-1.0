library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library RISCV;
use RISCV.pack_RISCV32I.all;

entity RISCV32I_core is
   generic(
      PC_START_ADDRESS : std_logic_vector(32-1 downto 0)
   );
   port(
      --Controls
      reset       : in std_logic;
      clk         : in std_logic; 
      enable      : in std_logic;
      --Instructions Bus 
      ----Controls
 
      ------Payload
      IAddr       : out std_logic_vector(32-1 downto 2); 
      ----Instruction
     
      ------Payload
      IData       : in  std_logic_vector(32-1 downto 0); 
      --Data Bus
      ----Controls
     
      ------Payload
      DAddr       : out std_logic_vector(32-1 downto 2); 
      DBE         : out std_logic_vector( 4-1 downto 0); 
      DWrite      : out std_logic;
      DRead       : out std_logic;
      DData_out   : out std_logic_vector(32-1 downto 0);
      ----Instruction
     
      ------Payload
      DData_in    : in  std_logic_vector(32-1 downto 0)
      
   );
end entity;

architecture a of RISCV32I_core is

signal PC : std_logic_vector(32-1 downto 0); 
signal NPC : std_logic_vector(32-1 downto 0); 
signal inst : std_logic_vector(32-1 downto 0); 
signal rs1a : std_logic_vector(5-1 downto 0); 
signal rs2a : std_logic_vector(5-1 downto 0);
signal rda : std_logic_vector(5-1 downto 0);
signal immB : std_logic_vector(32-1 downto 0);
signal immj : std_logic_vector(32-1 downto 0);
signal immI : std_logic_vector(32-1 downto 0);
signal immS : std_logic_vector(32-1 downto 0);
signal immU : std_logic_vector(32-1 downto 0);
signal rdd : std_logic_vector(32-1 downto 0);
signal rs1d : std_logic_vector(32-1 downto 0); 
signal rs2d : std_logic_vector(32-1 downto 0);
signal A : std_logic_vector(32-1 downto 0);
signal B : std_logic_vector(32-1 downto 0);
signal C : std_logic_vector(32-1 downto 0);

signal data_out: std_logic_vector(32-1 downto 0);
signal BE : std_logic_vector(4-1 downto 0);
signal data_in: std_logic_vector(32-1 downto 0);
signal data_in1: std_logic_vector(32-1 downto 0);

signal PCrs1d : std_logic_vector(32-1 downto 0);
signal imm4Bji: std_logic_vector(32-1 downto 0);
signal IF_enable :std_logic ;
signal reg_write :std_logic ;
signal data_write :std_logic ;
signal PCrs1d_select: integer range 0 to 1;
signal imm4Bji_select: integer range 0 to 3;
signal A_select : integer range 0 to 1;
signal B_select: integer range 0 to 4;
signal op : toperation ;
signal rdd_select : integer range 0 to 1;

signal calc: std_logic_vector(33-1 downto 0);
signal  result : std_logic_vector(32-1 downto 0);

signal addr : std_logic_vector(32-1 downto 0);
signal decoded_inst : tinstruction;


begin

result <= C ;
addr <= C;
IAddr <= PC(32-1 downto 2);
inst <= IData; 

DAddr <= C(32-1 downto 2); 
DBE <= BE ;
DWrite <=  data_write ;  
DData_out <= data_out ;
 data_in <= DData_in ; 


decoder1 : decoder
  port map(
	inst   => inst,
    rs1a   => rs1a,
    rs2a   => rs2a,
    rda    => rda ,
    immI   => immI,
    immS   => immS,
    immB   => immB,
    immU   => immU,
	immJ   => immJ
	);
	
controller1 : controller
	port map (
	inst => inst,
	  C	=> C,
      decoded_inst  => decoded_inst,
      reg_write     => reg_write,
      PCrs1d_select => PCrs1d_select,
      imm4BJI_select => imm4BJI_select,
      A_select      => A_select,
      B_select      => B_select,
      op            => op,
      data_write    => data_write,
      rdd_select  => rdd_select
	
	
	);

 Regbank1:regbank
  port map(
  
	reset => reset,       
	clk  => clk,
	
    address_out1  => rs1a,
    data_out1     => rs1d,
    address_out2  => rs2a,
    data_out2     => rs2d,
       
    	wr => reg_write, 
	address_in   => rda,
	data_in      => rdd
    
	);
	
ALU1 : ALU
 port map(
    op => op,     
    a  => A,
    b  => B,
    c  =>  C
 );	
 
BE1 : bit_enable
 port map (
	inst => inst,
    address => addr(1 downto 0),
    BE  => BE 
 );
input : input_data_manager 
port map(
	inst => inst,   
	BE => BE  ,
    data_in => data_in,
    
    data_out => data_in1 
	);
output : output_data_manager
	port map(

	inst =>inst,
	data_in => rs2d,
	data_out => data_out
	
);
process(PCrs1d_select,PC,rs1d)
begin
	if PCrs1d_select = 1 then
		PCrs1d(32-1 downto 0) <= rs1d  ;	
	else PCrs1d(32-1 downto 0) <= PC ;
	end if ;
end process;



process(rdd_select,result,data_in1)
begin
	if rdd_select = 0 then
		rdd <= result ;
	else rdd<= data_in1 ;
	end if ;
end process;

process(imm4Bji_select,ImmB,ImmJ,ImmI)
begin	
	
	case imm4Bji_select is
	when 0 => imm4Bji(32-1 downto 0) <=x"00000004";
	when 1 => imm4Bji(32-1 downto 0) <=ImmB ;
	when 2 => imm4Bji(32-1 downto 0) <=ImmJ ;
	when others => imm4Bji(32-1 downto 0) <=ImmI;
	end case;
	
end process;

process(B_select,rs2d,ImmI,ImmS,ImmU)
begin
	case B_select is
	when 1 => B <=x"00000004";
	when 0 => B <=rs2d ;
	when 2 => B <=ImmI ;
	when 3 => B <=ImmS ;
	when others => B <=ImmU;
	end case; 
end process;

process(clk,PC,NPC)
begin
	if( clk'event and clk='1' )  then
		if (reset ='1') then PC <=x"0000_0000" ;
		else if (enable ='1') then PC <= NPC ;
		else PC <= PC ;

		end if ;
		end if ;
	end if ;
end process;

process(A_select,PC,rs1d)
begin
	if A_select = 1 then
		A(32-1 downto 0) <= PC  ;	
	else A(32-1 downto 0) <= rs1d;
	end if ;
end process;
NPC <= std_logic_vector(signed(imm4Bji)+signed(PCrs1d)) ;

end a;