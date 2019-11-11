library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity convsemaforo7seg is
  port( RYGsemaforo : in STD_LOGIC_VECTOR(2 downto 0);
        num7seg : out STD_LOGIC_VECTOR(7 downto 0) );
end convsemaforo7seg;

architecture convsemaforo7seg_arch of convsemaforo7seg is
  -- inserir sinais e componentes aqui 
begin

	with RYGsemaforo select
		num7seg <=	"01111111" when "100",
						"11111101" when "010",
						"11101111" when "001",
						"11111111" when others;

end convsemaforo7seg_arch;

