library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity soma_16bits is
    Port (
        A : in  STD_LOGIC_VECTOR(15 downto 0); 
        B : in  STD_LOGIC_VECTOR(15 downto 0); 
        S : out STD_LOGIC_VECTOR(15 downto 0); 
        Carry_out : out STD_LOGIC               
    );
end soma_16bits;

architecture ckt of soma_16bits is
    signal Carry: STD_LOGIC_VECTOR(15 downto 0); 
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
    Carry(4) <= (A(4) AND B(4)) OR (Carry(3) AND (A(4) XOR B(4)));
    
    -- Soma do bit 5
    S(5) <= A(5) XOR B(5) XOR Carry(4);
    Carry(5) <= (A(5) AND B(5)) OR (Carry(4) AND (A(5) XOR B(5)));
    
    -- Soma do bit 6
    S(6) <= A(6) XOR B(6) XOR Carry(5);
    Carry(6) <= (A(6) AND B(6)) OR (Carry(5) AND (A(6) XOR B(6)));
    
    -- Soma do bit 7
    S(7) <= A(7) XOR B(7) XOR Carry(6);
    Carry(7) <= (A(7) AND B(7)) OR (Carry(6) AND (A(7) XOR B(7)));
    
    -- Soma do bit 8
    S(8) <= A(8) XOR B(8) XOR Carry(7);
    Carry(8) <= (A(8) AND B(8)) OR (Carry(7) AND (A(8) XOR B(8)));
    
    -- Soma do bit 9
    S(9) <= A(9) XOR B(9) XOR Carry(8);
    Carry(9) <= (A(9) AND B(9)) OR (Carry(8) AND (A(9) XOR B(9)));
    
    -- Soma do bit 10
    S(10) <= A(10) XOR B(10) XOR Carry(9);
    Carry(10) <= (A(10) AND B(10)) OR (Carry(9) AND (A(10) XOR B(10)));
    
    -- Soma do bit 11
    S(11) <= A(11) XOR B(11) XOR Carry(10);
    Carry(11) <= (A(11) AND B(11)) OR (Carry(10) AND (A(11) XOR B(11)));
    
    -- Soma do bit 12
    S(12) <= A(12) XOR B(12) XOR Carry(11);
    Carry(12) <= (A(12) AND B(12)) OR (Carry(11) AND (A(12) XOR B(12)));
    
    -- Soma do bit 13
    S(13) <= A(13) XOR B(13) XOR Carry(12);
    Carry(13) <= (A(13) AND B(13)) OR (Carry(12) AND (A(13) XOR B(13)));
    
    -- Soma do bit 14
    S(14) <= A(14) XOR B(14) XOR Carry(13);
    Carry(14) <= (A(14) AND B(14)) OR (Carry(13) AND (A(14) XOR B(14)));
    
    -- Soma do bit 15
    S(15) <= A(15) XOR B(15) XOR Carry(14);
    Carry_out <= (A(15) AND B(15)) OR (Carry(14) AND (A(15) XOR B(15))); -- Carry de saída final

end ckt;

