library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity MEMSELFCT is
    generic (size : integer := 256); -- taille de la mémoire
    Port (
        clk : in std_logic;
        SEL_ROUTE : in std_logic_vector(3 downto 0);
        SEL_FCT : out std_logic_vector(3 downto 0);
            );
end MEMSELFCT;

architecture MEMSELFCT_arch of MEMSELFCT is
    signal SEL_FCT : std_logic_vector(3 downto 0);
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                SEL_FCT <= SEL_ROUTE;
            end if;
        end process;
end MEMSELFCT_arch;