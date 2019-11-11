library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exp8visto1 is
  port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;        
        enable : in STD_LOGIC;
        load : in STD_LOGIC;
        dezload : in STD_LOGIC_VECTOR(3 downto 0);
        uniload : in STD_LOGIC_VECTOR(3 downto 0);
        dezena : out STD_LOGIC_VECTOR(3 downto 0);
        unidade : out STD_LOGIC_VECTOR(3 downto 0) );
end exp8visto1;

architecture exp8visto1_arch of exp8visto1 is

	component contador100 is
	port( clock : in STD_LOGIC;
			reset : in STD_LOGIC;
			enable : in STD_LOGIC;
			load : in STD_LOGIC;
			dezload : in STD_LOGIC_VECTOR(3 downto 0);
			uniload : in STD_LOGIC_VECTOR(3 downto 0);
			dezena : out STD_LOGIC_VECTOR(3 downto 0);
			unidade : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;
	
	component divclock is
		port( clock50MHz : in STD_LOGIC;
				clock1Hz : out STD_LOGIC );
	end component;

	signal clock1Hz : STD_LOGIC;

begin

	clk : divclock port map( clock, clock1Hz);
	
	cont100: contador100 port map(	clock1Hz,
												reset,
												enable,
												load,
												dezload,
												uniload,
												dezena,
												unidade);
												
	

end exp8visto1_arch;



