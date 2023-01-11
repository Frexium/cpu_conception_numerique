library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity MEMSELOUT is
    generic (size : integer := 256); -- taille de la mémoire
    Port (
        clk : in std_logic;
        SEL_OUT : in std_logic_vector(3 downto 0);
        MEM_SEL_OUT : out std_logic_vector(3 downto 0);
            );
end MEMSELOUT;

architecture MEMSELOUT_arch of MEMSELOUT is
    signal MEM_SEL_OUT : std_logic_vector(3 downto 0);
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                MEM_SEL_OUT <= SEL_OUT;
            end if;
        end process;
end MEMSELOUT_arch;