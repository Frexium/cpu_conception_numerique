-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity myUALtestbench is

end myUALtestbench;

architecture myUALtestbench_Arch of myUALtestbench is

    component UAL is

    port (
        Buffer_A : in std_logic_vector(3 downto 0);
        Buffer_B : in std_logic_vector(3 downto 0);
        Buffer_L : in std_logic;
        Buffer_R : in std_logic;
        SEL_FCT : in std_logic_vector(3 downto 0);
        SR_OUT_L : out std_logic;
        SR_OUT_R : out std_logic;
        S : out std_logic_vector(7 downto 0)
    );
    end component;

    constant N : integer := 6;

    signal Buffer_A_sim, Buffer_B_sim	: std_logic_vector(3 downto 0) := (others => '0');
    signal Buffer_L_sim, Buffer_R_sim, SR_OUT_L, SR_OUT_L   : std_logic := '0';
    signal SEL_FCT_sim              	: std_logic_vector(3 downto 0) := (others => '0');
    signal S_sim                    	: std_logic_vector(7 downto 0) := (others => '0');

begin

    MyComponentUALunderTest : UAL

    port map (
        Buffer_A => Buffer_A_sim,
        Buffer_B => Buffer_B_sim,
        Buffer_L => Buffer_L_sim,
        Buffer_R => Buffer_R_sim,
        SEL_FCT => SEL_FCT_sim,
        SR_OUT_L => SR_OUT_L_sim,
        SR_OUT_R => SR_OUT_R_sim,
        S => S_sim
    );

    process

    