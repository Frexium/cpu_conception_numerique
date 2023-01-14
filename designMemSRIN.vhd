library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity MEMSRIN is
    generic (size : integer := 256); -- taille de la mémoire
    Port (
        clk : in std_logic;
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        SR_IN_L : out std_logic;
        SR_IN_R : out std_logic;
            );
end MEMSRIN;

architecture MEMSRIN_arch of MEMSRIN is
    signal A_IN : std_logic_vector(3 downto 0);
    signal B_IN : std_logic_vector(3 downto 0);
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                SR_IN_L <= A_IN;
                SR_IN_R <= B_IN;
            end if;
        end process;
end MEMSRIN_arch;