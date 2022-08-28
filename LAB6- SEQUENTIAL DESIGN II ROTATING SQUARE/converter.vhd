
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity converter is
    Port (
        clk_in : in  STD_LOGIC;
        enable  : in  STD_LOGIC;
		  rst  : in  STD_LOGIC;
        clk_out: out STD_LOGIC;
		  clk_out_2: out STD_LOGIC
    );
end converter;

architecture Behavioral of converter is

    signal clk_new, clk_new_2: STD_LOGIC;
    signal divider : integer range 0 to  2:= 0;
	 signal divider_2 : integer range 0 to 4 := 0;
    
	 begin
	 
      frequency_clk_new: process (enable,rst,clk_in,clk_new,divider) 
			  
			  begin
			  
			  if(rst='1') then
				clk_new <= '0';
				clk_new_2 <= '0';				
				divider <= 0;
				
			  
			  elsif (enable = '0') then
					clk_new_2 <= clk_new_2;
					clk_new <= clk_new;				
					divider <= divider;
			  divider_2 <= divider_2;
			  elsif rising_edge(clk_in) then
			  
					if (divider = 2) then		-- 6 ya böler

						 clk_new <= NOT(clk_new);
						 
						 divider <= 0;
						 
					elsif (divider_2 = 4) then -- 10 a böler
							
						clk_new_2<= NOT(clk_new_2);
						 
						 divider_2 <= 0;
					
					else
						 divider <= divider + 1;
						 divider_2 <= divider_2 + 1;
					end if;
					
			  end if;
    end process;

	 clk_out <= clk_new;
	 clk_out_2 <= clk_new_2;
	 
end Behavioral;