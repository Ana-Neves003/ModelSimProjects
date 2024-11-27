library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
    Port (
        clk       : in  STD_LOGIC;                       -- Sinal de clock
        reset     : in  STD_LOGIC;                       -- Sinal de reset
        shift_en  : in  STD_LOGIC;                       -- Habilitação do deslocamento
        data_in   : in  STD_LOGIC_VECTOR(15 downto 0);   -- Entrada de dados
        data_out  : out STD_LOGIC_VECTOR(15 downto 0)    -- Saída do registrador
    );
end shift_register;

architecture Behavioral of shift_register is
    signal shift_reg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- Registrador interno
begin

    -- Process para controlar o registrador de deslocamento
    process(clk, reset)
    begin
        if reset = '1' then
            -- Reset assíncrono: limpa o registrador
            shift_reg <= (others => '0');
        elsif rising_edge(clk) then
            if shift_en = '1' then
                -- Desloca os bits para a esquerda e insere o bit mais significativo da entrada
                --shift_reg <= shift_reg(14 downto 0) & data_in(15);
		  shift_reg <= shift_reg;
            end if;
        end if;
    end process;

    -- Atualiza a saída com o conteúdo do registrador
    data_out <= shift_reg;

end Behavioral;

