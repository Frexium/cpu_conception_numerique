library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity UAL is

port(
    Buffer_A : in std_logic_vector(3 downto 0);
    Buffer_B : in std_logic_vector(3 downto 0);
    Buffer_L : in std_logic;
    Buffer_R : in std_logic;
    SEL_FCT : in std_logic_vector(3 downto 0);
    SR_OUT_L : out std_logic;
    SR_OUT_R : out std_logic;
    S : out std_logic_vector(7 downto 0)
)

end UAL;

architecture UAL_arch of UAL is

    signal My_Buffer_A : std_logic_vector(3 downto 0);
    signal My_Buffer_B : std_logic_vector(3 downto 0);
    signal My_Buffer_L : std_logic;
    signal My_Buffer_R : std_logic;
    signal My_SEL_FCT : std_logic_vector(3 downto 0);
    signal My_SR_OUT_L : std_logic;
    signal My_SR_OUT_R : std_logic;
    signal My_S : std_logic_vector(7 downto 0)

begin

    case SEL_FCT is
        when "0000" => My_S <= "00000000"; SR_OUT_L <= "0"; SR_OUT_R <= "0";
        when "0001" => 
        when "0010" => 
        when "0011" => 
        when "0100" => 
        when "0101" => 
        when "0110" => 
        when "0111" => 
        when "1000" => 
        when "1001" => My_S <= Buffer_A; SR_OUT_L <= "0"; SR_OUT_R <= "0";
        when "1010" => My_S <= Buffer_B; SR_OUT_L <= "0"; SR_OUT_R <= "0";
        when "1011" => My_S <= not Buffer_A; SR_OUT_L <= "0"; SR_OUT_R <= "0";
        when "1100" => My_S <= not Buffer_B; SR_OUT_L <= "0"; SR_OUT_R <= "0";
        when "1101" => My_S <= Buffer_A and Buffer_B; SR_OUT_L <= "0"; SR_OUT_R <= "0";
        when "1110" => My_S <= Buffer_A or Buffer_B; SR_OUT_L <= "0"; SR_OUT_R <= "0";
        when "1111" => My_S <= Buffer_A xor Buffer_B; SR_OUT_L <= "0"; SR_OUT_R <= "0";