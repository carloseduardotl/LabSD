library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exp8visto3 is
  port( clock : in STD_LOGIC;
        ligadesliga : in STD_LOGIC;        
        sensorA : in STD_LOGIC;
        sensorB : in STD_LOGIC;
        num7seg : out STD_LOGIC_VECTOR(7 downto 0);
        displays : out STD_LOGIC_VECTOR(3 downto 0) );
end exp8visto3;

architecture exp8visto3_arch of exp8visto3 is

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
	
	component timeflags is
		port( dezena : in STD_LOGIC_VECTOR(3 downto 0);
				unidade : in STD_LOGIC_VECTOR(3 downto 0);
				T60 : out STD_LOGIC;
				T20 : out STD_LOGIC;
				T6 : out STD_LOGIC;
				T5 : out STD_LOGIC );
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
		
	component divclock is
		port( clock50MHz : in STD_LOGIC;
				clock1Hz : out STD_LOGIC );
	end component;
	
	component convsemaforo7seg is
		port( RYGsemaforo : in STD_LOGIC_VECTOR(2 downto 0);
				num7seg : out STD_LOGIC_VECTOR(7 downto 0) );
		end component;
		
	component maqestados is
		port( clock : in STD_LOGIC;
				ligadesliga : in STD_LOGIC;
				sensorA : in STD_LOGIC;
				sensorB : in STD_LOGIC;
				T60 : in STD_LOGIC;
				T20 : in STD_LOGIC;
				T6 : in STD_LOGIC;
				T5 : in STD_LOGIC;
				resetcounter : out STD_LOGIC;
				RYGsemaforoA : out STD_LOGIC_VECTOR(2 downto 0);
				RYGsemaforoB : out STD_LOGIC_VECTOR(2 downto 0) );
	end component;
	
	component convbinario7seg is
		port( numbinario : in STD_LOGIC_VECTOR(3 downto 0);
				num7seg : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;
		
	signal clock1Hz, resetcounter, T5, T6, T20, T60 : STD_LOGIC;
	signal RYGsemaforoNS, RYGsemaforoLO : STD_LOGIC_VECTOR(2 downto 0);
	signal dezena, unidade : STD_LOGIC_VECTOR(3 downto 0);
	signal NS_num7seg, LO_num7seg, dez_num7seg, un_num7seg : STD_LOGIC_VECTOR(7 downto 0);

begin

	clk : divclock port map(clock, clock1Hz);
	
	mqe : maqestados port map(	clock1Hz,
										ligadesliga,
										sensorA,
										sensorB,
										T60, T20, T6, T5,
										resetcounter,
										RYGsemaforoNS,
										RYGsemaforoLO);
										
	cont : contador100 port map(	clock1Hz,	
											resetcounter,
											'0',
											'0',
											"0000",
											"0000",
											dezena,
											unidade);
	
	tf : timeflags port map(	dezena,
									unidade,
									T60, T20, T6, T5);
									
	sm_ns : convsemaforo7seg port map(RYGsemaforoNS, NS_num7seg);
	sm_lo : convsemaforo7seg port map(RYGsemaforoLO, LO_num7seg);
	
	seg_dez: convbinario7seg port map(dezena, dez_num7seg);
	seg_un: convbinario7seg port map(unidade, un_num7seg);
	
	most : mostrador port map(	NS_num7seg, dez_num7seg, un_num7seg, LO_num7seg, clock, num7seg, displays);
										

end exp8visto3_arch;





