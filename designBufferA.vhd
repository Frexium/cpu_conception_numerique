library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity BufferA is
    generic (size : integer := 256); -- taille de la mémoire
    Port (  SEL_ROUTE : std_logic_vector(3 downto 0);
            reset : in std_logic;
            MEM_CACHE_1 : in std_logic_vector(7 downto 0);
            MEM_CACHE_2 : in std_logic_vector(7 downto 0);
            A_IN : in std_logic_vector(3 downto 0);
            S : in std_logic_vector(7 downto 0);
            Buffer_A : out std_logic_vector(3 downto 0);
            );
end BufferA;

architecture BufferA_arch of BufferA is
    
begin
    case SEL_ROUTE is
        when "0001" => memory(to_integer(unsigned(Buffer_A))) <= MEM_CACHE_1(7 downto 4);
        when "0010" => memory(to_integer(unsigned(Buffer_A))) <= MEM_CACHE_1(3 downto 0);
        when "0011" => memory(to_integer(unsigned(Buffer_A))) <= MEM_CACHE_2(7 downto 4);
        when "0100" => memory(to_integer(unsigned(Buffer_A))) <= MEM_CACHE_2(3 downto 0);
        when "0101" => memory(to_integer(unsigned(Buffer_A))) <= S(7 downto 4);
        when "0110" => memory(to_integer(unsigned(Buffer_A))) <= S(3 downto 0);
        when "0111" => memory(to_integer(unsigned(Buffer_A))) <= A_IN;
    end case;

    if reset = '1' then
        Buffer_A <= "0000";
    end if;
end BufferA_arch;