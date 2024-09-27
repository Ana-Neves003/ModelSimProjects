library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity soma is
    Port ( A   : in  STD_LOGIC;
           B   : in  STD_LOGIC;
           Cin : in STD_LOGIC;
	   S   : out  STD_LOGIC;
           Cout: out  STD_LOGIC);
end soma;

architecture ckt of soma is
begin
    S <= A XOR B XOR Cin; -- Soma
    Cout <= (A AND B) OR (Cin AND (A XOR B)); -- Carry de saída
end ckt;

