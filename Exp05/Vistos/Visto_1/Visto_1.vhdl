----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:11:58 10/03/2019 
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
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (4 downto 0));
end Visto_1;

architecture Visto_1_op of Visto_1 is

component Sum is
	Port (	A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				Cin : in  STD_LOGIC;
				S : out  STD_LOGIC;
				Cout : out  STD_LOGIC);
end component;

signal carry : STD_LOGIC_VECTOR (3 downto 0);

begin

	S0: Sum port map(A(0),B(0),'0',S(0),carry(0));
	S1: Sum port map(A(1),B(1),carry(0),S(1),carry(1));
	S2: Sum port map(A(2),B(2),carry(1),S(2),carry(2));
	S3: Sum port map(A(3),B(3),carry(2),S(3),carry(3));
	S(4) <= carry(3);


end Visto_1_op;

