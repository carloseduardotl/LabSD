library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exp8visto2 is
  port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;        
        T60 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T5 : out STD_LOGIC;
        num7seg : out STD_LOGIC_VECTOR(7 downto 0);
        displays : out STD_LOGIC_VECTOR(3 downto 0) );
end exp8visto2;

architecture exp8visto2_arch of exp8visto2 is

	component contador100 is
		port( clock : in STD_LOGIC;
				reset : in STD_LOGIC;
				enable : in STD_LOGIC;
				load : in STD_LOGIC;
				dezload : in STD_LOGIC_VECTOR(3 downto 0);
				uniload : in STD_LOGIC_VECTOR(3 downto 0);
				dezena : out STD_LOGIC_VECTOR(3 downto 0);
				unidade : out STD_LOGIC_VECTOR(3 downto 0));
	end component;

	component divclock is
		port( clock50MHz : in STD_LOGIC;
				clock1Hz : out STD_LOGIC );
	end component;
	
	component convbinario7seg is
		port( numbinario : in STD_LOGIC_VECTOR(3 downto 0);
				num7seg : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;
	
	component mostrador is
		port( num7seg3 : in STD_LOGIC_VECTOR(7 downto 0);
				num7seg2 : in STD_LOGIC_VECTOR(7 downto 0);
				num7seg1 : in STD_LOGIC_VECTOR(7 downto 0);
				num7seg0 : in STD_LOGIC_VECTOR(7 downto 0);
				clock50Mhz : in STD_LOGIC; --clock da placa
				num7seg : out STD_LOGIC_VECTOR(7 downto 0);  --digito a ser mostrado
				displays : out STD_LOGIC_VECTOR(3 downto 0)); --seletor de mostrador
	end component;
	
	component timeflags is
		port( dezena : in STD_LOGIC_VECTOR(3 downto 0);
				unidade : in STD_LOGIC_VECTOR(3 downto 0);
				T60 : out STD_LOGIC;
				T20 : out STD_LOGIC;
				T6 : out STD_LOGIC;
				T5 : out STD_LOGIC );
	end component;

	signal clock1Hz : STD_LOGIC;
	signal fio_dez, fio_un : STD_LOGIC_VECTOR (3 downto 0);
	signal dez_7seg, un_7seg : STD_LOGIC_VECTOR (7 downto 0);

begin

	clk : divclock port map( clock, clock1Hz);
	
	cont100 : contador100 port map(	clock1Hz,
												reset,
												'0',
												'0',
												"0000",
												"0000",
												fio_dez,
												fio_un);
												
	seg_dez : convbinario7seg port map(	fio_dez, dez_7seg);
	seg_uni : convbinario7seg port map(	fio_un, un_7seg);
	
	most : mostrador port map(	"11111111",
										dez_7seg,
										un_7seg,
										"11111111",
										clock,
										num7seg,
										displays);
										
	TF : timeflags port map(	fio_dez,
									fio_un,
									T60,
									T20,
									T6,
									T5);

end exp8visto2_arch;



