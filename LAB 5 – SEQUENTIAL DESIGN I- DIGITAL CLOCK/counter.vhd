--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:28:04 12/06/2021
-- Design Name:   
-- Module Name:   C:/Users/kerem/Desktop/Digital 2/eem334/exp5/counter.vhd
-- Project Name:  exp5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: universal_counter
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter IS
END counter;
 
ARCHITECTURE behavior OF counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT universal_counter
    PORT(
         clock : IN  std_logic;
         rst : IN  std_logic;
         up_down : IN  std_logic;
         enable : IN  std_logic;
         upperlimit : IN  std_logic_vector(3 downto 0);
         enable_out : OUT  std_logic;
         result : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal rst : std_logic := '0';
   signal up_down : std_logic := '0';
   signal enable : std_logic := '0';
   signal upperlimit : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal enable_out : std_logic;
   signal result : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: universal_counter PORT MAP (
          clock => clock,
          rst => rst,
          up_down => up_down,
          enable => enable,
          upperlimit => upperlimit,
          enable_out => enable_out,
          result => result
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period;
		clock <= '1';
		wait for clock_period;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      
			 rst <= '0';
          up_down <= '1';
          enable <= '1';
          upperlimit <= "0101";

      -- insert stimulus here 

      wait;
   end process;

END;
