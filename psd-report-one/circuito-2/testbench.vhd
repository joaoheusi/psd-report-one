library ieee;
use ieee.std_logic_1164.all;

entity tb_demux1_2bit is
-- empty
end tb_demux1_2bit;

architecture arch_1 of tb_demux1_2bit is

-- DUT component
component demux1_2bit is
port ( 
  i_SEL : in std_logic; -- selector
  i_A : in std_logic; -- data input
  o_B : out std_logic; -- data input
  o_C : out std_logic); -- data output
end component;

signal w_SEL, w_A, w_B, w_C : std_logic;

begin
  
  -- Connect DUT
  u_DUT: demux1_2bit port map(
                            i_SEL => w_SEL,
                            i_A => w_A,
                            o_B => w_B,
                            o_C => w_C);
 
  process
  begin
    -- Select input channel A
    w_SEL <= '0';
    w_A <= '0';
    wait for 1 ns;
    assert(w_B='0') report "Fail @ 00" severity error;
    assert(w_C='0') report "Fail @ 00" severity error;
 
 
    w_SEL <= '0';
    w_A <= '1';
    wait for 1 ns;
    assert(w_B='1') report "Fail @ 01" severity error;
    assert(w_C='0') report "Fail @ 01" severity error;
   
   -- Select input channel B
    w_SEL <= '1';
    w_A <= '0';
    wait for 1 ns;
    assert(w_B='0') report "Fail @ 10" severity error;
    assert(w_C='0') report "Fail @ 10" severity error;
    
    w_SEL <= '1';
    w_A <= '1';
    wait for 1 ns;
    assert(w_B='0') report "Fail @ 11" severity error;
    assert(w_C='1') report "Fail @ 11" severity error;

    -- Clear inputs
    w_SEL <= '0';
    w_A <= '0';
    assert false report "Test done." severity note;
    assert false report "Test done." severity note;
    wait;

  end process;
end arch_1;


