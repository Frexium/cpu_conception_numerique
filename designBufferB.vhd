library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity BufferB is
    generic (size : integer := 256); -- taille de la mémoire
    Port (  SEL_ROUTE : std_logic_vector(3 downto 0);
            reset : in std_logic;
            MEM_CACHE_1 : in std_logic_vector(7 downto 0);
            MEM_CACHE_2 : in std_logic_vector(7 downto 0);
            B_IN : in std_logic_vector(3 downto 0);
            S : in std_logic_vector(7 downto 0);
            Buffer_B : out std_logic_vector(3 downto 0);
            );
end BufferB;

architecture BufferB_arch of BufferB is
    
begin
    case SEL_ROUTE is
        when "1001" => memory(to_integer(unsigned(Buffer_B))) <= MEM_CACHE_1(7 downto 4);
        when "1010" => memory(to_integer(unsigned(Buffer_B))) <= MEM_CACHE_1(3 downto 0);
        when "1011" => memory(to_integer(unsigned(Buffer_B))) <= MEM_CACHE_2(7 downto 4);
        when "1100" => memory(to_integer(unsigned(Buffer_B))) <= MEM_CACHE_2(3 downto 0);
        when "1101" => memory(to_integer(unsigned(Buffer_B))) <= S(7 downto 4);
        when "1110" => memory(to_integer(unsigned(Buffer_B))) <= S(3 downto 0);
        when "1111" => memory(to_integer(unsigned(Buffer_B))) <= A_IN;
    end case;

    if reset = '1' then
        Buffer_B <= "0000";
    end if;
end BufferB_arch;