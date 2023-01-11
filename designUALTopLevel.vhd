library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UAL_Top_Level is
Port(
    CLK : in STD_LOGIC;
    sv : in STD_LOGIC_VECTOR(3 downto 0);
    btn : in STD_LOGIC_VECTOR(3 downto 0);
    led : out STD_LOGIC_VECTOR(3 downto 0);
    led0_r : out STD_LOGIC; led0_g : out STD_LOGIC; led0_b : out STD_LOGIC;
    led1_r : out STD_LOGIC; led1_g : out STD_LOGIC; led1_b : out STD_LOGIC;
    led2_r : out STD_LOGIC; led2_g : out STD_LOGIC; led2_b : out STD_LOGIC;
    led3_r : out STD_LOGIC; led3_g : out STD_LOGIC; led3_b : out STD_LOGIC;
);
end UAL_Top_Level;

architecture UAL_Top_Level_arch of UAL_Top_Level is
    component UAL is
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
    end component;

begin

MyUALCoreInstance : UAL
    port map(
        Buffer_A => sv,
        Buffer_B => sv,
        Buffer_L => '0',
        Buffer_R => '0',
        SEL_FCT => btn,
        SR_OUT_L => led0_r,
        SR_OUT_R => led1_r,
        S => My_S
    );

led <= My_S(7 downto 4);
led3g <= My_S(3);
led2g <= My_S(2);
led1g <= My_S(1);
led0g <= My_S(0);

led0_b <= '0';
led1_b <= '0';
led2_b <= '0'; led2_r <= '0';
led3_b <= '0'; led3_r <= '0';

end UAL_Top_Level_arch;


    
