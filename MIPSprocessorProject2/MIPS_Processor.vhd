-------------------------------------------------------------------------
-- Henry Duwe
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
-- MIPS_Processor.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a skeleton of a MIPS_Processor  
-- implementation.

-- 01/29/2019 by H3::Design created.
-------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MIPS_Processor IS
  GENERIC (N : INTEGER := 32);
  PORT (
    iCLK : IN std_logic;
    iRST : IN std_logic;
    iInstLd : IN std_logic;
    iInstAddr : IN std_logic_vector(N - 1 DOWNTO 0);
    iInstExt : IN std_logic_vector(N - 1 DOWNTO 0);
    oALUOut : OUT std_logic_vector(N - 1 DOWNTO 0)); -- TODO: Hook this up to the output of the ALU. It is important for synthesis that you have this output that can effectively be impacted by all other components so they are not optimized away.

END MIPS_Processor;
ARCHITECTURE structure OF MIPS_Processor IS

  -- Required data memory signals
  SIGNAL s_DMemWr : std_logic; -- TODO: use this signal as the final active high data memory write enable signal
  SIGNAL s_DMemAddr : std_logic_vector(N - 1 DOWNTO 0); -- TODO: use this signal as the final data memory address input
  SIGNAL s_DMemData : std_logic_vector(N - 1 DOWNTO 0); -- TODO: use this signal as the final data memory data input
  SIGNAL s_DMemOut : std_logic_vector(N - 1 DOWNTO 0); -- TODO: use this signal as the data memory output

  -- Required register file signals 
  SIGNAL s_RegWr : std_logic; -- TODO: use this signal as the final active high write enable input to the register file
  SIGNAL s_RegWrAddr : std_logic_vector(4 DOWNTO 0); -- TODO: use this signal as the final destination register address input
  SIGNAL s_RegWrData : std_logic_vector(N - 1 DOWNTO 0); -- TODO: use this signal as the final data memory data input

  -- Required instruction memory signals
  SIGNAL s_IMemAddr : std_logic_vector(N - 1 DOWNTO 0); -- Do not assign this signal, assign to s_NextInstAddr instead
  SIGNAL s_NextInstAddr : std_logic_vector(N - 1 DOWNTO 0); -- TODO: use this signal as your intended final instruction memory address input.
  SIGNAL s_Inst : std_logic_vector(N - 1 DOWNTO 0); -- TODO: use this signal as the instruction signal 

  -- Required halt signal -- for simulation
  SIGNAL s_Halt : std_logic; -- TODO: this signal indicates to the simulation that intended program execution has completed. (Opcode: 01 0100)

  -- Required overflow signal -- for overflow exception detection
  SIGNAL s_Ovfl : std_logic; -- TODO: this signal indicates an overflow exception would have been initiated

  COMPONENT mem IS
    GENERIC (
      ADDR_WIDTH : INTEGER;
      DATA_WIDTH : INTEGER);
    PORT (
      clk : IN std_logic;
      addr : IN std_logic_vector((ADDR_WIDTH - 1) DOWNTO 0);
      data : IN std_logic_vector((DATA_WIDTH - 1) DOWNTO 0);
      we : IN std_logic := '1';
      q : OUT std_logic_vector((DATA_WIDTH - 1) DOWNTO 0));
  END COMPONENT;

  -- TODO: You may add any additional signals or components your implementation 
  --       requires below this comment

  -- signals -----------------------------------------------------------

  ----------------------IF----------------------
  SIGNAL s_IF_oPC : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_IF_nextPC : std_logic_vector(31 DOWNTO 0);

  ----------------------ID----------------------
  SIGNAL s_ID_Inst : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_ID_NextInstAddr : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_ID_Signed : std_logic;
  SIGNAL s_ID_MemtoReg : std_logic;
  SIGNAL s_ID_ImmEn : std_logic;
  SIGNAL s_ID_ALUOp : std_logic_vector(5 DOWNTO 0);
  SIGNAL s_ID_MemWrite : std_logic;
  SIGNAL s_ID_DestReg : std_logic;
  SIGNAL s_ID_Jump : std_logic;
  SIGNAL s_ID_Branch : std_logic;
  SIGNAL s_ID_Equality : std_logic;
  SIGNAL s_ID_BandEq : std_logic;
  SIGNAL s_ID_JR : std_logic;
  SIGNAL s_ID_JAL : std_logic;
  SIGNAL s_ID_Rs : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_ID_Rt : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_ID_SEout : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_Adder0 : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_ID_Mux0 : std_logic_vector(31 DOWNTO 0);


  ----------------------EX----------------------
  SIGNAL s_EX_MemtoReg : std_logic;
  SIGNAL s_EX_ALUOp : std_logic_vector(5 DOWNTO 0);
  SIGNAL s_EX_MemWrite : std_logic;
  SIGNAL s_EX_immEn : std_logic;
  SIGNAL s_EX_Rs : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_EX_Rt : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_EX_SEout : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_EX_Inst : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_Mux1 : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_EX_Mux0 : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_ALUctrl : std_logic_vector(4 DOWNTO 0);
  SIGNAL s_wholeALUout : std_logic_vector(63 DOWNTO 0);
  SIGNAL s_SHAMT : std_logic_vector(4 DOWNTO 0);
  SIGNAL s_ShiftEn : std_logic;
  SIGNAL s_VarEn : std_logic;
  SIGNAL s_D : std_logic;
  SIGNAL s_T : std_logic;
  SIGNAL s_Y : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_EX_Mux4 : std_logic_vector(31 DOWNTO 0);

  ----------------------MEM----------------------
  SIGNAL s_MEM_MemtoReg : std_logic;
  SIGNAL s_MEM_MemWrite : std_logic;
  SIGNAL s_MEM_Rs : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_MEM_Rt : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_MEM_Mux4 : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_MEM_Mux0 : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_MEM_Inst : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_MEM_ALUresult : std_logic_vector(63 DOWNTO 0);

  ----------------------WB----------------------
  SIGNAL s_WB_MemtoReg : std_logic;
  SIGNAL s_WB_Rs : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_WB_Mux4 : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_WB_DMemOut : std_logic_vector(31 DOWNTO 0);
  SIGNAL s_WB_Inst : std_logic_vector(31 DOWNTO 0);
  ----------------------------------------------

  -- components -----------------------------------------------------------

  COMPONENT fetch_logic IS
    GENERIC (N : INTEGER := 32);
    PORT (
      i_Branch : IN std_logic;
      i_Jump : IN std_logic;
      i_instr : IN std_logic_vector(31 DOWNTO 0); -- 32 instruction
      i_PC : IN std_logic_vector(31 DOWNTO 0); -- the PC value
      o_PC : OUT std_logic_vector(31 DOWNTO 0) -- output to the PC register
    );
  END COMPONENT;

  COMPONENT adder_N_bit IS
    GENERIC (N : INTEGER := 32);
    PORT (
      i_A : IN std_logic_vector(N - 1 DOWNTO 0);
      i_B : IN std_logic_vector(N - 1 DOWNTO 0);
      i_Cin : IN std_logic;
      o_S : OUT std_logic_vector(N - 1 DOWNTO 0);
      o_Cout : OUT std_logic;
      o_Ovfl : OUT std_logic
    );
  END COMPONENT;

  COMPONENT alucontrol IS
    PORT (
      i_OP : IN std_logic_vector (5 DOWNTO 0); --op code
      i_FI : IN std_logic_vector (5 DOWNTO 0); --instruction
      o_F : OUT std_logic_vector (4 DOWNTO 0)); --output
  END COMPONENT;

  COMPONENT barrel_decoder IS
    PORT (
      i_ALUctrl : IN std_logic_vector(4 DOWNTO 0);
      o_D : OUT std_logic; -- Shift direction output (0: right, 1: left)
      o_T : OUT std_logic; -- Shift type output (0: logical, 1: arith.)
      o_VarEn : OUT std_logic;
      o_ShiftEn : OUT std_logic
    );
  END COMPONENT;

  COMPONENT PC_reg IS
    PORT (
      i_CLK : IN std_logic;
      i_RST : IN std_logic;
      i_WE : IN std_logic;
      i_D : IN std_logic_vector(31 DOWNTO 0);
      o_Q : OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;

  COMPONENT RegFile IS
    GENERIC (N : INTEGER := 32);
    PORT (
      i_WA0 : IN std_logic_vector(4 DOWNTO 0);
      i_WA1 : IN std_logic_vector(4 DOWNTO 0);
      i_WD0 : IN std_logic_vector(31 DOWNTO 0);
      i_WD1 : IN std_logic_vector(31 DOWNTO 0);
      i_RA0 : IN std_logic_vector(4 DOWNTO 0);
      i_RA1 : IN std_logic_vector(4 DOWNTO 0);
      i_WE0 : IN std_logic;
      i_WE1 : IN std_logic;
      i_RST : IN std_logic;
      i_CLK : IN std_logic;
      o_q0 : OUT std_logic_vector(31 DOWNTO 0);
      o_q1 : OUT std_logic_vector(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT extender IS
    GENERIC (Y : INTEGER := 16);
    PORT (
      input : IN std_logic_vector(Y - 1 DOWNTO 0);
      sign : IN std_logic;
      output : OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;

  COMPONENT beq IS
    PORT (
      i_A : IN std_logic_vector(31 DOWNTO 0);
      i_B : IN std_logic_vector(31 DOWNTO 0);
      o_F : OUT std_logic
    );

  END COMPONENT;

  COMPONENT mux2t1_N IS
    GENERIC (N : INTEGER := 32);
    PORT (
      i_S : IN std_logic;
      i_D0 : IN std_logic_vector(N - 1 DOWNTO 0);
      i_D1 : IN std_logic_vector(N - 1 DOWNTO 0);
      o_O : OUT std_logic_vector(N - 1 DOWNTO 0));
  END COMPONENT;

  COMPONENT andg2 IS
    PORT (
      i_A : IN std_logic;
      i_B : IN std_logic;
      o_F : OUT std_logic);
  END COMPONENT;

  COMPONENT barrelshift_32 IS
    GENERIC (N : INTEGER := 32); -- Generic of type integer for input/output data width. Default value is 32.
    PORT (
      i_SHAMT : IN std_logic_vector(4 DOWNTO 0); -- Shift amount input
      i_D : IN std_logic; -- Shift direction input (0: right, 1: left)
      i_T : IN std_logic; -- Shift type input (0: logical, 1: arith.)
      i_X : IN std_logic_vector(31 DOWNTO 0); -- Data value input
      o_Y : OUT std_logic_vector(31 DOWNTO 0)); -- Data value output
  END COMPONENT;

  COMPONENT control IS
    PORT (
      i_instruction : IN std_logic_vector(31 DOWNTO 0);
      o_immSign : OUT std_logic; -- not needed
      o_MemToReg : OUT std_logic;
      o_sub : OUT std_logic; -- not needed
      o_imm : OUT std_logic;
      o_lui : OUT std_logic; -- not needed
      o_ALUOp : OUT std_logic_vector(5 DOWNTO 0);
      o_Shift : OUT std_logic; -- not needed
      o_leftShift : OUT std_logic; -- not needed
      o_arithShift : OUT std_logic; -- not needed
      o_MemWrite : OUT std_logic;
      o_shiftReg : OUT std_logic; -- not needed
      o_DestReg : OUT std_logic;
      o_jump : OUT std_logic;
      o_branch : OUT std_logic;
      o_RegWrite : OUT std_logic;
      o_JR : OUT std_logic;
      o_JAL : OUT std_logic);
  END COMPONENT;

  COMPONENT f_alu IS
    GENERIC (N : INTEGER := 32);
    PORT (
      i_A : IN std_logic_vector(N - 1 DOWNTO 0); --input 1
      i_B : IN std_logic_vector(N - 1 DOWNTO 0); --input 2
      i_C : IN std_logic_vector (4 DOWNTO 0); --alu control
      o_S : OUT std_logic_vector(31 DOWNTO 0); --sum output
      o_C : OUT std_logic_vector(31 DOWNTO 0); --carry output
      o_Overflow : OUT std_logic);
  END COMPONENT;

  COMPONENT if_id IS
    PORT (
      i_CLK : IN std_logic;
      i_RST : IN std_logic;
      i_WE : IN std_logic;
      i_Inst : IN std_logic_vector(31 DOWNTO 0);
      i_NextInstAddr : IN std_logic_vector(31 DOWNTO 0);
      o_Inst : OUT std_logic_vector(31 DOWNTO 0);
      o_NextInstAddr : OUT std_logic_vector(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT id_ex IS
    PORT (
      i_CLK : IN std_logic;
      i_RST : IN std_logic;
      i_WE : IN std_logic;
      i_MemtoReg : IN std_logic_vector(0 DOWNTO 0);
      i_ALUOp : IN std_logic_vector(5 DOWNTO 0);
      i_MemWrite : IN std_logic_vector(0 DOWNTO 0);
      i_immEn : IN std_logic_vector(0 DOWNTO 0);
      i_Rs : IN std_logic_vector(31 DOWNTO 0);
      i_Rt : IN std_logic_vector(31 DOWNTO 0);
      i_SEout : IN std_logic_vector(31 DOWNTO 0);
      i_Inst : IN std_logic_vector(31 DOWNTO 0);
      i_Mux0 : IN std_logic_vector(31 DOWNTO 0);
      o_MemtoReg : OUT std_logic_vector(0 DOWNTO 0);
      o_ALUOp : OUT std_logic_vector(5 DOWNTO 0);
      o_MemWrite : OUT std_logic_vector(0 DOWNTO 0);
      o_immEn : OUT std_logic_vector(0 DOWNTO 0);
      o_Rs : OUT std_logic_vector(31 DOWNTO 0);
      o_Rt : OUT std_logic_vector(31 DOWNTO 0);
      o_SEout : OUT std_logic_vector(31 DOWNTO 0);
      o_Inst : OUT std_logic_vector(31 DOWNTO 0);
      o_Mux0 : OUT std_logic_vector(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT ex_mem IS
    PORT (
      i_CLK : IN std_logic;
      i_RST : IN std_logic;
      i_WE : IN std_logic;
      i_MemtoReg : IN std_logic_vector(0 DOWNTO 0);
      i_MemWrite : IN std_logic_vector(0 DOWNTO 0);
      i_Rt : IN std_logic_vector(31 DOWNTO 0);
      i_Mux4 : IN std_logic_vector(31 DOWNTO 0);
      i_Mux0 : IN std_logic_vector(31 DOWNTO 0);
      i_Inst : IN std_logic_vector(31 DOWNTO 0);
      i_ALUresult : IN std_logic_vector(63 DOWNTO 0);
      o_MemtoReg : OUT std_logic_vector(0 DOWNTO 0);
      o_MemWrite : OUT std_logic_vector(0 DOWNTO 0);
      o_Rt : OUT std_logic_vector(31 DOWNTO 0);
      o_Mux4 : OUT std_logic_vector(31 DOWNTO 0);
      o_Mux0 : OUT std_logic_vector(31 DOWNTO 0);
      o_Inst : OUT std_logic_vector(31 DOWNTO 0);
      o_ALUresult : OUT std_logic_vector(63 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT mem_wb IS
    PORT (
      i_CLK : IN std_logic;
      i_RST : IN std_logic;
      i_WE : IN std_logic;
      i_MemtoReg : IN std_logic_vector(0 DOWNTO 0);
      i_Mux4 : IN std_logic_vector(31 DOWNTO 0);
      i_Mux0 : IN std_logic_vector(31 DOWNTO 0);
      i_DMemOut : IN std_logic_vector(31 DOWNTO 0);
      i_Inst : IN std_logic_vector(31 DOWNTO 0);
      o_MemtoReg : OUT std_logic_vector(0 DOWNTO 0);
      o_Mux4 : OUT std_logic_vector(31 DOWNTO 0);
      o_Mux0 : OUT std_logic_vector(31 DOWNTO 0);
      o_DMemOut : OUT std_logic_vector(31 DOWNTO 0);
      o_Inst : OUT std_logic_vector(31 DOWNTO 0)
    );
  END COMPONENT;

BEGIN

  -- TODO: This is required to be your final input to your instruction memory. This provides a feasible method to externally load the memory module which means that the synthesis tool must assume it knows 
  --        nothing about the values stored in the instruction memory. If this is not included, much, if not all of the design is optimized out because the synthesis tool will believe the memory to be all zeros.
  WITH iInstLd SELECT
    s_IMemAddr <= s_NextInstAddr WHEN '0',
    iInstAddr WHEN OTHERS;
  IMem : mem
  GENERIC MAP(
    ADDR_WIDTH => 10,
    DATA_WIDTH => N)
  PORT MAP(
    clk => iCLK,
    addr => s_IMemAddr(11 DOWNTO 2),
    data => iInstExt,
    we => iInstLd,
    q => s_Inst);

  DMem : mem
  GENERIC MAP(
    ADDR_WIDTH => 10,
    DATA_WIDTH => N)
  PORT MAP(
    clk => iCLK,
    addr => s_DMemAddr(11 DOWNTO 2),
    data => s_DMemData,
    we => s_DMemWr,
    q => s_DMemOut);

  -- TODO: Ensure that s_Halt is connected to an output control signal produced from decoding the Halt instruction (Opcode: 01 0100)
  -- TODO: Ensure that s_Ovfl is connected to the overflow output of your ALU

  -- TODO: Implement the rest of your processor below this comment! 

  fetch : fetch_logic
  PORT MAP(
    i_Branch => s_ID_BandEq,
    i_Jump => s_ID_Jump,
    i_instr => s_ID_Inst,
    i_PC => s_NextInstAddr,
    o_PC => s_IF_oPC
  );

  PC : PC_reg
  PORT MAP(
    i_CLK => iCLK,
    i_RST => iRST,
    i_WE => '1',
    i_D => s_IF_nextPC,
    o_Q => s_NextInstAddr -- dictated by outline
  );

  mux5 : mux2t1_N
  GENERIC MAP(N => 32)
  PORT MAP(
    i_S => s_ID_JR,
    i_D0 => s_IF_oPC,
    i_D1 => s_ID_Rs,
    o_O => s_IF_nextPC
  );

  stage0 : if_id
  PORT MAP(
    i_CLK => NOT iCLK,
    i_RST => iRST,
    i_WE => '1',
    i_Inst => s_Inst,
    i_NextInstAddr => s_NextInstAddr,
    o_Inst => s_ID_Inst,
    o_NextInstAddr => s_ID_NextInstAddr
  );

  controlUnit : control
  PORT MAP(
    i_instruction => s_ID_Inst,
    o_immSign => s_ID_Signed,
    o_MemToReg => s_ID_MemtoReg,
    o_sub => OPEN,
    o_imm => s_ID_ImmEn,
    o_lui => OPEN,
    o_ALUOp => s_ID_ALUOp,
    o_Shift => OPEN,
    o_leftShift => OPEN,
    o_arithShift => OPEN,
    o_MemWrite => s_ID_MemWrite,
    o_shiftReg => OPEN,
    o_DestReg => s_ID_DestReg,
    o_jump => s_ID_Jump,
    o_branch => s_ID_Branch,
    o_RegWrite => s_RegWr, -- dictated by outline
    o_JR => s_ID_JR,
    o_JAL => s_ID_JAL
  );

  mux0 : mux2t1_N
  GENERIC MAP(N => 5)
  PORT MAP(
    i_S => s_ID_DestReg,
    i_D0 => s_ID_Inst(20 DOWNTO 16),
    i_D1 => s_ID_Inst(15 DOWNTO 11),
    o_O => s_ID_Mux0 -- dictated by outline
  );

  Adder0 : adder_N_bit
  GENERIC MAP(N => 32)
  PORT MAP(
    i_A => s_ID_NextInstAddr,
    i_B => x"00000004",
    i_Cin => '0',
    o_S => s_Adder0,
    o_Cout => OPEN,
    o_Ovfl => OPEN
  );

  SignExtender : extender
  GENERIC MAP(Y => 16)
  PORT MAP(
    input => s_ID_Inst(15 DOWNTO 0),
    sign => s_ID_Inst(15) AND s_ID_Signed,
    output => s_ID_SEout
  );

  registers : RegFile
  GENERIC MAP(N => 32)
  PORT MAP(
    i_WA0 => s_RegWrAddr,
    i_WA1 => "11111", -- hardcoded to write to Reg31 for JAL in same cycle as other register write insts
    i_WD0 => s_RegWrData,
    i_WD1 => s_Adder0,
    i_RA0 => s_ID_Inst(25 DOWNTO 21),
    i_RA1 => s_ID_Inst(20 DOWNTO 16),
    i_WE0 => s_RegWr, -- dictated by outline
    i_WE1 => s_ID_JAL,
    i_RST => iRST,
    i_CLK => iCLK,
    o_q0 => s_ID_Rs,
    o_q1 => s_ID_Rt
  );

  RsEqRt : beq
  PORT MAP(
    i_A => s_ID_Rs,
    i_B => s_ID_Rt,
    o_F => s_ID_Equality
  );

  s_ID_BandEq <= s_ID_Branch AND S_ID_Equality;

  stage1 : id_ex
  PORT MAP(
    i_CLK => NOT iCLK,
    i_RST => iRST,
    i_WE => '1',
    i_MemtoReg(0) => s_ID_MemtoReg,
    i_ALUOp => s_ID_ALUOp,
    i_MemWrite(0) => s_ID_MemWrite,
    i_immEn(0) => s_ID_ImmEn,
    i_Rs => s_ID_Rs,
    i_Rt => s_ID_Rt,
    i_SEout => s_ID_SEout,
    i_Inst => s_ID_Inst,
    i_Mux0 => s_ID_Mux0,
    o_MemtoReg(0) => s_EX_MemtoReg,
    o_ALUOp => s_EX_ALUOp,
    o_MemWrite(0) => s_EX_MemWrite,
    o_immEn(0) => s_EX_immEn,
    o_Rs => s_EX_Rs,
    o_Rt => s_EX_Rt,
    o_SEout => s_EX_SEout,
    o_Inst => s_EX_Inst,
    o_Mux0 => s_EX_Mux0
  );

  mux1 : mux2t1_N
  GENERIC MAP(N => 32)
  PORT MAP(
    i_S => s_EX_ImmEn,
    i_D0 => s_EX_Rt,
    i_D1 => s_EX_SEout,
    o_O => s_Mux1
  );

  ALU : f_alu
  GENERIC MAP(N => 32)
  PORT MAP(
    i_A => s_EX_Rs,
    i_B => s_Mux1,
    i_C => s_ALUctrl,
    o_S => s_wholeALUout(31 DOWNTO 0),
    o_C => s_wholeALUout(63 DOWNTO 32),
    o_Overflow => s_Ovfl
  );
  oALUout <= s_wholeALUout(31 DOWNTO 0); -- dictated by outline

  ALU_control : alucontrol
  PORT MAP(
    i_OP => s_EX_ALUOp,
    i_FI => s_EX_Inst(5 DOWNTO 0),
    o_F => s_ALUctrl
  );

  mux3 : mux2t1_N
  GENERIC MAP(N => 5)
  PORT MAP(
    i_S => s_VarEn,
    i_D0 => s_EX_Inst(10 DOWNTO 6),
    i_D1 => s_EX_Rs(4 DOWNTO 0),
    o_O => s_SHAMT
  );

  b_decoder : barrel_decoder
  PORT MAP(
    i_ALUctrl => s_ALUctrl,
    o_D => s_D,
    o_T => s_T,
    o_VarEn => s_VarEn,
    o_ShiftEn => s_ShiftEn
  );

  barrel_shifter : barrelshift_32
  GENERIC MAP(N => 32)
  PORT MAP(
    i_SHAMT => s_SHAMT,
    i_D => s_D,
    i_T => s_T,
    i_X => s_EX_Rt,
    o_Y => s_Y
  );

  mux4 : mux2t1_N
  GENERIC MAP(N => 32)
  PORT MAP(
    i_S => s_ShiftEn,
    i_D0 => s_wholeALUout(31 DOWNTO 0),
    i_D1 => s_Y,
    o_O => s_EX_Mux4
  );

  stage2 : ex_mem
  PORT MAP(
    i_CLK => NOT iCLK,
    i_RST => iRST,
    i_WE => '1',
    i_MemtoReg(0) => s_EX_MemtoReg,
    i_MemWrite(0) => s_EX_MemWrite,
    i_Rt => s_EX_Rt,
    i_Mux4 => s_EX_Mux4,
    i_Mux0 => s_EX_Mux0,
    i_Inst => s_EX_Inst,
    i_ALUresult => s_wholeALUout,
    o_MemtoReg(0) => s_MEM_MemtoReg,
    o_MemWrite(0) => s_MEM_MemWrite,
    o_Rt => s_MEM_Rt,
    o_Mux4 => s_MEM_Mux4,
    o_Mux0 => s_MEM_Mux0,
    o_Inst => s_MEM_Inst,
    o_ALUresult => s_MEM_ALUresult
  );

  s_DMemAddr <= s_MEM_ALUresult(31 DOWNTO 0);
  s_DMemData <= s_MEM_Rt;
  s_DMemWr <= s_MEM_MemWrite;

  stage3 : mem_wb
  PORT MAP(
    i_CLK => NOT iCLK,
    i_RST => iRST,
    i_WE => '1',
    i_MemtoReg(0) => s_MEM_MemtoReg,
    i_Mux4 => s_MEM_Mux4,
    i_Mux0 => s_MEM_Mux0,
    i_DMemOut => s_DMemOut, -- dicatated by outline
    i_Inst => s_MEM_Inst,
    o_MemtoReg(0) => s_WB_MemtoReg,
    o_Mux4 => s_WB_Mux4,
    o_Mux0 => s_RegWrAddr -- dictated by outline,
    o_DMemOut => s_WB_DMemOut,
    o_Inst => s_WB_Inst

  );

  mux2 : mux2t1_N
  GENERIC MAP(N => 32)
  PORT MAP(
    i_S => s_WB_MemtoReg,
    i_D0 => s_WB_Mux4,
    i_D1 => s_WB_DMemOut,
    o_O => s_RegWrData -- dictated by outline
  );

  s_Halt <= '1' WHEN s_WB_Inst(31 DOWNTO 26) = "010100" ELSE
    '0';

END structure;