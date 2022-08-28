----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:01 12/03/2021 
-- Design Name: 
-- Module Name:    universal_counter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity universal_counter is
	Port ( clock : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           upperlimit : in  STD_LOGIC_VECTOR (1 downto 0);
           enable_out : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (1 downto 0));
end universal_counter;

architecture Behavioral of universal_counter is
	signal count : unsigned (1 downto 0) := "00";
	signal limit : unsigned(1 downto 0);
begin
limit<=unsigned(upperlimit);
	process (clock,rst, enable, up_down,upperlimit,count)		begin
			
			if (rst = '1' and up_down='1') then
					count <= "00";					
			elsif (rst='1' and up_down='0')then
					count <= limit;
			end if;
			if (clock'event and clock = '1') then
				if (enable = '1') then
					
					if (up_down = '1') then					
						if(count=limit) then							
							count<="00";							
						else
							count <= count + 1;
						end if;
					
					elsif(up_down='0') then
						if(count="00")then
							count<=limit;
						else 
						count <= count - 1;
						end if;
					end if;
				else
					 --count<=count;
				end if;
			end if;
		if(count=limit)  then
			if(up_down='1' and enable='1')then
			enable_out<='1';
			else
			enable_out<='0';
			end if;
		else
			if(up_down='1')then
			
			enable_out<='0';
			
			elsif(count="00" and up_down='0' and enable='1') then
			
			enable_out<='1';
			
			else
			
			enable_out<='0';
			
			end if;
		end if;
		end process;
		result <= std_logic_vector(count);
		
end Behavioral;

