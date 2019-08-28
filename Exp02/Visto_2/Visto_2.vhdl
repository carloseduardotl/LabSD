----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:04 08/28/2019 
-- Design Name: 
-- Module Name:    Visto_2 - Visto_2_op 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Visto_2 is
    Port ( S : in  STD_LOGIC_VECTOR (1 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC);
end Visto_2;

architecture Visto_2_op of Visto_2 is

begin
my_proc: process (S, D)
	begin
		if (S = "00") 		then Y <= D(0);
		elsif (S = "01") 	then Y <= D(1);
		elsif (S = "10") 	then Y <= D(2);
		elsif (S = "11") 	then Y <= D(3);
		else Y <= '0';
		end if;
end process my_proc;

end Visto_2_op;
