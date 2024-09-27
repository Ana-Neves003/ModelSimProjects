library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtracao_5bits is
    Port (
        A : in  STD_LOGIC_VECTOR(4 downto 0);  
        B : in  STD_LOGIC_VECTOR(4 downto 0);  
        Difference : out STD_LOGIC_VECTOR(4 downto 0); 
        Borrow : out STD_LOGIC             
    );
end subtracao_5bits;

architecture ckt of subtracao_5bits is 
	signal B_not : STD_LOGIC_VECTOR (4 downto 0);
	signal Full_Borrow : STD_LOGIC_VECTOR (4 downto 0);
	signal Half_Borrow : STD_LOGIC_VECTOR (4 downto 0);                                     
begin
	B_not <= not B;

    	-- Full subtractor logic
    	Full_Borrow(0) <= (A(0) and B_not(0)) or (B(0) and not A(0));
    	Difference(0) <= A(0) xor B(0);

    	Full_Borrow(1) <= (A(1) and B_not(1) and Full_Borrow(0)) or (B(1) and (not A(1) or Full_Borrow(0)));
    	Difference(1) <= A(1) xor B(1) xor Full_Borrow(0);

    	Full_Borrow(2) <= (A(2) and B_not(2) and Full_Borrow(1)) or (B(2) and (not A(2) or Full_Borrow(1)));
    	Difference(2) <= A(2) xor B(2) xor Full_Borrow(1);

    	Full_Borrow(3) <= (A(3) and B_not(3) and Full_Borrow(2)) or (B(3) and (not A(3) or Full_Borrow(2)));
    	Difference(3) <= A(3) xor B(3) xor Full_Borrow(2);

    	Full_Borrow(4) <= (A(4) and B_not(4) and Full_Borrow(3)) or (B(4) and (not A(4) or Full_Borrow(3)));
    	Difference(4) <= A(4) xor B(4) xor Full_Borrow(3);

    	Borrow <= Full_Borrow(4);

end ckt;

