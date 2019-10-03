--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:18:46 10/03/2019
-- Design Name:   
-- Module Name:   /home/cadu/Documentos/LabSD/Exp05/Vistos/Visto_3/test.vhd
-- Project Name:  Visto_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: testbench
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT testbench
    PORT(
         F_dut : IN  std_logic_vector(4 downto 0);
         F_gm : IN  std_logic_vector(4 downto 0);
         A : OUT  std_logic_vector(3 downto 0);
         B : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT Visto_1
	 PORT(
			A : in  STD_LOGIC_VECTOR (3 downto 0);
         B : in  STD_LOGIC_VECTOR (3 downto 0);
         S : out  STD_LOGIC_VECTOR (4 downto 0)
			);
	 END COMPONENT;
	 
	 COMPONENT Visto_2
	 PORT(
			A : in  UNSIGNED (3 downto 0);
         B : in  UNSIGNED (3 downto 0);
         S : out  STD_LOGIC_VECTOR (4 downto 0)
			);
	 END COMPONENT;
    

   --Inputs
   signal F_dut : std_logic_vector(4 downto 0);
   signal F_gm : std_logic_vector(4 downto 0);

 	--Outputs
   signal A : std_logic_vector(3 downto 0);
   signal B : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	U0: Visto_1 port map(A, B, F_dut);
	U1: Visto_2 port map(A, B, F_gm);
	U2: testbench port map(F_dut, F_gm, A, B);   

END;
