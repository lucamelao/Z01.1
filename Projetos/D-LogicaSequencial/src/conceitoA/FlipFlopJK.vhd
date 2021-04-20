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

begin

	process(clock) begin
	if (rising_edge(CLOCK)) then
		if (J = '1') then
			if (K = '0') then
				q <= '1';
				notq <= '0';
			elsif (K = '1') then
				q <= notq;
				notq <= q;
			end if;
		elsif (J = '0') then
			if (K = '1') then
				q <= '0';
				notq <= '1';
			elsif (K = '0') then
				q <= q;
				notq <= notq;
			end if;
		end if;
	elsif (not rising_edge(CLOCK)) then
		q <= q;
		notq <= notq;
	end if;
	end process;



end architecture;
