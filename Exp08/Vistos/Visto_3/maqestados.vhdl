library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maqestados is
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
end maqestados;

architecture maqestados_arch of maqestados is
    
	 type estado is (	intermitente_on,
							intermitente_of,
							liberado_NS,
							liberado_LO,
							amarelo_NS,
							amarelo_LO,
							vermelho_NS,
							vermelho_LO);
							
	signal currentState, nextState : estado;
	 
begin

	sync_proc: process(clock)
	begin
		if rising_edge(clock) then
			currentState <= nextState;
		end if;
	end process sync_proc;
	
	comb_proc: process(ligadesliga, sensorA, sensorB, T60, T20, T6, T5)
	begin
		case currentState is
		
			when intermitente_on =>
				RYGsemaforoA <= "010";
				RYGsemaforoB <= "010";
				if(ligadesliga = '1') then nextState <= liberado_NS; resetcounter <= '1';
				else nextState <= intermitente_of; resetcounter <= '1';
				end if;
			
			when intermitente_of =>
				RYGsemaforoA <= "000";
				RYGsemaforoB <= "000";
				nextState <= intermitente_on;
				resetcounter <= '1';
				
			when liberado_NS =>
				RYGsemaforoA <= "001";
				RYGsemaforoB <= "100";
				if(ligadesliga = '0') then nextState <= intermitente_on; resetcounter <= '1';
				elsif(sensorA = '1') then nextState <= currentState;
				elsif((T20 = '1') and (sensorB = '1') and (sensorA = '0')) then nextState <= amarelo_NS; resetcounter <= '1';
				elsif(T60 = '1') then nextState <= amarelo_NS; resetcounter <= '1';
				else nextState <= currentState;
				end if;
				
			when amarelo_NS =>
				RYGsemaforoA <= "010";
				RYGsemaforoB <= "100";
				if(ligadesliga = '0') then nextState <= intermitente_on; resetcounter <= '1';
				elsif(T6 = '1') then nextState <= vermelho_NS; resetcounter <= '1';
				else nextState <= currentState;
				end if;
				
			when vermelho_NS =>
				RYGsemaforoA <= "100";
				RYGsemaforoB <= "100";
				if(ligadesliga = '0') then nextState <= intermitente_on; resetcounter <= '1';
				elsif(T5 = '1') then nextState <= liberado_LO; resetcounter <= '1';
				else nextState <= currentState;
				end if;
				
			when liberado_LO =>
				RYGsemaforoA <= "100";
				RYGsemaforoB <= "001";
				if(ligadesliga = '0') then nextState <= intermitente_on; resetcounter <= '1';
				elsif(sensorB = '1') then nextState <= currentState;
				elsif((T20 = '1') and (sensorA = '1') and (sensorB = '0')) then nextState <= amarelo_LO; resetcounter <= '1';
				elsif(T60 = '1') then nextState <= amarelo_LO; resetcounter <= '1';
				else nextState <= currentState;
				end if;
				
			when amarelo_LO =>
				RYGsemaforoA <= "100";
				RYGsemaforoB <= "010";
				if(ligadesliga = '0') then nextState <= intermitente_on; resetcounter <= '1';
				elsif(T6 = '1') then nextState <= vermelho_LO; resetcounter <= '1';
				else nextState <= currentState;
				end if;
				
			when vermelho_LO =>
				RYGsemaforoA <= "100";
				RYGsemaforoB <= "100";
				if(ligadesliga = '0') then nextState <= intermitente_on; resetcounter <= '1';
				elsif(T5 = '1') then nextState <= liberado_NS; resetcounter <= '1';
				else nextState <= currentState;
				end if;
				
			when others =>
				nextState <= intermitente_on;
				
			end case;
		end process comb_proc;

end maqestados_arch;



