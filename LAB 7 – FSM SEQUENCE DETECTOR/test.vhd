--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:38:01 12/24/2021
-- Design Name:   
-- Module Name:   C:/Users/Desktop/EEM334/EEM334_Labs/Lab7/test.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM_1
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
 
    COMPONENT FSM
    PORT(
         inp : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         en : IN  std_logic;
         sequance : OUT  std_logic_vector(7 downto 0);
         count : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inp : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal sequance : std_logic_vector(7 downto 0);
   signal count : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          inp => inp,
          reset => reset,
          clk => clk,
          en => en,
          sequance => sequance,
          count => count
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

  
   -- Stimulus process
   stim_proc: process
     begin		
		
		reset <= '1';
		wait for 10ns; 
		
		reset <= '0';
		en <= '0';
      inp <= '1';	
		wait for 10ns;
		
      en <= '1';
		inp <= '0';	
		wait for 10ns;
		
		
		inp <='1';
		wait for 10ns;
		
	
		inp <= '0';
      wait for 10ns;
		
		inp <='0';
		wait for 10ns;
		
		inp <= '1';
      wait for 10ns; 
		
		inp <='1';
		
		wait for 10ns;
		
		--reset <= '1';
		inp <= '0';
      wait for 10ns; 
		
		inp <='1';			-- the 1101101			100 ns 
		wait for 10ns;
		
		inp <= '1';
      wait for 10ns; 
		
		inp <='0';
		wait for 10ns;
		
		inp <= '1';
      wait for 10ns;
		
		inp <='1';
		wait for 10ns;
		
		inp <= '0';
		wait for 10ns;
		

		inp <= '1';
		wait for 10ns;
		
		inp <= '1';
		wait for 10ns;
		
		reset <= '1';
		wait for 10ns;
		
		inp <= '0';
		wait for 10ns;
		
		inp <= '0';
		wait for 10ns;
		inp <= '1';
		
	end process;	
END;
