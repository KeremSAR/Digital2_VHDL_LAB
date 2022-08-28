--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:38:50 12/05/2020
-- Design Name:   
-- Module Name:   C:/Users/LENOVO/Desktop/EEM334/EEM334_Labs/lab5/test.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         up_down : IN  std_logic;
         enable : IN  std_logic;
         enable_out_2 : OUT  std_logic;
         new_Fast_s : OUT  std_logic_vector(4 downto 0);
         new_Slow_s : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal up_down : std_logic := '0';
   signal enable : std_logic := '1';

 	--Outputs
   signal enable_out_2 : std_logic;
   signal new_Fast_s : std_logic_vector(4 downto 0);
   signal new_Slow_s : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          clk => clk,
          reset => reset,
          up_down => up_down,
          enable => enable,
          enable_out_2 => enable_out_2,
          new_Fast_s => new_Fast_s,
          new_Slow_s => new_Slow_s
        );

   -- Clock process definitions
   clk_process :process
      begin
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period;

		
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1' ;
      wait for 100 ns;	
		reset <= '0' ;

      -- insert stimulus here 

      wait;
   end process;

END;