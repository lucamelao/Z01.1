-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e
                                                                     -- ng (se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- instrução  e ALU para reg. A
    muxALUI_D                   : out STD_LOGIC;
    muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- reg. A e Mem. RAM para ALU
                                                                     -- A  e Mem. RAM para ALU
		muxSD                       : out STD_LOGIC;
    zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A,
                                                                     -- reg. D, Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is

begin

  loadD <= (instruction(17) and instruction(4)) or (not instruction(17) and instruction(16));
  loadM <= instruction(17) and instruction(5);
  loadS <= instruction(17) and instruction(6);
  loadA <= (instruction(17) and instruction(3)) or (not instruction(17) and not instruction(16));
  muxALUI_A <= not instruction(17) and not instruction(16);
  muxALUI_D <= not instruction(17) and instruction(16);
  muxSD <= instruction(17) and instruction(14);
  zx <= instruction(17) and instruction(12);
  muxAM <= instruction(17) and instruction(13);
  nx <= instruction(17) and instruction(11);
  ny <= instruction(17) and instruction(9);
  zy <= instruction(17) and instruction(10);
  f <= instruction(17) and instruction(8);
  no <= instruction(17) and instruction(7);

  loadPc  <=  '1' when (instruction(17)='1' and instruction(2 downto 0)="001" and (zr='0' and ng='0')) else
		    '1' when (instruction(17)='1' and instruction(2 downto 0)="010" and (ng='0' and zr='1')) else
		    '1' when (instruction(17)='1' and instruction(2 downto 0)="011" and (ng='0')) else
		    '1' when (instruction(17)='1' and instruction(2 downto 0)="100" and (zr='0' and ng='1')) else
		    '1' when (instruction(17)='1' and instruction(2 downto 0)="101" and (zr='0')) else
		    '1' when (instruction(17)='1' and instruction(2 downto 0)="110" and (ng='1')) else
		    '1' when (instruction(17)='1' and instruction(2 downto 0)="111") else 
		    '0';
end architecture;
