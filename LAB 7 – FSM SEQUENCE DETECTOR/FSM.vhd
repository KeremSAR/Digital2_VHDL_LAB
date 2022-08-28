----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:33 12/25/2020 
-- Design Name: 
-- Module Name:    FSM_1 - Behavioral 
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

entity FSMis
 port ( inp, reset, clk, en: in STD_LOGIC;
        sequance : out STD_LOGIC_VECTOR(7 downto 0);
		  count : out STD_LOGIC_VECTOR (3 downto 0)); 
		  
end FSM;

architecture Behavioral of FSM_1 is
    type state is (s0,s1,s2,s3,s4);
	 signal my_state, state_next : state;
    signal a :  unsigned(3 downto 0) := "0000"; 
	 signal regist: STD_LOGIC_VECTOR (7 downto 0) := "00000000";	
     
begin
    process(clk, reset, en)
	 begin
       if (clk = '1' and clk'event) then           		 
   			 if (reset = '1') then
            	  regist <= "00000000";
		           
	              my_state <= zero;
             elsif (en = '1') then			 
                 regist <= regist(6 downto 0) & inp;
			        my_state<= state_next;
					  
             end if ;
       end if;	 
    end process;
	 process(my_state, inp)
	 begin
	 
	    case my_state is
		    when s0=> -- 0000
			    if (inp = '1') then
				    state_next <= one;
				 elsif (inp = '0') then
                state_next <= zero;
				 end if;	 
				 
		    when s1 => -- x001
			    if (inp = '1') then
				  state_next <= two;
				
				 elsif (inp = '0') then
                   state_next <= zero;
				 end if;
				 
		    when s2 => -- 0011			    
			    if (inp = '1') then
				    state_next <= two;
				 elsif (inp = '0') then
                state_next <= three;
				 end if;
				 
		    when s3 => -- 0110			    
			    if (inp = '1') then
				       state_next <= four;
				 
				 elsif (inp = '0') then
                   state_next <= zero;
				 end if;
				 
		    when s4 => -- 1101           		 
			    if (inp = '1') then
				    state_next <= two;
				 elsif (inp = '0') then
                state_next <= zero;
				 end if;	
			 				 
       end case;
	 end process;
	 
	 process(my_state)
	 begin
	 if (reset = '1') then
	     a<="0000";
	 else	  
	     if (my_state = s4) then
				 a <= a + 1;
		  else
             a <= a;
		  end if;
	 end if;	
	 end process;
	 
Sequance <= regist;
count <= STD_LOGIC_VECTOR(a);

end Behavioral;