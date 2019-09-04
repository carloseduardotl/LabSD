----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:43 09/04/2019 
-- Design Name: 
-- Module Name:    Visto_1 - Visto_1_op 
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

entity Visto_1 is
    Port ( S : in  STD_LOGIC_VECTOR (2 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC);
end Visto_1;

architecture Visto_1_op of Visto_1 is

begin
with S select
	Y <=	D(0) when "000",
			D(1) when "001",
			D(2) when "010",
			D(3) when "011",
			D(4) when "100",
			D(5) when "101",
			D(6) when "110",
			D(7) when "111",
			'0' when others;

end Visto_1_op;

