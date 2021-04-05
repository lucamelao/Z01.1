library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(1 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of BarrelShifter16 is

begin
	
	q <= a(14 downto 0) & '0' when dir = '0' and size = "01" else
		 a(13 downto 0) & "00" when dir = '0' and size = "10" else
		 a(12 downto 0) & "000" when dir = '0' and size = "11" else
	     '0' & a(15 downto 1) when dir = '1' and size = "01" else
		 "00" & a(15 downto 2) when dir = '1' and size = "10" else
		 "000" & a(15 downto 3) when dir = '1' and size = "11" else
		 a;
		  

end architecture;

