
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Find_X is
 
 port (
 A,B,C,D : in STD_LOGIC;
 X : out STD_LOGIC 
 );
 
end Find_X;

architecture Behavioral of Find_X is
signal and_1,and_2 : STD_LOGIC;
begin

and_1 <= ( A and B and (not C));
and_2 <= ( B and (not C) and D);

X <= and_1 or and_2;




end Behavioral;

