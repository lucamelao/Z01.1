library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of BarrelShifter16 is

	signal mid: std_logic_vector(15 downto 0);

begin

	mid <= a;

	for I in size loop
		if (dir='0') then    -- left
			mid(15) <= mid(14);
			mid(14) <= mid(13);
			mid(13) <= mid(12);
			mid(12) <= mid(11);
			mid(11) <= mid(10);
			mid(10) <= mid(9);
			mid(9) <= mid(8);
			mid(8) <= mid(7);
			mid(7) <= mid(6);
			mid(6) <= mid(5);
			mid(5) <= mid(4);
			mid(4) <= mid(3);
			mid(3) <= mid(2);
			mid(2) <= mid(1);
			mid(1) <= mid(0);
			mid(0) <= '0';
		end if;
		if (dir='1') then    -- right
			mid(0) <= mid(1);
			mid(1) <= mid(2);
			mid(2) <= mid(3);
			mid(3) <= mid(4);
			mid(4) <= mid(5);
			mid(5) <= mid(6);
			mid(6) <= mid(7);
			mid(7) <= mid(8);
			mid(8) <= mid(9);
			mid(9) <= mid(10);
			mid(10) <= mid(11);
			mid(11) <= mid(12);
			mid(12) <= mid(13);
			mid(13) <= mid(14);
			mid(14) <= mid(15);
			mid(15) <= '0';
		end if;
	end loop;

end architecture;

