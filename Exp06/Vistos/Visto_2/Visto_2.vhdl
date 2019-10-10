----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:22:14 10/09/2019 
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
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           DIR : in  STD_LOGIC;
           L : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Visto_2;

architecture Visto_2_op of Visto_2 is

signal Qbuf : STD_LOGIC_VECTOR (3 downto 0);

begin

	Q <= Qbuf;
	
	process (CLK)
	begin
		if rising_edge(CLK) then
			if RST = '1' then Qbuf <= "0000";
			elsif LOAD = '1' then Qbuf <= D;
			elsif DIR = '0' then
				if L = '0' then Qbuf <= (Qbuf(2) & Qbuf(1) & Qbuf(0) & '0'); end if;
				if L = '1' then Qbuf <= (Qbuf(2) & Qbuf(1) & Qbuf(0) & '1'); end if;
			elsif DIR = '1' then
				if R = '0' then Qbuf <= ('0' & Qbuf(3) & Qbuf(2) & Qbuf(1)); end if;
				if R = '1' then Qbuf <= ('1' & Qbuf(3) & Qbuf(2) & Qbuf(1)); end if;
			end if;
		end if;
	end process;				

end Visto_2_op;

