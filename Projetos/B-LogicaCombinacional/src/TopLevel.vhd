--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

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
entity TopLevel is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(9 downto 0);
		HEX0     : out std_logic_vector(6 downto 0); -- 7seg0
		LEDR     : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------
	signal X: std_logic;
	signal Y: std_logic;
	signal Z: std_logic;
	

---------------
-- implementacao
---------------
begin
          
	--LEDR(0) <= SW(0) or SW(1);
	--LEDR(1) <= SW(1);
	--LEDR <= "1111111111" when SW = "1001101010" else
	--"0000000000";
	-----------------------------------------------------------------
	--X <= SW(0);
	--Y <= SW(1);
	--Z <= SW(2);
	
	--LEDR(0) <= not((X and Y) and Z) or not((X and Y) or Y);
	------------------------------------------------------------------
	
	--HEX0 <= "0010010";
	
end rtl;
