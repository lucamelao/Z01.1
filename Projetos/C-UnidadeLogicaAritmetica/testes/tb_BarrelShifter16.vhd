-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_BarrelShifter16.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_BarrelShifter16 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_BarrelShifter16 is

component BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			qntd: in  std_logic_vector(1 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end component;

	signal  inDir : std_logic;
	signal  inQntd : STD_LOGIC_VECTOR(1 downto 0);
	signal  inA, outQ : STD_LOGIC_VECTOR(15 downto 0);

begin

	mapping: BarrelShifter16 port map(
		a => inA,
		dir => inDir,
		qntd => inQntd,
		q => outQ);

  main : process

	begin
	test_runner_setup(runner, runner_cfg);

	-- Teste: 1
	inA <= "0000000000000010"; inDir <='0'; inQntd <= "00";
	wait for 200 ps;
	assert(outQ = "0000000000000010")  report "Falha em teste: 1" severity error;

	-- Teste: 2
	inA <= "0000000000000010"; inDir <='0'; inQntd <= "01";
	wait for 200 ps;
	assert(outQ = "0000000000000100")  report "Falha em teste: 2" severity error;

	-- Teste: 3
	inA <= "0000000000000010"; inDir <='0'; inQntd <= "10";
	wait for 200 ps;
	assert(outQ = "0000000000001000")  report "Falha em teste: 3" severity error;

	-- Teste: 4
	inA <= "0000000000000010"; inDir <='0'; inQntd <= "11";
	wait for 200 ps;
	assert(outQ = "0000000000010000")  report "Falha em teste: 4" severity error;

	-- Teste: 6
	inA <= "0100000000000000"; inDir <='1'; inQntd <= "00";
	wait for 200 ps;
	assert(outQ = "0100000000000000")  report "Falha em teste: 6" severity error;

	-- Teste: 7
	inA <= "0100000000000000"; inDir <='1'; inQntd <= "01";
	wait for 200 ps;
	assert(outQ = "0010000000000000")  report "Falha em teste: 7" severity error;

	-- Teste: 8
	inA <= "0100000000000000"; inDir <='1'; inQntd <= "10";
	wait for 200 ps;
	assert(outQ = "0001000000000000")  report "Falha em teste: 8" severity error;

	-- Teste: 9
	inA <= "0100000000000000"; inDir <='1'; inQntd <= "11";
	wait for 200 ps;
	assert(outQ = "0000100000000000")  report "Falha em teste: 9" severity error;



	test_runner_cleanup(runner); -- Simulacao acaba aqui

	end process;
end architecture;
