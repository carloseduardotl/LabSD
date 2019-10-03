----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:26:46 10/03/2019 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Visto_2 is
    Port ( A : in  UNSIGNED (3 downto 0);
           B : in  UNSIGNED (3 downto 0);
           S : out  STD_LOGIC_VECTOR (4 downto 0));
end Visto_2;

architecture Visto_2_op of Visto_2 is

begin

	S <= ('0' & A) + ('0' & B);


end Visto_2_op;

