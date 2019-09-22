----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:32 09/11/2019 
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
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           F : in  STD_LOGIC;
           G : in  STD_LOGIC;
           S : out  STD_LOGIC);
end Visto_2;

architecture Visto_2_op of Visto_2 is

component MUX_8 is
    Port ( S : in  STD_LOGIC_VECTOR (2 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC);
end component;

component Decoder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal Decoder_sel : STD_LOGIC_VECTOR (3 downto 0);
signal Decoder_out : STD_LOGIC_VECTOR (15 downto 0);

signal MUX_sel : STD_LOGIC_VECTOR (2 downto 0);
signal MUX_in : STD_LOGIC_VECTOR (7 downto 0);
signal MUX_out : STD_LOGIC;

begin

	Decoder_sel(0) <= A;
	Decoder_sel(1) <= B;
	Decoder_sel(2) <= C;
	Decoder_sel(3) <= D;
	
	Dec: Decoder port map(Decoder_sel,Decoder_out);
	
	MUX_sel(0) <= E;
	MUX_sel(1) <= F;
	MUX_sel(2) <= G;
	
	MUX_in(0) <= '0';
	MUX_in(1) <= Decoder_out(9) or Decoder_out(15);
	MUX_in(2) <= Decoder_out(14);
	MUX_in(3) <= Decoder_out(13);
	MUX_in(4) <= Decoder_out(0) or Decoder_out(15);
	MUX_in(5) <= '0';
	MUX_in(6) <= '1';
	MUX_in(7) <= '1';
	
	M: MUX_8 port map(MUX_sel,MUX_in,S);


end Visto_2_op;

