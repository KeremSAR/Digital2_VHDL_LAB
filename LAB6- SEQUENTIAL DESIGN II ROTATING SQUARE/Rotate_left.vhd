----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:32:18 12/12/2021 
-- Design Name: 
-- Module Name:    Rotate_left - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity Rotate_left is
   port(clk 	: in  STD_LOGIC;
        enable : in  STD_LOGIC;
		  reg_out :out std_logic_vector (7 downto 0));
end Rotate_left;

architecture Behavioral of Rotate_left is
	signal r_reg : unsigned (7 downto 0):= "00000001";
begin
process (r_reg,clk,enable)
		begin
		
			if(enable = '1') then
				if (clk'event and clk = '1') then
					r_reg <= r_reg rol 1;
				end if ;
			else 
					r_reg <= r_reg;
			end if;
	end process ;
reg_out <= std_logic_vector (r_reg );
end Behavioral;

