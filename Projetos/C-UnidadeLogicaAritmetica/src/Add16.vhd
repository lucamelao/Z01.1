-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

Library ieee;
use ieee.std_logic_1164.all;


entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;

  signal vaium: STD_LOGIC_VECTOR(15 downto 0);


begin
  -- Implementação vem aqui!
  u0: FullAdder port map(
    a=>a(0),
    b=>b(0),
    c=> '0',
    soma=> q(0),
    vaium=> vaium(0));

  u1: FullAdder port map(
    a=>a(1),
    b=>b(1),
    c=> vaium(0),
    soma=> q(1),
    vaium=> vaium(1));
  u2: FullAdder port map(
    a=>a(2),
    b=>b(2),
    c=> vaium(1),
    soma=> q(2),
    vaium=> vaium(2));  
  u3: FullAdder port map(
    a=>a(3),
    b=>b(3),
    c=> vaium(2),
    soma=> q(3),
    vaium=> vaium(3));
  u4: FullAdder port map(
    a=>a(4),
    b=>b(4),
    c=> vaium(3),
    soma=> q(4),
    vaium=> vaium(4));
  u5: FullAdder port map(
    a=>a(5),
    b=>b(5),
    c=> vaium(4),
    soma=> q(5),
    vaium=> vaium(5));
  u6: FullAdder port map(
    a=>a(6),
    b=>b(6),
    c=> vaium(5),
    soma=> q(6),
    vaium=> vaium(6));
  u7: FullAdder port map(
    a=>a(7),
    b=>b(7),
    c=> vaium(6),
    soma=> q(7),
    vaium=> vaium(7));
  u8: FullAdder port map(
    a=>a(8),
    b=>b(8),
    c=> vaium(7),
    soma=> q(8),
    vaium=> vaium(8));
  u9: FullAdder port map(
    a=>a(9),
    b=>b(9),
    c=> vaium(8),
    soma=> q(9),
    vaium=> vaium(9));
  u10: FullAdder port map(
    a=>a(10),
    b=>b(10),
    c=> vaium(9),
    soma=> q(10),
    vaium=> vaium(10));
  u11: FullAdder port map(
    a=>a(11),
    b=>b(11),
    c=> vaium(10),
    soma=> q(11),
    vaium=> vaium(11));
  u12: FullAdder port map(
    a=>a(12),
    b=>b(12),
    c=> vaium(11),
    soma=> q(12),
    vaium=> vaium(12));
  u13: FullAdder port map(
    a=>a(13),
    b=>b(13),
    c=> vaium(12),
    soma=> q(13),
    vaium=> vaium(13));
  u14: FullAdder port map(
    a=>a(14),
    b=>b(14),
    c=> vaium(13),
    soma=> q(14),
    vaium=> vaium(14));
  u15: FullAdder port map(
    a=>a(15),
    b=>b(15),
    c=> vaium(14),
    soma=> q(15));
  

end architecture;
