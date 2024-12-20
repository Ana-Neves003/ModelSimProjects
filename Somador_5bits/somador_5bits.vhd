library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity soma_5bits is
    Port (
        A : in  STD_LOGIC_VECTOR(4 downto 0);  
        B : in  STD_LOGIC_VECTOR(4 downto 0);  
        S : out STD_LOGIC_VECTOR(4 downto 0);  
        Carry_out : out STD_LOGIC               
    );
end soma_5bits;

architecture ckt of soma_5bits is
    signal Carry: STD_LOGIC_VECTOR(4 downto 0); 
begin
    -- Soma do bit 0
    S(0) <= A(0) XOR B(0); 
    Carry(0) <= A(0) AND B(0);
    
    -- Soma do bit 1
    S(1) <= A(1) XOR B(1) XOR Carry(0); 
    Carry(1) <= (A(1) AND B(1)) OR (Carry(0) AND (A(1) XOR B(1)));
    
    -- Soma do bit 2
    S(2) <= A(2) XOR B(2) XOR Carry(1);
    Carry(2) <= (A(2) AND B(2)) OR (Carry(1) AND (A(2) XOR B(2)));
    
    -- Soma do bit 3
    S(3) <= A(3) XOR B(3) XOR Carry(2);
    Carry(3) <= (A(3) AND B(3)) OR (Carry(2) AND (A(3) XOR B(3)));
    
    -- Soma do bit 4
    S(4) <= A(4) XOR B(4) XOR Carry(3);
    Carry_out <= (A(4) AND B(4)) OR (Carry(3) AND (A(4) XOR B(4))); -- Carry de sa�da

end ckt;

