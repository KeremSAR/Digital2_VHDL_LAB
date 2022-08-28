
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter is
    Port ( clock : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           upperlimit : in  STD_LOGIC_VECTOR (4 downto 0);
           enable_out : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (4 downto 0));
end counter;

architecture Behavioral of counter is
	signal count : unsigned (4 downto 0) := "00000";
	signal limit : unsigned(4 downto 0);
	begin
	limit<=unsigned(upperlimit);
		process (clock,rst, enable, up_down,upperlimit,count,limit)
		
			begin
			if (rst = '1' and up_down='1') then
					count <= "00000";
					
			elsif(rst='1' and up_down='0')then
					count<=limit;
			end if;
			
			if (clock'event and clock = '1') then
			
				if (enable = '1') then
				
					if (up_down = '1') then
					
						if(count=limit) then 
							
							count<="00000";
							
						else
						
							count <= count + 1;
							
						end if;
						
					elsif(up_down='0') then
					
						if(count="00000")then
						
							count<=limit;	
							
						else count <= count - 1;
						
						end if;
						
					end if ;
					
				else 
				
					 count<=count;
					
				end if ;
				
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
			
			elsif(count="00000" and up_down='0' and enable='1') then
			
			enable_out<='1';
			
			else
			
			enable_out<='0';
			
			end if;
		
		end if;	

		
		end process;
	
		result <= std_logic_vector(count);



end Behavioral;