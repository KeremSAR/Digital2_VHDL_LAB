----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:43 12/04/2021 
-- Design Name: 
-- Module Name:    Top - Behavioral 
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

entity Top is
	Port ( clock : in  STD_LOGIC;
					  reset : in  STD_LOGIC;
					  up_down : in  STD_LOGIC;
					  enable : in  STD_LOGIC);
					  
end Top;

architecture Behavioral of Top is
component clock_converter
    Port (
        clk_in : in  STD_LOGIC;
        enable  : in  STD_LOGIC;
		  rst   : in  STD_LOGIC;
        clk_out: out STD_LOGIC);
end component;

component universal_counter 
		Port ( clock : in STD_LOGIC;
			    rst : in STD_LOGIC;
				 up_down : in STD_LOGIC;
				 enable : in STD_LOGIC;
				 upperlimit : in STD_LOGIC_VECTOR(1 downto 0);
				 enable_out : out STD_LOGIC;
				 result : out STD_LOGIC_VECTOR (1 downto 0));
end component;
			signal clock1 : STD_LOGIC;
			signal a0,a1,a2,a3: STD_LOGIC; --enable outs
			signal c1,c2,c3,c4 : STD_LOGIC_VECTOR(1 downto 0); 
			
begin
			mClock:clock_converter port map(clock,enable,reset,clock1);
			sec :   universal_counter port map(clock1,reset,up_down,enable,"10",a0,c1);
			sec10 : universal_counter port map(clock1,reset,up_down,a0,"11",a1,c2);
			min :   universal_counter port map(clock1,reset,up_down,a1,"10",a2,c3);
			min10 : universal_counter port map(clock1,reset,up_down,a2,"11",a3,c4);
					
			
			

end Behavioral;

