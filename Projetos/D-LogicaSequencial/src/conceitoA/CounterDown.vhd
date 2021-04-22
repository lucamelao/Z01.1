-- Elementos de Sistemas
-- CounterDown.vhd

library ieee;
use ieee.std_logic_1164.all;

entity CounterDown is
	port(
		clock:  in std_logic;
		q:      out std_logic_vector(2 downto 0) :=(others => '0')
	);
end entity;

architecture arch of CounterDown is
	component FlipFlopT is
		port(
		  clock:  in std_logic;
		  t:      in std_logic;
		  q:      out std_logic:= '0';
		  notq:   out std_logic:= '1'
		  );
	end component;

	signal notq , outff0 , outff1, outff2: std_logic;

begin


u0: FlipFlopT port map(clock,'1',outff0,notq);
u1: FlipFlopT port map(outff0,'1',outff1,notq);
u2: FlipFlopT port map(outff1,'1',outff2,notq);

q(0)<=outff0;
q(1)<=outff1;
q(2)<=outff2;

end architecture;
