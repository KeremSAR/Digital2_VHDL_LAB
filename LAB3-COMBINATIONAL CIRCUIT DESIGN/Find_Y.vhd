
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Find_Y is

port(

inputs_y : in STD_LOGIC_VECTOR( 3 DOWNTO 0);
Y : out STD_LOGIC
);

end Find_Y;


architecture Behavioral of Find_Y is

begin

      Y <= '1' when (inputs_y= "0001") else
			  '1' when (inputs_y= "0100") else
			  '1' when (inputs_y= "0101") else
			  '1' when (inputs_y= "1001") else
			  '1' when (inputs_y= "1011") else
			  '1' when (inputs_y= "1111") else
			  '0' ;


end Behavioral;

