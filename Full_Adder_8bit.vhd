library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_8bit is
    Port ( A    : in  STD_LOGIC_VECTOR (7 downto 0);
           B    : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin  : in  STD_LOGIC;
           S    : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end Full_Adder_8bit;

architecture Structural of Full_Adder_8bit is

  
    component FA_1bit is
        Port ( A    : in  STD_LOGIC;
               B    : in  STD_LOGIC;
               Cin  : in  STD_LOGIC;
               S    : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

  
    signal c : STD_LOGIC_VECTOR (6 downto 0);

begin


    FA0: FA_1bit port map (A => A(0), B => B(0), Cin => Cin,  S => S(0), Cout => c(0));
    FA1: FA_1bit port map (A => A(1), B => B(1), Cin => c(0), S => S(1), Cout => c(1));
    FA2: FA_1bit port map (A => A(2), B => B(2), Cin => c(1), S => S(2), Cout => c(2));
    FA3: FA_1bit port map (A => A(3), B => B(3), Cin => c(2), S => S(3), Cout => c(3));
    FA4: FA_1bit port map (A => A(4), B => B(4), Cin => c(3), S => S(4), Cout => c(4));
    FA5: FA_1bit port map (A => A(5), B => B(5), Cin => c(4), S => S(5), Cout => c(5));
    FA6: FA_1bit port map (A => A(6), B => B(6), Cin => c(5), S => S(6), Cout => c(6));
    FA7: FA_1bit port map (A => A(7), B => B(7), Cin => c(6), S => S(7), Cout => Cout);

end Structural;