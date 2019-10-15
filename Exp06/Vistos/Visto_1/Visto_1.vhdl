----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:36:14 10/09/2019 
-- Design Name: 
-- Module Name:    Visto_1 - FP 
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

entity Visto_1 is
    Port ( PR : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           J : in  STD_LOGIC;
			  K : in STD_LOGIC;
           Q : out  STD_LOGIC);
end Visto_1;

architecture F_F of Visto_1 is

signal JK : STD_LOGIC_VECTOR (1 downto 0);
signal Qbuf : STD_LOGIC;

begin

	JK <= J & K;
	Q <= Qbuf;
	
	process (PR, CLR, CLK)
	begin
		if PR = '1' then Qbuf <= '1';
		elsif CLR = '1' then Qbuf <= '0';
		elsif rising_edge(CLK) then
			case JK is
				when "00" => Qbuf <= Qbuf;
				when "01" => Qbuf <= '0';
				when "10" => Qbuf <= '1';
				when "11" => Qbuf <= not(Qbuf);
				when others => null;
			end case;
		end if;
	end process;

end F_F;

