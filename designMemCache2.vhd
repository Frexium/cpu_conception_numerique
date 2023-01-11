library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity MEMCACHE2 is
    generic (size : integer := 256); -- taille de la mémoire
    Port (  SEL_ROUTE : std_logic_vector(3 downto 0);
            reset : in std_logic;
            MEM_CACHE_2 : out std_logic_vector(7 downto 0);
            S : in std_logic_vector(7 downto 0);
            );
end MEMCACHE2;

architecture MEMCACHE2_arch of MEMCACHE2 is
    
begin
    if SEL_ROUTE = "1000" then
        MEM_CACHE_2 <= S;
    end if;

    if reset = '1' then
        MEM_CACHE_2 <= "00000000";
    end if;
end MEMCACHE2_arch;