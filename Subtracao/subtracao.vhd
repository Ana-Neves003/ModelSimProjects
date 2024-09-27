library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtrator is
    Port (
        A : in  STD_LOGIC;   
        B : in  STD_LOGIC;   
        Borrow_in : in  STD_LOGIC; 
        Diff : out STD_LOGIC; 
        Borrow_out : out STD_LOGIC 
    );
end subtrator;

architecture ckt of subtrator is
begin
    Diff <= A XOR B XOR Borrow_in; 
    Borrow_out <= (not A and (B or Borrow_in)) or (not A and B); 
end ckt;

