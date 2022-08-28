----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:42 12/04/2021 
-- Design Name: 
-- Module Name:    clock_converter - Behavioral 
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



entity clock_converter is
    Port (
        clk_in : in  STD_LOGIC;
        enable  : in  STD_LOGIC;
          rst  : in  STD_LOGIC;
        clk_out: out STD_LOGIC);
end clock_converter;

architecture Behavioral of clock_converter is

       signal temp: STD_LOGIC :='1';
      signal counter : integer range 0 to 4 := 0;
begin

    process (enable,rst,clk_in,temp,counter)

    begin

        if(rst='1') then
            temp <= '1';
            counter <= 0;

        elsif (enable = '0') then
            temp <= temp;
            counter<=counter;
         elsif rising_edge(clk_in) then

                    if (counter = 4) then -- divides 10 (4+1) x 2
                         temp <= NOT(temp);

                         counter <= 0;
                    else
                         counter <= counter + 1;
                    end if;
              end if;
    end process;

     clk_out <= temp;


end Behavioral;