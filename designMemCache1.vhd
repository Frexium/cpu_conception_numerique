library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity MEMCACHE1 is
    generic (size : integer := 256); -- taille de la mémoire
    Port (  SEL_ROUTE : std_logic_vector(3 downto 0);
            reset : in std_logic;
            MEM_CACHE_1 : out std_logic_vector(7 downto 0);
            S : in std_logic_vector(7 downto 0);
            );
end MEMCACHE1;

architecture MEMCACHE1_arch of MEMCACHE1 is
    
begin
    if SEL_ROUTE = "0000" then
        MEM_CACHE_1 <= S;
    end if;

    if reset = '1' then
        MEM_CACHE_1 <= "00000000";
    end if;
end MEMCACHE1_arch;