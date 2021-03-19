----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity ConceitoA is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  unsigned(9 downto 0);
        HEX0     : out std_logic_vector(6 downto 0); -- 7seg0
        HEX1     : out std_logic_vector(6 downto 0); -- 7seg0
        HEX2     : out std_logic_vector(6 downto 0); -- 7seg0
		LEDR     : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of ConceitoA is

--------------
-- signals
--------------

signal shift_u : unsigned(3 downto 0);
signal shift_d : unsigned(3 downto 0);
signal shift_c : unsigned(3 downto 0);
signal shift_m : unsigned(3 downto 0);
signal tres    : unsigned(2 downto 0);
signal saida   : unsigned(25 downto 0);

---------------
-- implementacao
---------------
begin

	saida <= "00000000000000000000000000";
	shift_u <= "0000";
	shift_d <= "0000";
	shift_c <= "0000";
	shift_m <= "0000";
	tres <= "011";

	saida(12 downto 3) <= SW(9 downto 0);

	shift_u <= resize(saida(12 downto 10), shift_u'length) + tres when resize(saida(12 downto 10), shift_u'length) > "0100" else
			   resize(saida(12 downto 10), shift_u'length);

	saida(13 downto 10) <= shift_u when shift_u < "0101" else
						   saida(13 downto 10);
	saida(9 downto 4) <= saida(8 downto 3) when shift_u < "0101" else
						 saida(9 downto 4);
	
	saida(14 downto 11) <= shift_u when shift_u > "0101" else
						   saida(14 downto 11);
	saida(10 downto 4) <= saida(9 downto 3) when shift_u > "0101" else
						 saida(10 downto 4);

	
	shift_u <= saida(13 downto 10) + tres when saida(12 downto 10) > "0100" else
			   saida(13 downto 10);

	






end rtl;
