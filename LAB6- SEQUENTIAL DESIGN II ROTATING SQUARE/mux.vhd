----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:42:46 12/12/2021 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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


entity mux is
    Port ( inpLeft : in  STD_LOGIC_VECTOR (7 downto 0);
           inpRight : in  STD_LOGIC_VECTOR (7 downto 0);
			  dir  : in  STD_LOGIC;
           out1 : out  STD_LOGIC_VECTOR (7 downto 0));
end mux;

architecture Behavioral of mux is

begin
	
		with dir select
			out1 <= inpLeft when '0',
					  inpRight when others;

end Behavioral;

