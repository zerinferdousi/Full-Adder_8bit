library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_1bit is
    Port ( A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           Cin  : in  STD_LOGIC;
           S    : out STD_LOGIC;
           Cout : out STD_LOGIC);
end FA_1bit;

architecture Behavioral of FA_1bit is
begin
    S    <= A xor B xor Cin;
    Cout <= (A and B) or (B and Cin) or (A and Cin);
end Behavioral;