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
entity ConceitoB is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(9 downto 0);
        HEX0     : out std_logic_vector(6 downto 0); -- 7seg0
        HEX1     : out std_logic_vector(6 downto 0); -- 7seg0
        HEX2     : out std_logic_vector(6 downto 0); -- 7seg0
		LEDR     : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of ConceitoB is

--------------
-- signals
--------------

---------------
-- implementacao
---------------
begin

	HEX0 <="0000001" when SW(9 downto 8) = "00" else -- 0
	       "1001111" when SW(9 downto 8) = "01" else -- 1
	       "0010010" when SW(9 downto 8) = "10" else -- 2
		   "0000110" when SW(9 downto 8) = "11" else -- 3
		   "1111111";
	
	HEX1 <="0000001" when SW(7 downto 4) = "0000" else -- 0
		   "1001111" when SW(7 downto 4) = "0001" else -- 1
		   "0010010" when SW(7 downto 4) = "0010" else -- 2
		   "0000110" when SW(7 downto 4) = "0011" else -- 3
		   "1001100" when SW(7 downto 4) = "0100" else -- 4
           "0100100" when SW(7 downto 4) = "0101" else -- 5
		   "0100000" when SW(7 downto 4) = "0110" else -- 6
		   "0001111" when SW(7 downto 4) = "0010" else -- 7
		   "0000000" when SW(7 downto 4) = "1000" else -- 8
		   "0000100" when SW(7 downto 4) = "1001" else -- 9
           "0001000" when SW(7 downto 4) = "1010" else -- A
		   "1100000" when SW(7 downto 4) = "1011" else -- b
		   "0110001" when SW(7 downto 4) = "1100" else -- C
		   "1000010" when SW(7 downto 4) = "1101" else -- d
		   "0110000" when SW(7 downto 4) = "1110" else -- E
		   "0111000" when SW(7 downto 4) = "1111" else -- F
		   "1111111";
			
	HEX2  <="0000001" when SW(3 downto 0) = "0000" else -- 0
			"1001111" when SW(3 downto 0) = "0001" else -- 1
			"0010010" when SW(3 downto 0) = "0010" else -- 2
			"0000110" when SW(3 downto 0) = "0011" else -- 3
			"1001100" when SW(3 downto 0) = "0100" else -- 4
			"0100100" when SW(3 downto 0) = "0101" else -- 5
			"0100000" when SW(3 downto 0) = "0110" else -- 6
			"0001111" when SW(3 downto 0) = "0010" else -- 7
			"0000000" when SW(3 downto 0) = "1000" else -- 8
			"0000100" when SW(3 downto 0) = "1001" else -- 9
			"0001000" when SW(3 downto 0) = "1010" else -- A
			"1100000" when SW(3 downto 0) = "1011" else -- b
			"0110001" when SW(3 downto 0) = "1100" else -- C
			"1000010" when SW(3 downto 0) = "1101" else -- d
			"0110000" when SW(3 downto 0) = "1110" else -- E
			"0111000" when SW(3 downto 0) = "1111" else -- F
			"1111111";
 





end rtl;
