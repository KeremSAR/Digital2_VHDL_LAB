--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:30:05 11/18/2019
-- Design Name:   
-- Module Name:   C:/Users/ozudo/project/lab_5/test_converter.vhd
-- Project Name:  lab_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clk_converter
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
 
ENTITY test_converter IS
END test_converter;
 
ARCHITECTURE behavior OF test_converter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT converter
    PORT(
         clk_in : IN  std_logic;
         enable : IN  std_logic;
         rst : IN  std_logic;
         clk_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal enable : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: converter PORT MAP (
          clk_in => clk_in,
          enable => enable,
          rst => rst,
          clk_out => clk_out
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '1';
		enable <='1';
		wait for 100 ns;	
		rst <= '1';
		enable <='0';
		wait for 100 ns;	
		rst <= '0';
		enable <='0';
		wait for 100 ns;	
		rst <= '0';
		enable <='1';
		

      wait for clk_in_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
