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
        when "0000" => SR_OUT_L <= "0"; SR_OUT_R <= "0";
            My_S(7 downto 0) := "00000000";
            S <= My_S;
        when "0001" => My_S(7 downto 4) := "0000";
            My_Buffer_A(3 downto 0) := Buffer_A; My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3)); My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S(3 downto 0) := My_Buffer_A + My_Buffer_B + Buffer_R;
            S <= My_S;
        when "0010" => My_S(7 downto 4) := "0000";
            My_Buffer_A(3 downto 0) := Buffer_A; My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3)); My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S(3 downto 0) := My_Buffer_A + My_Buffer_B;
            S <= My_S;
        when "0011" => My_S(7 downto 4) := "0000";
            My_Buffer_A(3 downto 0) := Buffer_A; My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3)); My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S(3 downto 0) := My_Buffer_A - My_Buffer_B;
            S <= My_S;
        when "0100" => My_S(7 downto 4) := "0000";
            My_Buffer_A(3 downto 0) := Buffer_A; My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3)); My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S(3 downto 0) := My_Buffer_A * My_Buffer_B;
            S <= My_S;
        when "0101" => My_S(7 downto 4) := "0000";
            My_Buffer_A(3 downto 0) := Buffer_A;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3));
            My_S(3 downto 0) := shift_right(My_Buffer_A, 4, Buffer_L);
            S <= My_S;
        when "0110" => My_S(7 downto 4) := "0000";
            My_Buffer_A(3 downto 0) := Buffer_A;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3));
            My_S(3 downto 0) := shift_left(My_Buffer_A, 4, Buffer_R);
            S <= My_S;
        when "0111" => My_S(7 downto 4) := "0000";
            My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S(3 downto 0) := shift_right(My_Buffer_B, 4, Buffer_L);
            S <= My_S;
        when "1000" => My_S(7 downto 4) := "0000";
            My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S(3 downto 0) := shift_left(My_Buffer_B, 4, Buffer_R);
            S <= My_S;
        when "1001" => SR_OUT_L := "0"; SR_OUT_R := "0";
            My_Buffer_A(3 downto 0) := Buffer_A;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3));
            My_S(7 downto 4) := "0000"; My_S(3 downto 0) := My_Buffer_A; 
            S <= My_S; 
        when "1010" => SR_OUT_L := "0"; SR_OUT_R := "0";
            My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S(7 downto 4) := "0000"; My_S(3 downto 0) := My_Buffer_B;
            S <= My_S;
        when "1011" => SR_OUT_L := "0"; SR_OUT_R := "0";
            My_Buffer_A(3 downto 0) := Buffer_A;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3));
            My_S := not My_Buffer_A;
            S <= My_S;
        when "1100" => SR_OUT_L := "0"; SR_OUT_R <= "0";
            My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S := not My_Buffer_B;
            S <= My_S;
        when "1101" => SR_OUT_L := "0"; SR_OUT_R := "0";
            My_Buffer_A(3 downto 0) := Buffer_A; My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3)); My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S := My_Buffer_A and My_Buffer_B;
            S <= My_S;
        when "1110" => SR_OUT_L := "0"; SR_OUT_R := "0";
            My_Buffer_A(3 downto 0) := Buffer_A; My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3)); My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S := My_Buffer_A or My_Buffer_B;
            S <= My_S;
        when "1111" => SR_OUT_L := "0"; SR_OUT_R := "0";
            My_Buffer_A(3 downto 0) := Buffer_A; My_Buffer_B(3 downto 0) := Buffer_B;
            My_Buffer_A(7 downto 4) := (others => Buffer_A(3)); My_Buffer_B(7 downto 4) := (others => Buffer_B(3));
            My_S := My_Buffer_A xor My_Buffer_B;
            S <= My_S;

    end case;

end UAL_arch;