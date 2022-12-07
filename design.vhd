library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity UAL is

port(
    Buffer_A : in std_logic_vector(3 downto 0);
    Buffer_B : in std_logic_vector(3 downto 0);
    Buffer_LR : in std_logic_vector(1 downto 0);
    SEL_FCT : in std_logic_vector(3 downto 0);
    SR_OUT_LR : out std_logic_vector(1 downto 0);
    S : out std_logic_vector(7 downto 0);
)

end UAL;

architecture UAL_arch of UAL is

    signal My_Buffer_A : std_logic_vector(3 downto 0);
    signal My_Buffer_B : std_logic_vector(3 downto 0);
    signal My_Buffer_LR : std_logic_vector(1 downto 0);
    signal My_SEL_FCT : std_logic_vector(3 downto 0);
    signal My_SR_OUT_LR : std_logic_vector(1 downto 0);
    signal My_S : std_logic_vector(7 downto 0);

begin

    