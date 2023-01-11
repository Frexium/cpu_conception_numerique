library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEM_INSTRUCTION is
    generic (size : integer := 256); -- taille de la mémoire
    Port ( clk : in  std_logic;
           SEL_FCT : in  std_logic_vector(7 downto 0);
           MEM_SEL_FCT : out  std_logic_vector(3 downto 0)
           MEM_SEL_OUT : out  std_logic_vector(1 downto 0)
           MEM_SEL_ROUTE : out  std_logic_vector(3 downto 0));
end MEM_INSTRUCTION;

architecture MEM_INSTRUCTION_arch of MEM_INSTRUCTION is

begin
        MEM_SEL_ROUTE <= memory(to_integer(unsigned(SEL_FCT)));
end MEM_INSTRUCTION_arch;
