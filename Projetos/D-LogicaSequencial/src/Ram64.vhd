-- Elementos de Sistemas
-- by Luciano Soares
-- Ram64.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram64 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 5 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram64 is

	component Ram8 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 2 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Mux8Way16 is
		port (
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				c:   in  STD_LOGIC_VECTOR(15 downto 0);
				d:   in  STD_LOGIC_VECTOR(15 downto 0);
				e:   in  STD_LOGIC_VECTOR(15 downto 0);
				f:   in  STD_LOGIC_VECTOR(15 downto 0);
				g:   in  STD_LOGIC_VECTOR(15 downto 0);
				h:   in  STD_LOGIC_VECTOR(15 downto 0);
				sel: in  STD_LOGIC_VECTOR( 2 downto 0);
				q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component DMux8Way is
		port (
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
	end component;

	signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
	signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);

begin


	r0: ram8 port map(clock,input,load0,address(2 downto 0),output0);
	r1: ram8 port map(clock,input,load1,address(2 downto 0),output1);
	r2: ram8 port map(clock,input,load2,address(2 downto 0),output2);
	r3: ram8 port map(clock,input,load3,address(2 downto 0),output3);
	r4: ram8 port map(clock,input,load4,address(2 downto 0),output4);
	r5: ram8 port map(clock,input,load5,address(2 downto 0),output5);
	r6: ram8 port map(clock,input,load6,address(2 downto 0),output6);
	r7: ram8 port map(clock,input,load7,address(2 downto 0),output7);


	m1: mux8way16 port map(
		a => output0,
		b => output1,
		c => output2,
		d => output3,
		e => output4,
		f => output5,
		g => output6,
		h => output7,
		sel => address(5 downto 3),
		q => output
		  );
	dm1: dmux8way port map(
		a => load,
		sel => address(5 downto 3),
		q0 => load0,
		q1 => load1,
		q2 => load2,
		q3 => load3,
		q4 => load4,
		q5 => load5,
		q6 => load6,
		q7 => load7
		  );
		  
end architecture;

