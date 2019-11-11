library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador100 is
  port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        load : in STD_LOGIC;
        dezload : in STD_LOGIC_VECTOR(3 downto 0);
        uniload : in STD_LOGIC_VECTOR(3 downto 0);
        dezena : out STD_LOGIC_VECTOR(3 downto 0);
        unidade : out STD_LOGIC_VECTOR(3 downto 0) );
end contador100;

architecture contador100_arch of contador100 is
	component contador10 is
	port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        rci : in STD_LOGIC;
        load : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Q : out STD_LOGIC_VECTOR(3 downto 0);
        rco : out STD_LOGIC );
	end component;

	signal rco_unidade, rco_dezena : STD_LOGIC;

begin

	cont_uni: contador10 port map(	clock,
												reset,
												enable,
												'0',
												load,
												uniload,
												unidade,
												rco_unidade);
												
	cont_dez : contador10 port map(	clock,
												reset,
												enable,
												rco_unidade,
												load,
												dezload,
												dezena,
												rco_dezena);

end contador100_arch;


