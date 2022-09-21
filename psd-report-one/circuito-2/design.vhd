library ieee;
use ieee.std_logic_1164.all;

entity demux1_2bit is
port ( 
  i_SEL : in std_logic; -- selector
  i_A : in std_logic; -- data input
  o_B : out std_logic; -- data input
  o_C : out std_logic); -- data output
end demux1_2bit;

architecture arch_1 of demux1_2bit is
begin
  process(i_SEL, i_A)
  begin
    if (i_SEL='0') then
      o_B <= i_A;
      o_C <= '0'
      else
      o_C <= i_A;
      o_B <= '0'
    end if;
  end process;
end arch_1;