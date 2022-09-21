library ieee;
use ieee.std_logic_1164.all;

entity deonehot4_2bit is
port ( 
  i_HOT : in std_logic_vector(3 downto 0); -- in 2 bit
  o_BIN : out std_logic_vector(1 downto 0) -- out hot 4 bit
  ); 
end deonehot4_2bit;

architecture arch_1 of deonehot4_2bit is
begin
  process(i_HOT)
  begin
    if (i_HOT="0001") then
      o_BIN <= "00";
    elsif (i_HOT="0010") then
      o_BIN <= "01";
    elsif (i_HOT="0100") then
      o_BIN <= "10";
    else
    o_BIN <= "11";
    end if;
  end process;
end arch_1;