library ieee;
use ieee.std_logic_1164.all;

entity onehot2_4bit is
port ( 
  i_BIN : in std_logic_vector(1 downto 0); -- in 2 bit
  o_HOT : out std_logic_vector(3 downto 0) -- out hot 4 bit
  ); 
end onehot2_4bit;

architecture arch_1 of onehot2_4bit is
begin
  process(i_BIN)
  begin
    if (i_BIN="00") then
      o_HOT <= "0001";
    elsif (i_BIN="01") then
      o_HOT <= "0010";
    elsif (i_BIN="10") then
      o_HOT <= "0100";
    else
      o_HOT <= "1000";
    end if;
  end process;
end arch_1;