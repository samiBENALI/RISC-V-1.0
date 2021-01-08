
library ieee;
use ieee.std_logic_1164.all;

package pack_RISCV32I is

   type toperation is(
      OP_ADD  , OP_SUB ,
      OP_AND  , OP_OR  , OP_XOR,
      OP_EQ   , OP_NEQ,
      OP_SLT  , OP_SLTU,
      OP_SGE  , OP_SGEU,
      OP_SLL  , OP_SRL , OP_SRA,
      OP_PASSA, OP_PASSB
   );

 
   
   
   type tinstruction is (
INST_LB, INST_LH,INST_LW,INST_LBU,INST_LHU,
INST_NOP,INST_ADD,INST_SUB, INST_SLL,INST_SLT,
 INST_SLTU,INST_XOR,INST_SRL,INST_SRA,INST_OR,INST_JALR,INST_JAL, INST_AUIPC, 
INST_LUI,INST_BEQ,INST_BNE,INST_BLT,INST_BGE,INST_BLTU,INST_BGEU,
INST_SB,INST_SH,INST_SW,INST_ADDI,INST_SLTI,INST_SLTIU,INST_XORI,INST_ORI,
INST_ANDI,INST_SLLI,INST_SRLI,INST_SRAI,INST_FENCE,INST_FENCEI,INST_AND);

   COMPONENT regbank 
port(
       --Contr�les
      reset        : in  std_logic;
      clk          : in  std_logic;
      --Ports de lecture
      address_out1 : in  std_logic_vector( 5-1 downto 0);
      data_out1    : out std_logic_vector(32-1 downto 0);
      address_out2 : in  std_logic_vector( 5-1 downto 0);
      data_out2    : out std_logic_vector(32-1 downto 0);
      --Port d'�criture
      wr           : in  std_logic;
      address_in   : in  std_logic_vector( 5-1 downto 0);
      data_in      : in  std_logic_vector(32-1 downto 0)
   );
end Component ;

component bit_enable
	port(
	inst : in std_logic_vector(32-1 downto 0);
	address : in std_logic_vector(2-1 downto 0);
	BE : out std_logic_vector(4-1 downto 0)
);
end component ;

COMPONENT controller
	port(
      inst          : in  std_logic_vector(32-1 downto 0);
	  C			 : in  std_logic_vector(32-1 downto 0);
      decoded_inst  : out tinstruction;
      reg_write     : out std_logic;
      PCrs1d_select : out integer range 0 to 1;
      imm4BJI_select: out integer range 0 to 3;
      A_select      : out integer range 0 to 1;
      B_select      : out integer range 0 to 4;
      op            : out toperation;
      data_write    : out std_logic;
      rdd_select    : out integer range 0 to 1
	);
	
end COMPONENT ;
COMPONENT decoder
	port(
      inst : in  std_logic_vector(32-1 downto 0);
      rs1a : out std_logic_vector( 5-1 downto 0);
      rs2a : out std_logic_vector( 5-1 downto 0);
      rda  : out std_logic_vector( 5-1 downto 0);
      immI : out std_logic_vector(32-1 downto 0);
      immS : out std_logic_vector(32-1 downto 0);
      immB : out std_logic_vector(32-1 downto 0);
      immU : out std_logic_vector(32-1 downto 0);
      immJ : out std_logic_vector(32-1 downto 0)
	);
end COMPONENT ;
component input_data_manager
	port(
	inst : in std_logic_vector(32-1 downto 0);
	BE : in std_logic_vector(4-1 downto 0);
	data_in : in std_logic_vector(32-1 downto 0);
	data_out : out std_logic_vector(32-1 downto 0)
	
);
end component ;
component output_data_manager
	port(
	inst : in std_logic_vector(32-1 downto 0);
	data_in : in std_logic_vector(32-1 downto 0);
	data_out : out std_logic_vector(32-1 downto 0)
	
);
end component ;

COMPONENT ALU
	port(
      op    : in  toperation;
      a     : in  std_logic_vector(32-1 downto 0);
      b     : in  std_logic_vector(32-1 downto 0);
      c     : out std_logic_vector(32-1 downto 0)
	);
end COMPONENT ;


component RISCV32I_core 
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
end component;

end package;
