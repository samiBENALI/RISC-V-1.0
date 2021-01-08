
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library RISCV;
use RISCV.pack_RISCV32I.all;

entity controller is
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
end entity;

architecture a of controller is

   alias opcode   : std_logic_vector(7-1 downto 0) is inst( 6 downto  0);
   alias funct3   : std_logic_vector(3-1 downto 0) is inst(14 downto 12);
   alias funct7   : std_logic_vector(7-1 downto 0) is inst(31 downto 25);
   signal sig : std_logic_vector (23 downto 0);

begin
   process(inst,C(0))

	type tcontrols is record
         reg_write      : std_logic;
         PCrs1d_select  : integer range 0 to 1;
         imm4BJI_select : integer range 0 to 3;
         A_select       : integer range 0 to 1;
         B_select       : integer range 0 to 4;
         op             : toperation;
         data_write     : std_logic;
         rdd_select     : integer range 0 to 1;

      end record;

      variable controls : tcontrols;
   begin
   
   sig <= inst (31 downto 28) & inst (19 downto 15) & funct3 & inst (11 downto 7) & opcode;
      case opcode is
           when b"00_000_11" => 
                case funct3 is
				
                     when b"000" =>  decoded_inst <= INST_LB; controls := ('1',0,0,0,2,OP_ADD,'0',1);
											
					 
					 when b"001" => decoded_inst <= INST_LH; controls := ('1',0,0,0,2,OP_ADD,'0',1);
					 
					 when b"010" => decoded_inst <= INST_LW; controls := ('1',0,0,0,2,OP_ADD,'0',1);
					 
					 when b"100" => decoded_inst <= INST_LBU; controls := ('1',0,0,0,2,OP_ADD,'0',1);
					 
					 when b"101" => decoded_inst <= INST_LHU; controls := ('1',0,0,0,2,OP_ADD,'0',1);
					 
					 
					 when others => decoded_inst <= INST_NOP; controls := ('0',0,0,0,0,OP_ADD,'0',0); -- à revoir
					 
					 
				end case;					 
					 
			when b"01_000_11" => 
                case funct3 is
				
                     when b"000" =>  decoded_inst <= INST_SB; controls := ('0',0,0,0,3,OP_ADD,'1',0);
					 
					 when b"001" => decoded_inst <= INST_SH; controls := ('0',0,0,0,3,OP_ADD,'1',0);
					 
					 when b"010" => decoded_inst <= INST_SW; controls := ('0',0,0,0,3,OP_ADD,'1',0);
					 
					 when others  => decoded_inst <= INST_NOP; controls := ('0',0,0,0,0,OP_ADD,'0',0); -- à revoir 
					 
				end case;	 
					 
			when b"00_100_11" => 
                case funct3 is
				
                     when b"000" =>  decoded_inst <= INST_ADDI; controls := ('1',0,0,0,2,OP_ADD,'0',0);
															  
					 when b"010" => decoded_inst <= INST_SLTI; controls := ('1',0,0,0,2,OP_SLT,'0',0);
															  
					 when b"011" => decoded_inst <= INST_SLTIU;controls :=  ('1',0,0,0,2,OP_SLTU,'0',0);
															   
					 when b"100" => decoded_inst <= INST_XORI; controls := ('1',0,0,0,2,OP_XOR,'0',0);
															  
					 when b"110" =>  decoded_inst <= INST_ORI; controls := ('1',0,0,0,2,OP_OR,'0',0);
															  
					 when b"111" => decoded_inst <= INST_ANDI;controls := ('1',0,0,0,2,OP_AND,'0',0);
					 
					
					  when b"001" =>
					  
					  
					  
								case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_SLLI; controls := ('1',0,0,0,2,OP_SLL,'0',0);
							
							
					 
									when others  =>decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0); -- à revoir 
								end case;
					  
					
					 when b"101"  =>
					 
								case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_SRLI; controls := ('1',0,0,0,2,OP_SRL,'0',0);
							
									when b"0100000" => decoded_inst <= INST_SRAI; controls := ('1',0,0,0,2,OP_SRA,'0',0);
					 
									when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
								end case;
								
								
					when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);			
				end case;	 
					
			when b"01_100_11" => 
                case funct3 is
				
                     when b"000" => 
					 
						case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_ADD;controls := ('1',0,0,0,0,OP_ADD,'0',0);
							
									when b"0100000" => decoded_inst <= INST_SUB;controls := ('1',0,0,0,0,OP_SUB,'0',0);
					 
									when others  => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);		
								end case;
					 
					 
					 
					
					  when b"001" =>
								case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_SLL;controls := ('1',0,0,0,0,OP_SLL,'0',0);
							
							
					 
									when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
								end case;
					  
					
					 when b"010"  =>
					 
								case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_SLT;controls := ('1',0,0,0,0,OP_SLT,'0',0);
							
									
					 
									when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
								end case;
								
								
					when b"011"  =>
					 
								case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_SLTU;controls :=  ('1',0,0,0,0,OP_SLTU,'0',0);
							
									
									
									when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
								end case;
								
					when b"100"  =>
					 
								case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_XOR;controls := ('1',0,0,0,0,OP_XOR,'0',0);
							
									
					 
									when others  => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
								end case;
					 

					when b"101"  =>
					 
								case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_SRL;controls := ('1',0,0,0,0,OP_SRL,'0',0);
							
									
									when b"0100000" => decoded_inst <= INST_SRA;controls := ('1',0,0,0,0,OP_SRA,'0',0);
									when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
								end case;		
					 		 					 		

					when b"110" => 

							case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_OR;controls := ('1',0,0,0,0,OP_OR,'0',0);
							
								
									when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
								end case;	
								
					when b"111" => 

							case funct7 is    
					 
									when b"0000000" => decoded_inst <= INST_AND;controls := ('1',0,0,0,0,OP_AND,'0',0);
							
								
									when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
								end case;				
								
							
					when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
				end case;	 
					 
				

			
			
			
			when b"11_000_11" => 
                case funct3 is
				
                     when b"000" => decoded_inst <= INST_BEQ;controls := ('0',0,to_integer(unsigned(c(0 downto 0))),0,0,OP_EQ,'0',0);
					 
					 when b"001" => decoded_inst <= INST_BNE;controls := ('0',0,to_integer(unsigned(c(0 downto 0))),0,0,OP_EQ,'0',0);
					 
					 
					 when b"100" => decoded_inst <= INST_BLT;controls := ('0',0,to_integer(unsigned(c(0 downto 0))),0,0,OP_SLT,'0',0);
					 
					 when b"101" => decoded_inst <= INST_BGE;controls := ('0',0,to_integer(unsigned(c(0 downto 0))),0,0,OP_SGE,'0',0);
					 
					 when b"110" => decoded_inst <= INST_BLTU;controls := ('0',0,to_integer(unsigned(c(0 downto 0))),0,0,OP_SLTU,'0',0);
					 
					 when b"111" => decoded_inst <= INST_BGEU;controls := ('0',0,to_integer(unsigned(c(0 downto 0))),0,0,OP_SGEU,'0',0);
					  			
					when others => decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
				end case;		
			
			when b"11_001_11" => decoded_inst <= INST_JALR;controls := ('1',1,3,1,1,OP_ADD,'1',0);
			
			when b"11_011_11" => decoded_inst <= INST_JAL;controls := ('1',0,2,1,1,OP_ADD,'1',0);
			
			when b"00_101_11" => decoded_inst <= INST_AUIPC;controls := ('1',0,0,1,4,OP_ADD,'0',0);
			
			when b"01_101_11" => decoded_inst <= INST_LUI;controls := ('1',0,0,0,4,OP_PASSB,'0',0);
			
			
			
			
			when  b"0001111" =>
			                           if  inst = x"0000100F" then decoded_inst <= INST_FENCEI;controls := ('0',0,0,0,0,OP_ADD,'0',0);
				                      else if sig = b"0000_00000_000_00000_0001111" then decoded_inst <= INST_FENCE;controls := ('0',0,0,0,0,OP_ADD,'0',0);
				
				                      else decoded_inst <= INST_NOP;controls := ('0',0,0,0,0,OP_ADD,'0',0);
			                          end if;
			                          end if;
			
			when others => decoded_inst <= INST_NOP; controls := ('0',0,0,0,0,OP_ADD,'0',0);
			
			end case;
     
	reg_write      <= controls.reg_write      ;
	PCrs1d_select  <= controls.PCrs1d_select  ;
	imm4BJI_select <= controls.imm4BJI_select ;
	A_select       <= controls.A_select       ;
	B_select       <= controls.B_select       ;
	op             <= controls.op             ;
	data_write     <= controls.data_write     ;
	rdd_select     <= controls.rdd_select     ;
	 
	 
	 
	 
	 
	 
	 
	 
			
   end process;
   
end a;
