library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorDeMoedas is
	port (
    Q,D,N : in  STD_LOGIC;
    cents     : out STD_LOGIC_VECTOR(4 downto 0));
end entity;

architecture arch of detectorDeMoedas is

begin

    cents(0) <= ((not Q) and (not D) and N) or (Q and (not D) and (not N));
    cents(1) <= ((not Q) and D and (not N));
    cents(2) <= ((not Q) and (not D) and N);
    cents(3) <= ((not N) and (Q xor D));
    cents(4) <= (Q and (not D) and (not N));

end architecture;