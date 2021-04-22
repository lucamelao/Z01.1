-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is

signal entrada: std_logic:= '0';	

begin

	process(clock) begin
	if (rising_edge(CLOCK)) then
		if (J = '1') then
			if (K = '0') then
				entrada <= '1';
			else
				entrada <= not entrada;
			end if;
		else
			if (K = '1') then
				entrada <= '0';
			else
				entrada <= entrada;
			end if;
		end if;
	else
		entrada <= entrada;
	end if;
	end process;
	q <= entrada;
	notq <= not entrada;


end architecture;
