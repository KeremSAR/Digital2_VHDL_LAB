----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:10 12/12/2021 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
entity top is
		Port (
		clk : in STD_LOGIC;
		enable : in STD_LOGIC;
		dir : in STD_LOGIC;
		seg_out : out STD_LOGIC_VECTOR(7 downto 0);
	   seg_sel : out STD_LOGIC_VECTOR(7 downto 0));
		
end top;

architecture Behavioral of top is
component mux is
		 Port (
		     inpLeft  : in  STD_LOGIC_VECTOR (7 downto 0);
           inpRight : in  STD_LOGIC_VECTOR (7 downto 0);
			  dir      : in  STD_LOGIC;
           out1     : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
component clock_converter is
		 Port (
		 clk_in :  in  STD_LOGIC;
		 enable :  in  STD_LOGIC;
		 clk_out:  out STD_LOGIC);
end component;
component Rotate_left is
			Port(
			clk     : in  STD_LOGIC;
			enable  : in  STD_LOGIC;	
			reg_out : out std_logic_vector (7 downto 0));
end component;
component Rotate_right is
			Port(
			clk     : in  STD_LOGIC;
			enable  : in  STD_LOGIC;			
			reg_out : out std_logic_vector (7 downto 0));
end component;
component seven_four is
		 Port ( 
		     in1 : in  STD_LOGIC_VECTOR (1 downto 0);
           in2 : in  STD_LOGIC_VECTOR (1 downto 0);
           in3 : in  STD_LOGIC_VECTOR (1 downto 0);
           in4 : in  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
           dp  : out  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           segment : out  STD_LOGIC_VECTOR (6 downto 0));
end component;
	signal clk_out,dp : std_logic;
	signal reg1,reg2, reg3,reg4 : std_logic_vector(1 downto 0);
	signal o_left,o_right,reg : std_logic_vector (7 downto 0);
	signal seg_out_7 :STD_LOGIC_VECTOR(6 downto 0);
	signal seg_sel_4 : STD_LOGIC_VECTOR(3 downto 0);
begin
	reg1 <= reg(7) &	reg(6);
	reg2 <= reg(5) &	reg(4);
	reg3 <= reg(3) &	reg(2);
	reg4 <= reg(1) &	reg(0);
		
	U1: clock_converter port map(clk,enable,clk_out);
	U2: Rotate_left port map (clk_out,enable,o_left);
	U3: Rotate_right port map (clk_out,enable,o_right);
	U4: mux port map (o_left,o_right,dir,reg);
	U5: seven_four port map (reg1,reg2,reg3,reg4,clk_out,dp,seg_sel_4,seg_out_7);
	seg_out <= seg_out_7 & dp;
	seg_sel <= "1111" & seg_sel_4;
	
	
end Behavioral;

