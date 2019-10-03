----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:35 10/03/2019 
-- Design Name: 
-- Module Name:    testbench - test 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench is
    Port ( F_dut : in  STD_LOGIC_VECTOR (4 downto 0);
           F_gm : in  STD_LOGIC_VECTOR (4 downto 0);
           A : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end testbench;

architecture test of testbench is

begin
	process
		variable cont : STD_LOGIC_VECTOR (7 downto 0);
		begin
			
			cont := "00000000";
			
			for i in 1 to 256 loop
			
				A(0) <= cont(0);
				A(1) <= cont(1);
				A(2) <= cont(2);
				A(3) <= cont(3);
				B(0) <= cont(4);
				B(1) <= cont(5);
				B(2) <= cont(6);
				B(3) <= cont(7);
				wait for 500 ns;
		
				assert (F_dut = F_gm);
			
				cont := cont + 1;
				
			end loop;

			wait;
		end process;

end test;

