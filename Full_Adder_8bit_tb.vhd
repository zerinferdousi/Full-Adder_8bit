library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_8bit_tb is
end Full_Adder_8bit_tb;

architecture behavior of Full_Adder_8bit_tb is 

    -- Component Declaration
    component Full_Adder_8bit
    port(
         A    : in  std_logic_vector(7 downto 0);
         B    : in  std_logic_vector(7 downto 0);
         Cin  : in  std_logic;
         S    : out std_logic_vector(7 downto 0);
         Cout : out std_logic
        );
    end component;

   -- Inputs
   signal A   : std_logic_vector(7 downto 0) := (others => '0');
   signal B   : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

   -- Outputs
   signal S    : std_logic_vector(7 downto 0);
   signal Cout : std_logic;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder_8bit port map (
          A    => A,
          B    => B,
          Cin  => Cin,
          S    => S,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- Test 1: 0 + 0 + 0 = 0
      A <= "00000000"; B <= "00000000"; Cin <= '0'; wait for 50 ns;

      -- Test 2: 5 + 3 = 8 (Cin = 0)
      A <= "00000101"; B <= "00000011"; Cin <= '0'; wait for 50 ns;

      -- Test 3: 15 + 1 = 16 (Cin = 0)
      A <= "00001111"; B <= "00000001"; Cin <= '0'; wait for 50 ns;

      -- Test 4: 10 + 20 + 1 (Cin) = 31
      A <= "00001010"; B <= "00010100"; Cin <= '1'; wait for 50 ns;

      -- Test 5: 255 + 1 = 256 (Overflow: S=0, Cout=1)
      A <= "11111111"; B <= "00000001"; Cin <= '0'; wait for 50 ns;

      -- Test 6: 128 + 128 = 256 (S=0, Cout=1)
      A <= "10000000"; B <= "10000000"; Cin <= '0'; wait for 50 ns;

      -- Test 7: 170 + 85 + 1 (Cin) = 256 (S=0, Cout=1)
      A <= "10101010"; B <= "01010101"; Cin <= '1'; wait for 50 ns;

      wait;
   end process;

end behavior;