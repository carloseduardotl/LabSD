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

entity MUX_8 is
    Port ( S : in  STD_LOGIC_VECTOR (2 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC);
end MUX_8;

architecture MUX_8_op of MUX_8 is

begin

	Y <=	D(0) when (S="000") else
			D(1) when (S="001") else
			D(2) when (S="010") else
			D(3) when (S="011") else
			D(4) when (S="100") else
			D(5) when (S="101") else
			D(6) when (S="110") else
			D(7) when (S="111") else
			'0' ;

end MUX_8_op;

