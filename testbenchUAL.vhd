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

    MyStimulus_Proc : process
    begin
        for i in 0 to (2**4)-1 loop
            for j in 0 to (2**4)-1 loop
                for k in 0 to 1 loop
                    for l in 0 to 1 loop
                        for m in 0 to 1 loop   
                            Buffer_A_sim <= std_logic_vector(to_unsigned(k,4));
                            Buffer_B_sim <= std_logic_vector(to_unsigned(i,4));
                            SEL_FCT_sim <= std_logic_vector(to_unsigned(j,4));
                            Buffer_L_sim <= std_logic'val(l); 
                            Buffer_R_sim <= std_logic'val(m); 
                            wait for 10 ns;
                            report "Buffer_A = " & Buffer_A_sim & " | Buffer_B = " & Buffer_B_sim & " | SEl_FCT = " & SEL_FCT_sim & " || S = " & S_sim; 
                        end loop;
                    end loop;
                end loop;
                wait for 10 ns; 
            end loop;
        end loop;
    wait;
    end process;
end myUALtestbench_Arch;