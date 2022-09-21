library ieee;
use ieee.std_logic_1164.all;

entity tb_onehot2_4bit is
-- empty
end tb_onehot2_4bit;

architecture arch_1 of tb_onehot2_4bit is

-- DUT component
component onehot2_4bit is
port ( 
  i_BIN : in std_logic_vector(1 downto 0); -- data input
  o_HOT : out std_logic_vector(3 downto 0)); -- data output
end component;

signal w_BIN : std_logic_vector(1 downto 0);
signal w_HOT : std_logic_vector(3 downto 0);

begin
  
  -- Connect DUT
  u_DUT: onehot2_4bit port map(
                            i_BIN => w_BIN,
                            o_HOT => w_HOT);
 
  process
  begin
    -- Select input channel A
    w_BIN <= "00";
    wait for 1 ns;
    assert(w_HOT="0001") report "Fail @ 00" severity error;
 
 
    w_BIN <= "01";
    wait for 1 ns;
    assert(w_HOT="0010") report "Fail @ 01" severity error;
   
   -- Select input channel B
    w_BIN <= "10";
    wait for 1 ns;
    assert(w_HOT="0100") report "Fail @ 10" severity error;
    
    w_BIN <= "11";
    wait for 1 ns;
    assert(w_HOT="1000") report "Fail @ 11" severity error;

    -- Clear inputs
    w_BIN <= "00";
    assert false report "Test done." severity note;
    wait;

  end process;
end arch_1;


