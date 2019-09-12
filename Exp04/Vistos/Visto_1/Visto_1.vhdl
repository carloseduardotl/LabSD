----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:43:33 09/11/2019 
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
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           X : out  STD_LOGIC;
           Y : out  STD_LOGIC);
end Visto_1;

architecture Visto_1_op of Visto_1 is

component MUX is
	Port ( S : in  STD_LOGIC_VECTOR (1 downto 0);
          D : in  STD_LOGIC_VECTOR (3 downto 0);
          Y : out  STD_LOGIC);
end component;

signal 	X_sel : STD_LOGIC_VECTOR (1 downto 0);
signal	X_in	: STD_LOGIC_VECTOR (3 downto 0);
signal 	Y_sel : STD_LOGIC_VECTOR (1 downto 0);
signal	Y_in	: STD_LOGIC_VECTOR (3 downto 0);

begin

	X_sel(0) <= B;
	X_sel(1) <= A;
	
	X_in(0) <= '0';
	X_in(1) <= not C;
	X_in(2) <= C;
	X_in(3) <= '1';
	
	Xu: MUX port map(X_sel,X_in, X);	
	
	Y_sel(0) <= B;
	Y_sel(1) <= A;
	
	Y_in(0) <= '1';
	Y_in(1) <= '0';
	Y_in(2) <= not C;
	Y_in(3) <= C;
	
	Yu: MUX 	port map(Y_sel,Y_in,Y);

end Visto_1_op;

