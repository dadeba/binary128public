library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity fp_mul_128_112_15_6 is
  port (
    x : in std_logic_vector(127 downto 0);
    y : in std_logic_vector(127 downto 0);
    z : out std_logic_vector(127 downto 0);
    clk : in std_logic
  );
end fp_mul_128_112_15_6;


architecture source of fp_mul_128_112_15_6 is

component extract_128_112_15
  port (
    x : in std_logic_vector(127 downto 0);
    s : out std_logic;
    m : out std_logic_vector(112 downto 0);
    e : out std_logic_vector(14 downto 0)
  );
end component;

component rounding_force1_128_112_15
  port (
    m : in std_logic_vector(112 downto 0);
    e : in std_logic_vector(14 downto 0);
    u : in std_logic;
    r : in std_logic;
    s : in std_logic;
    mout : out std_logic_vector(112 downto 0);
    eout : out std_logic_vector(14 downto 0)
  );
end component;

component compose_128_112_15
  port (
    s : in std_logic;
    m : in std_logic_vector(112 downto 0);
    e : in std_logic_vector(14 downto 0);
    z : out std_logic_vector(127 downto 0);
    clk : in std_logic
  );
end component;

component int_mul_tr_l_113_5
  port (
    x : in std_logic_vector(112 downto 0);
    y : in std_logic_vector(112 downto 0);
    z : out std_logic_vector(225 downto 0);
    clk : in std_logic
  );
end component;

component delay_15_5
  port (
    i : in std_logic_vector(14 downto 0);
    o : out std_logic_vector(14 downto 0);
    clk : in std_logic
  );
end component;

component delay_1_5
  port (
    i : in std_logic;
    o : out std_logic;
    clk : in std_logic
  );
end component;



signal signx, signy, signz, sz : std_logic;
signal manx,  many,  manz,  mz : std_logic_vector(112 downto 0);
signal expx,  expy,  expz,  ez : std_logic_vector(14 downto 0);
signal zerox, zeroy, zero, zero_reg1 : std_logic;

signal bias : std_logic_vector(14 downto 0);
signal res  : std_logic_vector(225 downto 0);
signal c    : std_logic;

signal res1  : std_logic_vector(112 downto 0);
signal expz0 : std_logic_vector(14 downto 0);
signal expz1 : std_logic_vector(14 downto 0);
signal expzz : std_logic_vector(14 downto 0);
signal ulp, rbit, sbit : std_logic;
signal sbit00          : std_logic_vector(111 downto 0);

signal signz_reg1 : std_logic;
signal expz0_reg1 : std_logic_vector(14 downto 0);
signal expz1_reg1 : std_logic_vector(14 downto 0);
begin
  e0 : extract_128_112_15 port map ( x => x, s => signx, m => manx, e => expx);
  e1 : extract_128_112_15 port map ( x => y, s => signy, m => many, e => expy);
	
  signz <= signx xor signy;

  with expx select
    zerox <= '1' when "000000000000000", 
             '0' when others;

  with expy select
    zeroy <= '1' when "000000000000000", 
             '0' when others;
  zero <= zerox or zeroy; 

-- two's complement of bias for exponenet(15 bit)
  bias <= "100000000000001";

-- exponent addtion
  expz0 <= expx + expy + bias;

-- for overflow
  expz1 <= expz0 + '1';

--  res <= manx * many;
  mm : int_mul_tr_l_113_5 port map (x => manx, y => many, z => res, clk => clk);

  d1 : delay_15_5 port map (i => expz0, o => expz0_reg1, clk => clk);
  d2 : delay_15_5 port map (i => expz1, o => expz1_reg1, clk => clk);
  d3 : delay_1_5 port map (i => signz, o => signz_reg1, clk => clk);
  d4 : delay_1_5 port map (i => zero,  o => zero_reg1,  clk => clk);

  c <= res(225);

  with c select
    res1 <= res(225 downto 113) when '1', 
            res(224 downto 112) when others;

  with c select
    expzz <= expz1_reg1 when '1', 
             expz0_reg1 when others;

  ulp <= res1(0);

  with c select
    rbit <= res(112) when '1', 
            res(111) when others;

  with c select
    sbit00 <= res(111 downto 0) when '1', 
              '0'&res(110 downto 0) when others;
  
  with sbit00 select
    sbit <= '0' when "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
            '1' when others;

  r0 : rounding_force1_128_112_15 port map ( m => res1, e => expzz, u => ulp, r => rbit, s => sbit,
	                   mout => manz, eout=> expz);

  with zero_reg1 select
    sz <= signz_reg1 when '0',
          '0' when others;

  with zero_reg1 select
    mz <= manz when '0',
          "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" when others;

  with zero_reg1 select
    ez <= expz when '0',
          "000000000000000" when others;

  c0 : compose_128_112_15 port map (s => sz, m => mz, e => ez, z => z, clk => clk); 

end source;
