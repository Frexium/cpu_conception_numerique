library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std.logic_signed.all;

entity interconnexion is

    port(
        SR_IN_L : in std_logic;
        SR_IN_R : in std_logic;
        SR_OUT_L : out std_logic;
        SR_OUT_R : out std_logic;
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        BUFFER_A : out std_logic_vector(3 downto 0);
        BUFFER_B : out std_logic_vector(3 downto 0);
        BUFFER_SR_IN_L : out std_logic;
        BUFFER_SR_IN_R : out std_logic;
        SEL_FCT : in std_logic_vector(3 downto 0);
        SEL_ROUTE : in std_logic_vector(3 downto 0);
        CLK : in std_logic;
        RESET : in std_logic;
        RES_OUT : out std_logic_vector(7 downto 0);
        S : out std_logic_vector(7 downto 0);
    )