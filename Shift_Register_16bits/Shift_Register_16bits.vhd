library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register_16bits is
    Port (
        clk : in  STD_LOGIC; -- Sinal de clock que controla a opera��o de deslocamento                     
        reset : in  STD_LOGIC;  -- Sinal de reset que, quando ativado, limpa o registrador                  
        data_in : in  STD_LOGIC_VECTOR(15 downto 0); -- Dados de entrada de 16 bits
        data_out : out  STD_LOGIC_VECTOR(15 downto 0) -- Dados de sa�da, estado atual do registrador  
    );
end shift_register_16bits;

architecture ckt of shift_register_16bits is
    signal reg : STD_LOGIC_VECTOR(15 downto 0); -- Registrador de 16 bits onde os dados s�o deslocados a cada ciclo de clock.
begin
    -- O vetor reg(15 downto 1) � atualizado com os valores de reg(14 downto 0)
    -- Isso move cada bit uma posi��o � direita, e o bit mais significativo (MSB) � deslocado para o pr�ximo bit menos significativo.
    reg(15 downto 1) <= reg(14 downto 0);  -- Desloca os dados para a direita
    reg(0) <= data_in(15);                  -- Insere o bit mais significativo de data_in no MSB do registrador
    
    -- Atribui��o de sa�da
    -- O bit mais significativo de data_in � inserido no bit 0 de reg
    data_out <= reg;

    -- Reset ativo alto
    reg <= (others => '0') when reset = '1' else reg;  -- Quando reset estiver ativo, limpa o registrador
end ckt;

