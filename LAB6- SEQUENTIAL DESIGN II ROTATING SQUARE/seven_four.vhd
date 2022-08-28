--------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:05:36 02/13/2009 
-- Design Name: 
-- Module Name:    seven_four - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seven_four is
    Port ( in1 : in  STD_LOGIC_VECTOR (1 downto 0);
           in2 : in  STD_LOGIC_VECTOR (1 downto 0);
           in3 : in  STD_LOGIC_VECTOR (1 downto 0);
           in4 : in  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
           dp  : out  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           segment : out  STD_LOGIC_VECTOR (6 downto 0));
end seven_four;


architecture Behavioral of seven_four is



signal sec:std_logic_vector(7 downto 0);
begin
    sec<=in1&in2&in3&in4;
    dp <= '1';
    process (clk,sec)
    begin
        case (sec) is
            when "00000001" =>
                sel <= "1110";
                segment <= "0011100";  --top

            when "00000010" =>
                sel <= "1101";
                segment <= "0011100";

            when "00000100" =>
                sel <= "1011";
                segment <= "0011100";

            when "00001000" => 
                sel <= "0111";
                segment <="0011100";

           
			  when "00010000" => 			-- bottom
                sel <= "0111";
                segment <= "0100011"; 

            when "00100000" => 
                sel <= "1011";
                segment <= "0100011";

            when "01000000" => 
                sel <= "1101";
                segment <= "0100011";

            when "10000000" => 
                sel <= "1110";
                segment <= "0100011";
            when others => 
                sel <= "1111";
                segment <= "1111111";

        end case;

end process;

end Behavioral;
