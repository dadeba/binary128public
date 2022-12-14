-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity int_sadder_v_115_2 is
  port (
    x : in std_logic_vector(114 downto 0);
    sx : in std_logic;
    y : in std_logic_vector(114 downto 0);
    sy : in std_logic;
    z : out std_logic_vector(114 downto 0);
    sz : out std_logic;
    clk : in std_logic
  );
end int_sadder_v_115_2;


architecture source of int_sadder_v_115_2 is

signal flag : std_logic;

signal flag1 : std_logic;
signal flag2 : std_logic;

signal c : std_logic_vector(1 downto 0);
signal c1, c2 : std_logic;
signal c1v, c2v : std_logic_vector(1 downto 0);
signal o1, o2 : std_logic_vector(114 downto 0);
signal res  : std_logic_vector(114 downto 0);
signal res0 : std_logic_vector(114 downto 0);
signal resp, resn : std_logic_vector(114 downto 0);
signal zzz : std_logic_vector(114 downto 0);
signal sign0, sign1 : std_logic;

signal o1_reg, o2_reg : std_logic_vector(114 downto 0);
signal c_reg : std_logic_vector(1 downto 0);
signal flag2_reg : std_logic;

begin
  flag1 <= sx xor sy;
  flag2 <= sx and sy;

  with (sx and flag1) select
    o1 <= (not x) when '1',
          x       when others;

  with (sx and flag1) select
    c1 <= '1' when '1',
          '0'  when others;

  with (sy and flag1) select
    o2 <= (not y) when '1',
          y       when others;

  with (sy and flag1) select
    c2 <= '1' when '1',
          '0'  when others;

  c1v <= '0'&c1;
  c2v <= '0'&c2;
  c <= c1v + c2v;

  o1_reg <= o1;
  o2_reg <= o2;
  c_reg  <= c;
  
--  res <= o1 + o2 + c;
  res0 <= o2_reg + c_reg;  -- 115bit + 2bit
  res  <= o1_reg + res0;   -- 115bit + 115bit

  process(clk) begin
   if(clk'event and clk='1') then
     resp <= res;
     resn <= (not res) + '1'; -- 115bit + 1bit
     sign0 <= res(114);
     flag2_reg <= flag2;
   end if;
  end process;
  
-- check if res is negative
--  with res(114) select
  with sign0 select
    zzz <= resn when '1', 
           resp when others;  

--  with res(114) select
--    sign0 <= '1' when '1', 
--             '0' when others;  
--  sign0 <= res(114);

-- if both inputs are negative
  with flag2_reg select
    sign1 <= '1'    when '1', 
              sign0 when others;  

  process(clk) begin
   if(clk'event and clk='1') then
     sz <= sign1;  
     z  <= zzz;
   end if;
  end process;

end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity swap_128 is
  port (
    f : in std_logic;
    x : in std_logic_vector(127 downto 0);
    y : in std_logic_vector(127 downto 0);
    xs : out std_logic_vector(127 downto 0);
    ys : out std_logic_vector(127 downto 0)
  );
end swap_128;


architecture source of swap_128 is
begin
  with f select
    xs <= y when '1',
          x when others;

  with f select
    ys <= x when '1',
          y when others;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_28_3 is
  port (
    i : in std_logic_vector(27 downto 0);
    o : out std_logic_vector(27 downto 0);
    clk : in std_logic
  );
end delay_28_3;


architecture source of delay_28_3 is
signal dummy1 : std_logic_vector(27 downto 0);
signal dummy2 : std_logic_vector(27 downto 0);
signal dummy3 : std_logic_vector(27 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      o <= dummy2;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_28_6 is
  port (
    i : in std_logic_vector(27 downto 0);
    o : out std_logic_vector(27 downto 0);
    clk : in std_logic
  );
end delay_28_6;


architecture source of delay_28_6 is
signal dummy1 : std_logic_vector(27 downto 0);
signal dummy2 : std_logic_vector(27 downto 0);
signal dummy3 : std_logic_vector(27 downto 0);
signal dummy4 : std_logic_vector(27 downto 0);
signal dummy5 : std_logic_vector(27 downto 0);
signal dummy6 : std_logic_vector(27 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      dummy5 <= dummy4;
      o <= dummy5;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity int_lshift_V is
  port (
    c : in std_logic_vector(6 downto 0);
    i : in std_logic_vector(113 downto 0);
    o : out std_logic_vector(113 downto 0)
  );
end int_lshift_V;


architecture source of int_lshift_V is
component vmux_114
  port (
    x : in std_logic_vector(113 downto 0);
    y : in std_logic_vector(113 downto 0);
    s : in std_logic;
    o : out std_logic_vector(113 downto 0)
  );
end component;



  signal A0 : std_logic_vector(113 downto 0);
  signal B0 : std_logic_vector(113 downto 0);
  signal out0 : std_logic_vector(113 downto 0);
  signal A1 : std_logic_vector(113 downto 0);
  signal B1 : std_logic_vector(113 downto 0);
  signal out1 : std_logic_vector(113 downto 0);
  signal A2 : std_logic_vector(113 downto 0);
  signal B2 : std_logic_vector(113 downto 0);
  signal out2 : std_logic_vector(113 downto 0);
  signal A3 : std_logic_vector(113 downto 0);
  signal B3 : std_logic_vector(113 downto 0);
  signal out3 : std_logic_vector(113 downto 0);
  signal A4 : std_logic_vector(113 downto 0);
  signal B4 : std_logic_vector(113 downto 0);
  signal out4 : std_logic_vector(113 downto 0);
  signal A5 : std_logic_vector(113 downto 0);
  signal B5 : std_logic_vector(113 downto 0);
  signal out5 : std_logic_vector(113 downto 0);
  signal A6 : std_logic_vector(113 downto 0);
  signal B6 : std_logic_vector(113 downto 0);
  signal out6 : std_logic_vector(113 downto 0);
begin
  A0 <= i;
  B0 <= i(112 downto 0) & '0';
  u0: vmux_114 port map (x => A0, y => B0, s => c(0), o => out0);

  A1 <= out0;
  B1 <= out0(111 downto 0) & "00";
  u1: vmux_114 port map (x => A1, y => B1, s => c(1), o => out1);

  A2 <= out1;
  B2 <= out1(109 downto 0) & "0000";
  u2: vmux_114 port map (x => A2, y => B2, s => c(2), o => out2);

  A3 <= out2;
  B3 <= out2(105 downto 0) & "00000000";
  u3: vmux_114 port map (x => A3, y => B3, s => c(3), o => out3);

  A4 <= out3;
  B4 <= out3(97 downto 0) & "0000000000000000";
  u4: vmux_114 port map (x => A4, y => B4, s => c(4), o => out4);

  A5 <= out4;
  B5 <= out4(81 downto 0) & "00000000000000000000000000000000";
  u5: vmux_114 port map (x => A5, y => B5, s => c(5), o => out5);

  A6 <= out5;
  B6 <= out5(49 downto 0) & "0000000000000000000000000000000000000000000000000000000000000000";
  u6: vmux_114 port map (x => A6, y => B6, s => c(6), o => out6);


  o <= out6;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity int_mul_54x41_3 is
  port (
    x : in std_logic_vector(53 downto 0);
    y : in std_logic_vector(40 downto 0);
    z : out std_logic_vector(94 downto 0);
    clk : in std_logic
  );
end int_mul_54x41_3;


architecture source of int_mul_54x41_3 is

signal xh : std_logic_vector(26 downto 0);
signal xl : std_logic_vector(26 downto 0);

signal yh : std_logic_vector(19 downto 0);
signal yl : std_logic_vector(20 downto 0);

signal xlyl : std_logic_vector(47 downto 0);
signal xlyh : std_logic_vector(46 downto 0);
signal xhyl : std_logic_vector(47 downto 0);
signal xhyh : std_logic_vector(46 downto 0);

signal xlyl_reg : std_logic_vector(47 downto 0);
signal xlyh_reg : std_logic_vector(46 downto 0);
signal xhyl_reg : std_logic_vector(47 downto 0);
signal xhyh_reg : std_logic_vector(46 downto 0);

signal sumll : std_logic_vector(94 downto 0); 
signal sumlh : std_logic_vector(94 downto 0); 
signal sumhl : std_logic_vector(94 downto 0); 
signal sumhh : std_logic_vector(94 downto 0);

signal sum0     : std_logic_vector(94 downto 0); 
signal sum1     : std_logic_vector(94 downto 0); 
signal sum0_reg : std_logic_vector(94 downto 0); 
signal sum1_reg : std_logic_vector(94 downto 0);

signal res : std_logic_vector(94 downto 0); 

begin
  xh <= x(53 downto 27);
  xl <= x(26 downto 0);

  yh <= y(40 downto 21);
  yl <= y(20 downto 0);
	
  xlyl <= xl*yl;
  xlyh <= xl*yh;
  xhyl <= xh*yl;
  xhyh <= xh*yh;

  process(clk) begin
    if(clk'event and clk='1') then
      xlyl_reg <= xlyl;
      xlyh_reg <= xlyh;
      xhyl_reg <= xhyl;
      xhyh_reg <= xhyh;
    end if;
  end process;

--   xy
  sumll <= "00000000000000000000000000000000000000000000000"&xlyl_reg;
  sumlh <= "000000000000000000000000000" & xlyh_reg &"000000000000000000000";
  sumhl <= "00000000000000000000" & xhyl_reg &"000000000000000000000000000";
  sumhh <= xhyh_reg&"000000000000000000000000000000000000000000000000";
  
  sum0 <= sumll+sumlh;
  sum1 <= sumhl+sumhh;

  process(clk) begin
    if(clk'event and clk='1') then
      sum0_reg <= sum0;
      sum1_reg <= sum1;
    end if;
  end process;

  res <= sum0_reg + sum1_reg;

  process(clk) begin
    if(clk'event and clk='1') then
      z <= res;
    end if;
  end process;

end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity int_mul_72x72_3 is
  port (
    x : in std_logic_vector(71 downto 0);
    y : in std_logic_vector(71 downto 0);
    z : out std_logic_vector(143 downto 0);
    clk : in std_logic
  );
end int_mul_72x72_3;


architecture source of int_mul_72x72_3 is

signal xh : std_logic_vector(35 downto 0);
signal xl : std_logic_vector(35 downto 0);

signal yh : std_logic_vector(35 downto 0);
signal yl : std_logic_vector(35 downto 0);

signal xlyl : std_logic_vector(71 downto 0);
signal xlyh : std_logic_vector(71 downto 0);
signal xhyl : std_logic_vector(71 downto 0);
signal xhyh : std_logic_vector(71 downto 0);

signal xlyl_reg : std_logic_vector(71 downto 0);
signal xlyh_reg : std_logic_vector(71 downto 0);
signal xhyl_reg : std_logic_vector(71 downto 0);
signal xhyh_reg : std_logic_vector(71 downto 0);

signal sumll : std_logic_vector(143 downto 0); 
signal sumlh : std_logic_vector(143 downto 0); 
signal sumhl : std_logic_vector(143 downto 0); 
signal sumhh : std_logic_vector(143 downto 0);

signal sum0     : std_logic_vector(143 downto 0); 
signal sum1     : std_logic_vector(143 downto 0); 
signal sum0_reg : std_logic_vector(143 downto 0); 
signal sum1_reg : std_logic_vector(143 downto 0);

signal res : std_logic_vector(143 downto 0); 

begin
  xh <= x(71 downto 36);
  xl <= x(35 downto 0);

  yh <= y(71 downto 36);
  yl <= y(35 downto 0);
	
  xlyl <= xl*yl;
  xlyh <= xl*yh;
  xhyl <= xh*yl;
  xhyh <= xh*yh;

  process(clk) begin
    if(clk'event and clk='1') then
      xlyl_reg <= xlyl;
      xlyh_reg <= xlyh;
      xhyl_reg <= xhyl;
      xhyh_reg <= xhyh;
    end if;
  end process;

--   xy
  sumll <= "000000000000000000000000000000000000000000000000000000000000000000000000"&xlyl_reg;
  sumlh <= "000000000000000000000000000000000000" & xlyh_reg &"000000000000000000000000000000000000";
  sumhl <= "000000000000000000000000000000000000" & xhyl_reg &"000000000000000000000000000000000000";
  sumhh <= xhyh_reg&"000000000000000000000000000000000000000000000000000000000000000000000000";
  
  sum0 <= sumll+sumlh;
  sum1 <= sumhl+sumhh;

  process(clk) begin
    if(clk'event and clk='1') then
      sum0_reg <= sum0;
      sum1_reg <= sum1;
    end if;
  end process;

  res <= sum0_reg + sum1_reg;

  process(clk) begin
    if(clk'event and clk='1') then
      z <= res;
    end if;
  end process;

end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity compose_128_112_15 is
  port (
    s : in std_logic;
    m : in std_logic_vector(112 downto 0);
    e : in std_logic_vector(14 downto 0);
    z : out std_logic_vector(127 downto 0);
    clk : in std_logic
  );
end compose_128_112_15;


architecture source of compose_128_112_15 is
begin
  process(clk) begin
   if(clk'event and clk='1') then
     z(127) <= s;
     z(126 downto 112) <= e;
     z(111 downto 0) <= m(111 downto 0);
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_31_3 is
  port (
    i : in std_logic_vector(30 downto 0);
    o : out std_logic_vector(30 downto 0);
    clk : in std_logic
  );
end delay_31_3;


architecture source of delay_31_3 is
signal dummy1 : std_logic_vector(30 downto 0);
signal dummy2 : std_logic_vector(30 downto 0);
signal dummy3 : std_logic_vector(30 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      o <= dummy2;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_1_8 is
  port (
    i : in std_logic;
    o : out std_logic;
    clk : in std_logic
  );
end delay_1_8;


architecture source of delay_1_8 is
signal dummy1 : std_logic;
signal dummy2 : std_logic;
signal dummy3 : std_logic;
signal dummy4 : std_logic;
signal dummy5 : std_logic;
signal dummy6 : std_logic;
signal dummy7 : std_logic;
signal dummy8 : std_logic;
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      dummy5 <= dummy4;
      dummy6 <= dummy5;
      dummy7 <= dummy6;
      o <= dummy7;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_1_2 is
  port (
    i : in std_logic;
    o : out std_logic;
    clk : in std_logic
  );
end delay_1_2;


architecture source of delay_1_2 is
signal dummy1 : std_logic;
signal dummy2 : std_logic;
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      o <= dummy1;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_1_5 is
  port (
    i : in std_logic;
    o : out std_logic;
    clk : in std_logic
  );
end delay_1_5;


architecture source of delay_1_5 is
signal dummy1 : std_logic;
signal dummy2 : std_logic;
signal dummy3 : std_logic;
signal dummy4 : std_logic;
signal dummy5 : std_logic;
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      o <= dummy4;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity int_addsub_116_1 is
  port (
    x : in std_logic_vector(115 downto 0);
    y : in std_logic_vector(115 downto 0);
    f : in std_logic;
    z : out std_logic_vector(115 downto 0);
    clk : in std_logic
  );
end int_addsub_116_1;


architecture source of int_addsub_116_1 is

signal xx, yy : std_logic_vector(115 downto 0);
begin
  xx <= x;

  with f select
    yy <= (not y) when '1',
               y  when others;

  z <= xx + yy + f;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity rounding_force1_41_25_15 is
  port (
    m : in std_logic_vector(25 downto 0);
    e : in std_logic_vector(14 downto 0);
    u : in std_logic;
    r : in std_logic;
    s : in std_logic;
    mout : out std_logic_vector(25 downto 0);
    eout : out std_logic_vector(14 downto 0)
  );
end rounding_force1_41_25_15;


architecture source of rounding_force1_41_25_15 is
begin
  mout <= m(25 downto 1) & (u or r or s);
  eout <= e;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity all_or_16 is
  port (
    x : in std_logic_vector(15 downto 0);
    z : out std_logic
  );
end all_or_16;


architecture source of all_or_16 is
begin
  z <= x(0) or x(1) or x(2) or x(3) or x(4) or x(5) or x(6) or x(7) or x(8) or x(9) or x(10) or x(11) or x(12) or x(13) or x(14) or x(15);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_128_17 is
  port (
    i : in std_logic_vector(127 downto 0);
    o : out std_logic_vector(127 downto 0);
    clk : in std_logic
  );
end delay_128_17;


architecture source of delay_128_17 is
signal dummy1 : std_logic_vector(127 downto 0);
signal dummy2 : std_logic_vector(127 downto 0);
signal dummy3 : std_logic_vector(127 downto 0);
signal dummy4 : std_logic_vector(127 downto 0);
signal dummy5 : std_logic_vector(127 downto 0);
signal dummy6 : std_logic_vector(127 downto 0);
signal dummy7 : std_logic_vector(127 downto 0);
signal dummy8 : std_logic_vector(127 downto 0);
signal dummy9 : std_logic_vector(127 downto 0);
signal dummy10 : std_logic_vector(127 downto 0);
signal dummy11 : std_logic_vector(127 downto 0);
signal dummy12 : std_logic_vector(127 downto 0);
signal dummy13 : std_logic_vector(127 downto 0);
signal dummy14 : std_logic_vector(127 downto 0);
signal dummy15 : std_logic_vector(127 downto 0);
signal dummy16 : std_logic_vector(127 downto 0);
signal dummy17 : std_logic_vector(127 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      dummy5 <= dummy4;
      dummy6 <= dummy5;
      dummy7 <= dummy6;
      dummy8 <= dummy7;
      dummy9 <= dummy8;
      dummy10 <= dummy9;
      dummy11 <= dummy10;
      dummy12 <= dummy11;
      dummy13 <= dummy12;
      dummy14 <= dummy13;
      dummy15 <= dummy14;
      dummy16 <= dummy15;
      o <= dummy16;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity int_mul_tr_l_113_5 is
  port (
    x : in std_logic_vector(112 downto 0);
    y : in std_logic_vector(112 downto 0);
    z : out std_logic_vector(225 downto 0);
    clk : in std_logic
  );
end int_mul_tr_l_113_5;


architecture source of int_mul_tr_l_113_5 is

component int_mul_72x72_3
  port (
    x : in std_logic_vector(71 downto 0);
    y : in std_logic_vector(71 downto 0);
    z : out std_logic_vector(143 downto 0);
    clk : in std_logic
  );
end component;

component int_mul_54x41_3
  port (
    x : in std_logic_vector(53 downto 0);
    y : in std_logic_vector(40 downto 0);
    z : out std_logic_vector(94 downto 0);
    clk : in std_logic
  );
end component;



signal x1 : std_logic_vector(71 downto 0);
signal x2 : std_logic_vector(40 downto 0);
signal x3 : std_logic_vector(53 downto 0);

signal y1 : std_logic_vector(71 downto 0);
signal y2 : std_logic_vector(40 downto 0);
signal y3 : std_logic_vector(53 downto 0);

signal x1y1 : std_logic_vector(225 downto 0);
signal x2y3 : std_logic_vector(225 downto 0);
signal x3y2 : std_logic_vector(225 downto 0);

signal x2y3x3y2 : std_logic_vector(225 downto 0);
signal x1y1_reg : std_logic_vector(225 downto 0);

signal res_l : std_logic_vector(225 downto 0);

begin
-- based on KFCR MP4
  x1 <= x(112 downto 41); -- 72 bit
  x2 <= x(40 downto 0); -- 41 bit
  x3 <= x(112 downto 59); -- 54 bit

  y1 <= y(112 downto 41);
  y2 <= y(40 downto 0);
  y3 <= y(112 downto 59);

-- 2 stage 
  mm1 : int_mul_72x72_3 port map (x => x1, y => y1, 
                                  z => x1y1(225 downto 82), clk => clk);

  mm2 : int_mul_54x41_3 port map (x => x3, y => y2, 
                                  z => x2y3(153 downto 59),
                                  clk => clk);

  mm3 : int_mul_54x41_3 port map (x => y3, y => x2,
                                  z => x3y2(153 downto 59),
                                  clk => clk);

  x1y1(81 downto 0) <= conv_std_logic_vector(0,82);

  x2y3(225 downto 154) <= conv_std_logic_vector(0,72);
  x2y3(58 downto 0) <= conv_std_logic_vector(0,59);

  x3y2(225 downto 154) <= conv_std_logic_vector(0,72);
  x3y2(58 downto 0) <= conv_std_logic_vector(0,59);

  process(clk) begin
    if(clk'event and clk='1') then
       x2y3x3y2 <= x2y3 + x3y2;
       x1y1_reg <= x1y1;
    end if;
  end process;

  process(clk) begin
    if(clk'event and clk='1') then
       z <= x1y1_reg + x2y3x3y2;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity underflow_26_15 is
  port (
    f : in std_logic;
    m1 : in std_logic_vector(25 downto 0);
    e1 : in std_logic_vector(14 downto 0);
    u1 : in std_logic;
    r1 : in std_logic;
    s1 : in std_logic;
    m2 : in std_logic_vector(25 downto 0);
    e2 : in std_logic_vector(14 downto 0);
    u2 : in std_logic;
    r2 : in std_logic;
    s2 : in std_logic;
    m : out std_logic_vector(25 downto 0);
    e : out std_logic_vector(14 downto 0);
    u : out std_logic;
    r : out std_logic;
    s : out std_logic
  );
end underflow_26_15;


architecture source of underflow_26_15 is
begin
  with f select
    m <= m1 when '1',
         m2 when others;

  with f select
    e <= e1 when '1',
         e2 when others;

  with f select
    u <= u1 when '1',
         u2 when others;

  with f select
    r <= r1 when '1',
         r2 when others;

  with f select
    s <= s1 when '1',
         s2 when others;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity extract_41_25_15 is
  port (
    x : in std_logic_vector(40 downto 0);
    s : out std_logic;
    m : out std_logic_vector(25 downto 0);
    e : out std_logic_vector(14 downto 0)
  );
end extract_41_25_15;


architecture source of extract_41_25_15 is
begin
  s <= x(40);
  e <= x(39 downto 25);

-- flip a hidden bit
  m(25) <= '1';
  m(24 downto 0) <= x(24 downto 0);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity int_pencx_114_15_0 is
  port (
    i : in std_logic_vector(113 downto 0);
    ss : out std_logic_vector(14 downto 0)
  );
end int_pencx_114_15_0;


architecture source of int_pencx_114_15_0 is
begin
  process(i) begin
      if (i(113) = '1') then
        ss <= "000000000000000";
      elsif (i(112) = '1') then
        ss <= "000000000000001";
      elsif (i(111) = '1') then
        ss <= "000000000000010";
      elsif (i(110) = '1') then
        ss <= "000000000000011";
      elsif (i(109) = '1') then
        ss <= "000000000000100";
      elsif (i(108) = '1') then
        ss <= "000000000000101";
      elsif (i(107) = '1') then
        ss <= "000000000000110";
      elsif (i(106) = '1') then
        ss <= "000000000000111";
      elsif (i(105) = '1') then
        ss <= "000000000001000";
      elsif (i(104) = '1') then
        ss <= "000000000001001";
      elsif (i(103) = '1') then
        ss <= "000000000001010";
      elsif (i(102) = '1') then
        ss <= "000000000001011";
      elsif (i(101) = '1') then
        ss <= "000000000001100";
      elsif (i(100) = '1') then
        ss <= "000000000001101";
      elsif (i(99) = '1') then
        ss <= "000000000001110";
      elsif (i(98) = '1') then
        ss <= "000000000001111";
      elsif (i(97) = '1') then
        ss <= "000000000010000";
      elsif (i(96) = '1') then
        ss <= "000000000010001";
      elsif (i(95) = '1') then
        ss <= "000000000010010";
      elsif (i(94) = '1') then
        ss <= "000000000010011";
      elsif (i(93) = '1') then
        ss <= "000000000010100";
      elsif (i(92) = '1') then
        ss <= "000000000010101";
      elsif (i(91) = '1') then
        ss <= "000000000010110";
      elsif (i(90) = '1') then
        ss <= "000000000010111";
      elsif (i(89) = '1') then
        ss <= "000000000011000";
      elsif (i(88) = '1') then
        ss <= "000000000011001";
      elsif (i(87) = '1') then
        ss <= "000000000011010";
      elsif (i(86) = '1') then
        ss <= "000000000011011";
      elsif (i(85) = '1') then
        ss <= "000000000011100";
      elsif (i(84) = '1') then
        ss <= "000000000011101";
      elsif (i(83) = '1') then
        ss <= "000000000011110";
      elsif (i(82) = '1') then
        ss <= "000000000011111";
      elsif (i(81) = '1') then
        ss <= "000000000100000";
      elsif (i(80) = '1') then
        ss <= "000000000100001";
      elsif (i(79) = '1') then
        ss <= "000000000100010";
      elsif (i(78) = '1') then
        ss <= "000000000100011";
      elsif (i(77) = '1') then
        ss <= "000000000100100";
      elsif (i(76) = '1') then
        ss <= "000000000100101";
      elsif (i(75) = '1') then
        ss <= "000000000100110";
      elsif (i(74) = '1') then
        ss <= "000000000100111";
      elsif (i(73) = '1') then
        ss <= "000000000101000";
      elsif (i(72) = '1') then
        ss <= "000000000101001";
      elsif (i(71) = '1') then
        ss <= "000000000101010";
      elsif (i(70) = '1') then
        ss <= "000000000101011";
      elsif (i(69) = '1') then
        ss <= "000000000101100";
      elsif (i(68) = '1') then
        ss <= "000000000101101";
      elsif (i(67) = '1') then
        ss <= "000000000101110";
      elsif (i(66) = '1') then
        ss <= "000000000101111";
      elsif (i(65) = '1') then
        ss <= "000000000110000";
      elsif (i(64) = '1') then
        ss <= "000000000110001";
      elsif (i(63) = '1') then
        ss <= "000000000110010";
      elsif (i(62) = '1') then
        ss <= "000000000110011";
      elsif (i(61) = '1') then
        ss <= "000000000110100";
      elsif (i(60) = '1') then
        ss <= "000000000110101";
      elsif (i(59) = '1') then
        ss <= "000000000110110";
      elsif (i(58) = '1') then
        ss <= "000000000110111";
      elsif (i(57) = '1') then
        ss <= "000000000111000";
      elsif (i(56) = '1') then
        ss <= "000000000111001";
      elsif (i(55) = '1') then
        ss <= "000000000111010";
      elsif (i(54) = '1') then
        ss <= "000000000111011";
      elsif (i(53) = '1') then
        ss <= "000000000111100";
      elsif (i(52) = '1') then
        ss <= "000000000111101";
      elsif (i(51) = '1') then
        ss <= "000000000111110";
      elsif (i(50) = '1') then
        ss <= "000000000111111";
      elsif (i(49) = '1') then
        ss <= "000000001000000";
      elsif (i(48) = '1') then
        ss <= "000000001000001";
      elsif (i(47) = '1') then
        ss <= "000000001000010";
      elsif (i(46) = '1') then
        ss <= "000000001000011";
      elsif (i(45) = '1') then
        ss <= "000000001000100";
      elsif (i(44) = '1') then
        ss <= "000000001000101";
      elsif (i(43) = '1') then
        ss <= "000000001000110";
      elsif (i(42) = '1') then
        ss <= "000000001000111";
      elsif (i(41) = '1') then
        ss <= "000000001001000";
      elsif (i(40) = '1') then
        ss <= "000000001001001";
      elsif (i(39) = '1') then
        ss <= "000000001001010";
      elsif (i(38) = '1') then
        ss <= "000000001001011";
      elsif (i(37) = '1') then
        ss <= "000000001001100";
      elsif (i(36) = '1') then
        ss <= "000000001001101";
      elsif (i(35) = '1') then
        ss <= "000000001001110";
      elsif (i(34) = '1') then
        ss <= "000000001001111";
      elsif (i(33) = '1') then
        ss <= "000000001010000";
      elsif (i(32) = '1') then
        ss <= "000000001010001";
      elsif (i(31) = '1') then
        ss <= "000000001010010";
      elsif (i(30) = '1') then
        ss <= "000000001010011";
      elsif (i(29) = '1') then
        ss <= "000000001010100";
      elsif (i(28) = '1') then
        ss <= "000000001010101";
      elsif (i(27) = '1') then
        ss <= "000000001010110";
      elsif (i(26) = '1') then
        ss <= "000000001010111";
      elsif (i(25) = '1') then
        ss <= "000000001011000";
      elsif (i(24) = '1') then
        ss <= "000000001011001";
      elsif (i(23) = '1') then
        ss <= "000000001011010";
      elsif (i(22) = '1') then
        ss <= "000000001011011";
      elsif (i(21) = '1') then
        ss <= "000000001011100";
      elsif (i(20) = '1') then
        ss <= "000000001011101";
      elsif (i(19) = '1') then
        ss <= "000000001011110";
      elsif (i(18) = '1') then
        ss <= "000000001011111";
      elsif (i(17) = '1') then
        ss <= "000000001100000";
      elsif (i(16) = '1') then
        ss <= "000000001100001";
      elsif (i(15) = '1') then
        ss <= "000000001100010";
      elsif (i(14) = '1') then
        ss <= "000000001100011";
      elsif (i(13) = '1') then
        ss <= "000000001100100";
      elsif (i(12) = '1') then
        ss <= "000000001100101";
      elsif (i(11) = '1') then
        ss <= "000000001100110";
      elsif (i(10) = '1') then
        ss <= "000000001100111";
      elsif (i(9) = '1') then
        ss <= "000000001101000";
      elsif (i(8) = '1') then
        ss <= "000000001101001";
      elsif (i(7) = '1') then
        ss <= "000000001101010";
      elsif (i(6) = '1') then
        ss <= "000000001101011";
      elsif (i(5) = '1') then
        ss <= "000000001101100";
      elsif (i(4) = '1') then
        ss <= "000000001101101";
      elsif (i(3) = '1') then
        ss <= "000000001101110";
      elsif (i(2) = '1') then
        ss <= "000000001101111";
      elsif (i(1) = '1') then
        ss <= "000000001110000";
      else
        ss <= "000000001110001";
      end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity int_rshift_V is
  port (
    c : in std_logic_vector(6 downto 0);
    i : in std_logic_vector(112 downto 0);
    o : out std_logic_vector(112 downto 0);
    s : out std_logic
  );
end int_rshift_V;


architecture source of int_rshift_V is
component vmux_113
  port (
    x : in std_logic_vector(112 downto 0);
    y : in std_logic_vector(112 downto 0);
    s : in std_logic;
    o : out std_logic_vector(112 downto 0)
  );
end component;

component all_or_2
  port (
    x : in std_logic_vector(1 downto 0);
    z : out std_logic
  );
end component;

component all_or_4
  port (
    x : in std_logic_vector(3 downto 0);
    z : out std_logic
  );
end component;

component all_or_8
  port (
    x : in std_logic_vector(7 downto 0);
    z : out std_logic
  );
end component;

component all_or_16
  port (
    x : in std_logic_vector(15 downto 0);
    z : out std_logic
  );
end component;

component all_or_32
  port (
    x : in std_logic_vector(31 downto 0);
    z : out std_logic
  );
end component;

component all_or_64
  port (
    x : in std_logic_vector(63 downto 0);
    z : out std_logic
  );
end component;

component all_or_128
  port (
    x : in std_logic_vector(127 downto 0);
    z : out std_logic
  );
end component;



  signal A0 : std_logic_vector(112 downto 0);
  signal B0 : std_logic_vector(112 downto 0);
  signal SS0 : std_logic;
  signal out0 : std_logic_vector(112 downto 0);
  signal A1 : std_logic_vector(112 downto 0);
  signal B1 : std_logic_vector(112 downto 0);
  signal SS1 : std_logic;
  signal out1 : std_logic_vector(112 downto 0);
  signal A2 : std_logic_vector(112 downto 0);
  signal B2 : std_logic_vector(112 downto 0);
  signal SS2 : std_logic;
  signal out2 : std_logic_vector(112 downto 0);
  signal A3 : std_logic_vector(112 downto 0);
  signal B3 : std_logic_vector(112 downto 0);
  signal SS3 : std_logic;
  signal out3 : std_logic_vector(112 downto 0);
  signal A4 : std_logic_vector(112 downto 0);
  signal B4 : std_logic_vector(112 downto 0);
  signal SS4 : std_logic;
  signal out4 : std_logic_vector(112 downto 0);
  signal A5 : std_logic_vector(112 downto 0);
  signal B5 : std_logic_vector(112 downto 0);
  signal SS5 : std_logic;
  signal out5 : std_logic_vector(112 downto 0);
  signal A6 : std_logic_vector(112 downto 0);
  signal B6 : std_logic_vector(112 downto 0);
  signal SS6 : std_logic;
  signal out6 : std_logic_vector(112 downto 0);
  signal SA : std_logic_vector(6 downto 0);
begin
  A0 <= i;
  B0 <= "0" & i(112 downto 1);
  SA(0) <= i(0) and c(0);
  u0: vmux_113 port map (x => A0, y => B0, s => c(0), o => out0);

  A1 <= out0;
  B1 <= "00" & out0(112 downto 2);
  x1: all_or_2 port map (x => out0(1 downto 0), z => SS1);
  SA(1) <= SS1 and c(1);
  u1: vmux_113 port map (x => A1, y => B1, s => c(1), o => out1);

  A2 <= out1;
  B2 <= "0000" & out1(112 downto 4);
  x2: all_or_4 port map (x => out1(3 downto 0), z => SS2);
  SA(2) <= SS2 and c(2);
  u2: vmux_113 port map (x => A2, y => B2, s => c(2), o => out2);

  A3 <= out2;
  B3 <= "00000000" & out2(112 downto 8);
  x3: all_or_8 port map (x => out2(7 downto 0), z => SS3);
  SA(3) <= SS3 and c(3);
  u3: vmux_113 port map (x => A3, y => B3, s => c(3), o => out3);

  A4 <= out3;
  B4 <= "0000000000000000" & out3(112 downto 16);
  x4: all_or_16 port map (x => out3(15 downto 0), z => SS4);
  SA(4) <= SS4 and c(4);
  u4: vmux_113 port map (x => A4, y => B4, s => c(4), o => out4);

  A5 <= out4;
  B5 <= "00000000000000000000000000000000" & out4(112 downto 32);
  x5: all_or_32 port map (x => out4(31 downto 0), z => SS5);
  SA(5) <= SS5 and c(5);
  u5: vmux_113 port map (x => A5, y => B5, s => c(5), o => out5);

  A6 <= out5;
  B6 <= "0000000000000000000000000000000000000000000000000000000000000000" & out5(112 downto 64);
  x6: all_or_64 port map (x => out5(63 downto 0), z => SS6);
  SA(6) <= SS6 and c(6);
  u6: vmux_113 port map (x => A6, y => B6, s => c(6), o => out6);


  o <= out6;
  s <= SA(0) or SA(1) or SA(2) or SA(3) or SA(4) or SA(5) or SA(6);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity all_or_64 is
  port (
    x : in std_logic_vector(63 downto 0);
    z : out std_logic
  );
end all_or_64;


architecture source of all_or_64 is
begin
  z <= x(0) or x(1) or x(2) or x(3) or x(4) or x(5) or x(6) or x(7) or x(8) or x(9) or x(10) or x(11) or x(12) or x(13) or x(14) or x(15) or x(16) or x(17) or x(18) or x(19) or x(20) or x(21) or x(22) or x(23) or x(24) or x(25) or x(26) or x(27) or x(28) or x(29) or x(30) or x(31) or x(32) or x(33) or x(34) or x(35) or x(36) or x(37) or x(38) or x(39) or x(40) or x(41) or x(42) or x(43) or x(44) or x(45) or x(46) or x(47) or x(48) or x(49) or x(50) or x(51) or x(52) or x(53) or x(54) or x(55) or x(56) or x(57) or x(58) or x(59) or x(60) or x(61) or x(62) or x(63);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity all_or_128 is
  port (
    x : in std_logic_vector(127 downto 0);
    z : out std_logic
  );
end all_or_128;


architecture source of all_or_128 is
begin
  z <= x(0) or x(1) or x(2) or x(3) or x(4) or x(5) or x(6) or x(7) or x(8) or x(9) or x(10) or x(11) or x(12) or x(13) or x(14) or x(15) or x(16) or x(17) or x(18) or x(19) or x(20) or x(21) or x(22) or x(23) or x(24) or x(25) or x(26) or x(27) or x(28) or x(29) or x(30) or x(31) or x(32) or x(33) or x(34) or x(35) or x(36) or x(37) or x(38) or x(39) or x(40) or x(41) or x(42) or x(43) or x(44) or x(45) or x(46) or x(47) or x(48) or x(49) or x(50) or x(51) or x(52) or x(53) or x(54) or x(55) or x(56) or x(57) or x(58) or x(59) or x(60) or x(61) or x(62) or x(63) or x(64) or x(65) or x(66) or x(67) or x(68) or x(69) or x(70) or x(71) or x(72) or x(73) or x(74) or x(75) or x(76) or x(77) or x(78) or x(79) or x(80) or x(81) or x(82) or x(83) or x(84) or x(85) or x(86) or x(87) or x(88) or x(89) or x(90) or x(91) or x(92) or x(93) or x(94) or x(95) or x(96) or x(97) or x(98) or x(99) or x(100) or x(101) or x(102) or x(103) or x(104) or x(105) or x(106) or x(107) or x(108) or x(109) or x(110) or x(111) or x(112) or x(113) or x(114) or x(115) or x(116) or x(117) or x(118) or x(119) or x(120) or x(121) or x(122) or x(123) or x(124) or x(125) or x(126) or x(127);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity rounding_force1_128_112_15 is
  port (
    m : in std_logic_vector(112 downto 0);
    e : in std_logic_vector(14 downto 0);
    u : in std_logic;
    r : in std_logic;
    s : in std_logic;
    mout : out std_logic_vector(112 downto 0);
    eout : out std_logic_vector(14 downto 0)
  );
end rounding_force1_128_112_15;


architecture source of rounding_force1_128_112_15 is
begin
  mout <= m(112 downto 1) & (u or r or s);
  eout <= e;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity all_or_2 is
  port (
    x : in std_logic_vector(1 downto 0);
    z : out std_logic
  );
end all_or_2;


architecture source of all_or_2 is
begin
  z <= x(0) or x(1);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity all_or_4 is
  port (
    x : in std_logic_vector(3 downto 0);
    z : out std_logic
  );
end all_or_4;


architecture source of all_or_4 is
begin
  z <= x(0) or x(1) or x(2) or x(3);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity all_or_8 is
  port (
    x : in std_logic_vector(7 downto 0);
    z : out std_logic
  );
end all_or_8;


architecture source of all_or_8 is
begin
  z <= x(0) or x(1) or x(2) or x(3) or x(4) or x(5) or x(6) or x(7);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity all_or_32 is
  port (
    x : in std_logic_vector(31 downto 0);
    z : out std_logic
  );
end all_or_32;


architecture source of all_or_32 is
begin
  z <= x(0) or x(1) or x(2) or x(3) or x(4) or x(5) or x(6) or x(7) or x(8) or x(9) or x(10) or x(11) or x(12) or x(13) or x(14) or x(15) or x(16) or x(17) or x(18) or x(19) or x(20) or x(21) or x(22) or x(23) or x(24) or x(25) or x(26) or x(27) or x(28) or x(29) or x(30) or x(31);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity extract_128_112_15 is
  port (
    x : in std_logic_vector(127 downto 0);
    s : out std_logic;
    m : out std_logic_vector(112 downto 0);
    e : out std_logic_vector(14 downto 0)
  );
end extract_128_112_15;


architecture source of extract_128_112_15 is
begin
  s <= x(127);
  e <= x(126 downto 112);

-- flip a hidden bit
  m(112) <= '1';
  m(111 downto 0) <= x(111 downto 0);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_15_8 is
  port (
    i : in std_logic_vector(14 downto 0);
    o : out std_logic_vector(14 downto 0);
    clk : in std_logic
  );
end delay_15_8;


architecture source of delay_15_8 is
signal dummy1 : std_logic_vector(14 downto 0);
signal dummy2 : std_logic_vector(14 downto 0);
signal dummy3 : std_logic_vector(14 downto 0);
signal dummy4 : std_logic_vector(14 downto 0);
signal dummy5 : std_logic_vector(14 downto 0);
signal dummy6 : std_logic_vector(14 downto 0);
signal dummy7 : std_logic_vector(14 downto 0);
signal dummy8 : std_logic_vector(14 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      dummy5 <= dummy4;
      dummy6 <= dummy5;
      dummy7 <= dummy6;
      o <= dummy7;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity vmux_113 is
  port (
    x : in std_logic_vector(112 downto 0);
    y : in std_logic_vector(112 downto 0);
    s : in std_logic;
    o : out std_logic_vector(112 downto 0)
  );
end vmux_113;


architecture source of vmux_113 is
  component mux21  port (
    A0 : in  std_logic;
    A1 : in  std_logic;
    S  : in  std_logic;
    Z  : out std_logic
  );
  end component;
begin
  u0: mux21 port map (A0 => x(0), A1 => y(0), S => s, Z => o(0));
  u1: mux21 port map (A0 => x(1), A1 => y(1), S => s, Z => o(1));
  u2: mux21 port map (A0 => x(2), A1 => y(2), S => s, Z => o(2));
  u3: mux21 port map (A0 => x(3), A1 => y(3), S => s, Z => o(3));
  u4: mux21 port map (A0 => x(4), A1 => y(4), S => s, Z => o(4));
  u5: mux21 port map (A0 => x(5), A1 => y(5), S => s, Z => o(5));
  u6: mux21 port map (A0 => x(6), A1 => y(6), S => s, Z => o(6));
  u7: mux21 port map (A0 => x(7), A1 => y(7), S => s, Z => o(7));
  u8: mux21 port map (A0 => x(8), A1 => y(8), S => s, Z => o(8));
  u9: mux21 port map (A0 => x(9), A1 => y(9), S => s, Z => o(9));
  u10: mux21 port map (A0 => x(10), A1 => y(10), S => s, Z => o(10));
  u11: mux21 port map (A0 => x(11), A1 => y(11), S => s, Z => o(11));
  u12: mux21 port map (A0 => x(12), A1 => y(12), S => s, Z => o(12));
  u13: mux21 port map (A0 => x(13), A1 => y(13), S => s, Z => o(13));
  u14: mux21 port map (A0 => x(14), A1 => y(14), S => s, Z => o(14));
  u15: mux21 port map (A0 => x(15), A1 => y(15), S => s, Z => o(15));
  u16: mux21 port map (A0 => x(16), A1 => y(16), S => s, Z => o(16));
  u17: mux21 port map (A0 => x(17), A1 => y(17), S => s, Z => o(17));
  u18: mux21 port map (A0 => x(18), A1 => y(18), S => s, Z => o(18));
  u19: mux21 port map (A0 => x(19), A1 => y(19), S => s, Z => o(19));
  u20: mux21 port map (A0 => x(20), A1 => y(20), S => s, Z => o(20));
  u21: mux21 port map (A0 => x(21), A1 => y(21), S => s, Z => o(21));
  u22: mux21 port map (A0 => x(22), A1 => y(22), S => s, Z => o(22));
  u23: mux21 port map (A0 => x(23), A1 => y(23), S => s, Z => o(23));
  u24: mux21 port map (A0 => x(24), A1 => y(24), S => s, Z => o(24));
  u25: mux21 port map (A0 => x(25), A1 => y(25), S => s, Z => o(25));
  u26: mux21 port map (A0 => x(26), A1 => y(26), S => s, Z => o(26));
  u27: mux21 port map (A0 => x(27), A1 => y(27), S => s, Z => o(27));
  u28: mux21 port map (A0 => x(28), A1 => y(28), S => s, Z => o(28));
  u29: mux21 port map (A0 => x(29), A1 => y(29), S => s, Z => o(29));
  u30: mux21 port map (A0 => x(30), A1 => y(30), S => s, Z => o(30));
  u31: mux21 port map (A0 => x(31), A1 => y(31), S => s, Z => o(31));
  u32: mux21 port map (A0 => x(32), A1 => y(32), S => s, Z => o(32));
  u33: mux21 port map (A0 => x(33), A1 => y(33), S => s, Z => o(33));
  u34: mux21 port map (A0 => x(34), A1 => y(34), S => s, Z => o(34));
  u35: mux21 port map (A0 => x(35), A1 => y(35), S => s, Z => o(35));
  u36: mux21 port map (A0 => x(36), A1 => y(36), S => s, Z => o(36));
  u37: mux21 port map (A0 => x(37), A1 => y(37), S => s, Z => o(37));
  u38: mux21 port map (A0 => x(38), A1 => y(38), S => s, Z => o(38));
  u39: mux21 port map (A0 => x(39), A1 => y(39), S => s, Z => o(39));
  u40: mux21 port map (A0 => x(40), A1 => y(40), S => s, Z => o(40));
  u41: mux21 port map (A0 => x(41), A1 => y(41), S => s, Z => o(41));
  u42: mux21 port map (A0 => x(42), A1 => y(42), S => s, Z => o(42));
  u43: mux21 port map (A0 => x(43), A1 => y(43), S => s, Z => o(43));
  u44: mux21 port map (A0 => x(44), A1 => y(44), S => s, Z => o(44));
  u45: mux21 port map (A0 => x(45), A1 => y(45), S => s, Z => o(45));
  u46: mux21 port map (A0 => x(46), A1 => y(46), S => s, Z => o(46));
  u47: mux21 port map (A0 => x(47), A1 => y(47), S => s, Z => o(47));
  u48: mux21 port map (A0 => x(48), A1 => y(48), S => s, Z => o(48));
  u49: mux21 port map (A0 => x(49), A1 => y(49), S => s, Z => o(49));
  u50: mux21 port map (A0 => x(50), A1 => y(50), S => s, Z => o(50));
  u51: mux21 port map (A0 => x(51), A1 => y(51), S => s, Z => o(51));
  u52: mux21 port map (A0 => x(52), A1 => y(52), S => s, Z => o(52));
  u53: mux21 port map (A0 => x(53), A1 => y(53), S => s, Z => o(53));
  u54: mux21 port map (A0 => x(54), A1 => y(54), S => s, Z => o(54));
  u55: mux21 port map (A0 => x(55), A1 => y(55), S => s, Z => o(55));
  u56: mux21 port map (A0 => x(56), A1 => y(56), S => s, Z => o(56));
  u57: mux21 port map (A0 => x(57), A1 => y(57), S => s, Z => o(57));
  u58: mux21 port map (A0 => x(58), A1 => y(58), S => s, Z => o(58));
  u59: mux21 port map (A0 => x(59), A1 => y(59), S => s, Z => o(59));
  u60: mux21 port map (A0 => x(60), A1 => y(60), S => s, Z => o(60));
  u61: mux21 port map (A0 => x(61), A1 => y(61), S => s, Z => o(61));
  u62: mux21 port map (A0 => x(62), A1 => y(62), S => s, Z => o(62));
  u63: mux21 port map (A0 => x(63), A1 => y(63), S => s, Z => o(63));
  u64: mux21 port map (A0 => x(64), A1 => y(64), S => s, Z => o(64));
  u65: mux21 port map (A0 => x(65), A1 => y(65), S => s, Z => o(65));
  u66: mux21 port map (A0 => x(66), A1 => y(66), S => s, Z => o(66));
  u67: mux21 port map (A0 => x(67), A1 => y(67), S => s, Z => o(67));
  u68: mux21 port map (A0 => x(68), A1 => y(68), S => s, Z => o(68));
  u69: mux21 port map (A0 => x(69), A1 => y(69), S => s, Z => o(69));
  u70: mux21 port map (A0 => x(70), A1 => y(70), S => s, Z => o(70));
  u71: mux21 port map (A0 => x(71), A1 => y(71), S => s, Z => o(71));
  u72: mux21 port map (A0 => x(72), A1 => y(72), S => s, Z => o(72));
  u73: mux21 port map (A0 => x(73), A1 => y(73), S => s, Z => o(73));
  u74: mux21 port map (A0 => x(74), A1 => y(74), S => s, Z => o(74));
  u75: mux21 port map (A0 => x(75), A1 => y(75), S => s, Z => o(75));
  u76: mux21 port map (A0 => x(76), A1 => y(76), S => s, Z => o(76));
  u77: mux21 port map (A0 => x(77), A1 => y(77), S => s, Z => o(77));
  u78: mux21 port map (A0 => x(78), A1 => y(78), S => s, Z => o(78));
  u79: mux21 port map (A0 => x(79), A1 => y(79), S => s, Z => o(79));
  u80: mux21 port map (A0 => x(80), A1 => y(80), S => s, Z => o(80));
  u81: mux21 port map (A0 => x(81), A1 => y(81), S => s, Z => o(81));
  u82: mux21 port map (A0 => x(82), A1 => y(82), S => s, Z => o(82));
  u83: mux21 port map (A0 => x(83), A1 => y(83), S => s, Z => o(83));
  u84: mux21 port map (A0 => x(84), A1 => y(84), S => s, Z => o(84));
  u85: mux21 port map (A0 => x(85), A1 => y(85), S => s, Z => o(85));
  u86: mux21 port map (A0 => x(86), A1 => y(86), S => s, Z => o(86));
  u87: mux21 port map (A0 => x(87), A1 => y(87), S => s, Z => o(87));
  u88: mux21 port map (A0 => x(88), A1 => y(88), S => s, Z => o(88));
  u89: mux21 port map (A0 => x(89), A1 => y(89), S => s, Z => o(89));
  u90: mux21 port map (A0 => x(90), A1 => y(90), S => s, Z => o(90));
  u91: mux21 port map (A0 => x(91), A1 => y(91), S => s, Z => o(91));
  u92: mux21 port map (A0 => x(92), A1 => y(92), S => s, Z => o(92));
  u93: mux21 port map (A0 => x(93), A1 => y(93), S => s, Z => o(93));
  u94: mux21 port map (A0 => x(94), A1 => y(94), S => s, Z => o(94));
  u95: mux21 port map (A0 => x(95), A1 => y(95), S => s, Z => o(95));
  u96: mux21 port map (A0 => x(96), A1 => y(96), S => s, Z => o(96));
  u97: mux21 port map (A0 => x(97), A1 => y(97), S => s, Z => o(97));
  u98: mux21 port map (A0 => x(98), A1 => y(98), S => s, Z => o(98));
  u99: mux21 port map (A0 => x(99), A1 => y(99), S => s, Z => o(99));
  u100: mux21 port map (A0 => x(100), A1 => y(100), S => s, Z => o(100));
  u101: mux21 port map (A0 => x(101), A1 => y(101), S => s, Z => o(101));
  u102: mux21 port map (A0 => x(102), A1 => y(102), S => s, Z => o(102));
  u103: mux21 port map (A0 => x(103), A1 => y(103), S => s, Z => o(103));
  u104: mux21 port map (A0 => x(104), A1 => y(104), S => s, Z => o(104));
  u105: mux21 port map (A0 => x(105), A1 => y(105), S => s, Z => o(105));
  u106: mux21 port map (A0 => x(106), A1 => y(106), S => s, Z => o(106));
  u107: mux21 port map (A0 => x(107), A1 => y(107), S => s, Z => o(107));
  u108: mux21 port map (A0 => x(108), A1 => y(108), S => s, Z => o(108));
  u109: mux21 port map (A0 => x(109), A1 => y(109), S => s, Z => o(109));
  u110: mux21 port map (A0 => x(110), A1 => y(110), S => s, Z => o(110));
  u111: mux21 port map (A0 => x(111), A1 => y(111), S => s, Z => o(111));
  u112: mux21 port map (A0 => x(112), A1 => y(112), S => s, Z => o(112));
end source;
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity mux21 is

  port (
    A0 : in  std_logic;
    A1 : in  std_logic;
    S  : in  std_logic;
    Z  : out std_logic);

end mux21;

architecture sim of mux21 is

begin  -- rtl

  Z <= A0 when S='0' else
       A1 when S='1' else
       'X';
end sim;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity vmux_114 is
  port (
    x : in std_logic_vector(113 downto 0);
    y : in std_logic_vector(113 downto 0);
    s : in std_logic;
    o : out std_logic_vector(113 downto 0)
  );
end vmux_114;


architecture source of vmux_114 is
  component mux21  port (
    A0 : in  std_logic;
    A1 : in  std_logic;
    S  : in  std_logic;
    Z  : out std_logic
  );
  end component;
begin
  u0: mux21 port map (A0 => x(0), A1 => y(0), S => s, Z => o(0));
  u1: mux21 port map (A0 => x(1), A1 => y(1), S => s, Z => o(1));
  u2: mux21 port map (A0 => x(2), A1 => y(2), S => s, Z => o(2));
  u3: mux21 port map (A0 => x(3), A1 => y(3), S => s, Z => o(3));
  u4: mux21 port map (A0 => x(4), A1 => y(4), S => s, Z => o(4));
  u5: mux21 port map (A0 => x(5), A1 => y(5), S => s, Z => o(5));
  u6: mux21 port map (A0 => x(6), A1 => y(6), S => s, Z => o(6));
  u7: mux21 port map (A0 => x(7), A1 => y(7), S => s, Z => o(7));
  u8: mux21 port map (A0 => x(8), A1 => y(8), S => s, Z => o(8));
  u9: mux21 port map (A0 => x(9), A1 => y(9), S => s, Z => o(9));
  u10: mux21 port map (A0 => x(10), A1 => y(10), S => s, Z => o(10));
  u11: mux21 port map (A0 => x(11), A1 => y(11), S => s, Z => o(11));
  u12: mux21 port map (A0 => x(12), A1 => y(12), S => s, Z => o(12));
  u13: mux21 port map (A0 => x(13), A1 => y(13), S => s, Z => o(13));
  u14: mux21 port map (A0 => x(14), A1 => y(14), S => s, Z => o(14));
  u15: mux21 port map (A0 => x(15), A1 => y(15), S => s, Z => o(15));
  u16: mux21 port map (A0 => x(16), A1 => y(16), S => s, Z => o(16));
  u17: mux21 port map (A0 => x(17), A1 => y(17), S => s, Z => o(17));
  u18: mux21 port map (A0 => x(18), A1 => y(18), S => s, Z => o(18));
  u19: mux21 port map (A0 => x(19), A1 => y(19), S => s, Z => o(19));
  u20: mux21 port map (A0 => x(20), A1 => y(20), S => s, Z => o(20));
  u21: mux21 port map (A0 => x(21), A1 => y(21), S => s, Z => o(21));
  u22: mux21 port map (A0 => x(22), A1 => y(22), S => s, Z => o(22));
  u23: mux21 port map (A0 => x(23), A1 => y(23), S => s, Z => o(23));
  u24: mux21 port map (A0 => x(24), A1 => y(24), S => s, Z => o(24));
  u25: mux21 port map (A0 => x(25), A1 => y(25), S => s, Z => o(25));
  u26: mux21 port map (A0 => x(26), A1 => y(26), S => s, Z => o(26));
  u27: mux21 port map (A0 => x(27), A1 => y(27), S => s, Z => o(27));
  u28: mux21 port map (A0 => x(28), A1 => y(28), S => s, Z => o(28));
  u29: mux21 port map (A0 => x(29), A1 => y(29), S => s, Z => o(29));
  u30: mux21 port map (A0 => x(30), A1 => y(30), S => s, Z => o(30));
  u31: mux21 port map (A0 => x(31), A1 => y(31), S => s, Z => o(31));
  u32: mux21 port map (A0 => x(32), A1 => y(32), S => s, Z => o(32));
  u33: mux21 port map (A0 => x(33), A1 => y(33), S => s, Z => o(33));
  u34: mux21 port map (A0 => x(34), A1 => y(34), S => s, Z => o(34));
  u35: mux21 port map (A0 => x(35), A1 => y(35), S => s, Z => o(35));
  u36: mux21 port map (A0 => x(36), A1 => y(36), S => s, Z => o(36));
  u37: mux21 port map (A0 => x(37), A1 => y(37), S => s, Z => o(37));
  u38: mux21 port map (A0 => x(38), A1 => y(38), S => s, Z => o(38));
  u39: mux21 port map (A0 => x(39), A1 => y(39), S => s, Z => o(39));
  u40: mux21 port map (A0 => x(40), A1 => y(40), S => s, Z => o(40));
  u41: mux21 port map (A0 => x(41), A1 => y(41), S => s, Z => o(41));
  u42: mux21 port map (A0 => x(42), A1 => y(42), S => s, Z => o(42));
  u43: mux21 port map (A0 => x(43), A1 => y(43), S => s, Z => o(43));
  u44: mux21 port map (A0 => x(44), A1 => y(44), S => s, Z => o(44));
  u45: mux21 port map (A0 => x(45), A1 => y(45), S => s, Z => o(45));
  u46: mux21 port map (A0 => x(46), A1 => y(46), S => s, Z => o(46));
  u47: mux21 port map (A0 => x(47), A1 => y(47), S => s, Z => o(47));
  u48: mux21 port map (A0 => x(48), A1 => y(48), S => s, Z => o(48));
  u49: mux21 port map (A0 => x(49), A1 => y(49), S => s, Z => o(49));
  u50: mux21 port map (A0 => x(50), A1 => y(50), S => s, Z => o(50));
  u51: mux21 port map (A0 => x(51), A1 => y(51), S => s, Z => o(51));
  u52: mux21 port map (A0 => x(52), A1 => y(52), S => s, Z => o(52));
  u53: mux21 port map (A0 => x(53), A1 => y(53), S => s, Z => o(53));
  u54: mux21 port map (A0 => x(54), A1 => y(54), S => s, Z => o(54));
  u55: mux21 port map (A0 => x(55), A1 => y(55), S => s, Z => o(55));
  u56: mux21 port map (A0 => x(56), A1 => y(56), S => s, Z => o(56));
  u57: mux21 port map (A0 => x(57), A1 => y(57), S => s, Z => o(57));
  u58: mux21 port map (A0 => x(58), A1 => y(58), S => s, Z => o(58));
  u59: mux21 port map (A0 => x(59), A1 => y(59), S => s, Z => o(59));
  u60: mux21 port map (A0 => x(60), A1 => y(60), S => s, Z => o(60));
  u61: mux21 port map (A0 => x(61), A1 => y(61), S => s, Z => o(61));
  u62: mux21 port map (A0 => x(62), A1 => y(62), S => s, Z => o(62));
  u63: mux21 port map (A0 => x(63), A1 => y(63), S => s, Z => o(63));
  u64: mux21 port map (A0 => x(64), A1 => y(64), S => s, Z => o(64));
  u65: mux21 port map (A0 => x(65), A1 => y(65), S => s, Z => o(65));
  u66: mux21 port map (A0 => x(66), A1 => y(66), S => s, Z => o(66));
  u67: mux21 port map (A0 => x(67), A1 => y(67), S => s, Z => o(67));
  u68: mux21 port map (A0 => x(68), A1 => y(68), S => s, Z => o(68));
  u69: mux21 port map (A0 => x(69), A1 => y(69), S => s, Z => o(69));
  u70: mux21 port map (A0 => x(70), A1 => y(70), S => s, Z => o(70));
  u71: mux21 port map (A0 => x(71), A1 => y(71), S => s, Z => o(71));
  u72: mux21 port map (A0 => x(72), A1 => y(72), S => s, Z => o(72));
  u73: mux21 port map (A0 => x(73), A1 => y(73), S => s, Z => o(73));
  u74: mux21 port map (A0 => x(74), A1 => y(74), S => s, Z => o(74));
  u75: mux21 port map (A0 => x(75), A1 => y(75), S => s, Z => o(75));
  u76: mux21 port map (A0 => x(76), A1 => y(76), S => s, Z => o(76));
  u77: mux21 port map (A0 => x(77), A1 => y(77), S => s, Z => o(77));
  u78: mux21 port map (A0 => x(78), A1 => y(78), S => s, Z => o(78));
  u79: mux21 port map (A0 => x(79), A1 => y(79), S => s, Z => o(79));
  u80: mux21 port map (A0 => x(80), A1 => y(80), S => s, Z => o(80));
  u81: mux21 port map (A0 => x(81), A1 => y(81), S => s, Z => o(81));
  u82: mux21 port map (A0 => x(82), A1 => y(82), S => s, Z => o(82));
  u83: mux21 port map (A0 => x(83), A1 => y(83), S => s, Z => o(83));
  u84: mux21 port map (A0 => x(84), A1 => y(84), S => s, Z => o(84));
  u85: mux21 port map (A0 => x(85), A1 => y(85), S => s, Z => o(85));
  u86: mux21 port map (A0 => x(86), A1 => y(86), S => s, Z => o(86));
  u87: mux21 port map (A0 => x(87), A1 => y(87), S => s, Z => o(87));
  u88: mux21 port map (A0 => x(88), A1 => y(88), S => s, Z => o(88));
  u89: mux21 port map (A0 => x(89), A1 => y(89), S => s, Z => o(89));
  u90: mux21 port map (A0 => x(90), A1 => y(90), S => s, Z => o(90));
  u91: mux21 port map (A0 => x(91), A1 => y(91), S => s, Z => o(91));
  u92: mux21 port map (A0 => x(92), A1 => y(92), S => s, Z => o(92));
  u93: mux21 port map (A0 => x(93), A1 => y(93), S => s, Z => o(93));
  u94: mux21 port map (A0 => x(94), A1 => y(94), S => s, Z => o(94));
  u95: mux21 port map (A0 => x(95), A1 => y(95), S => s, Z => o(95));
  u96: mux21 port map (A0 => x(96), A1 => y(96), S => s, Z => o(96));
  u97: mux21 port map (A0 => x(97), A1 => y(97), S => s, Z => o(97));
  u98: mux21 port map (A0 => x(98), A1 => y(98), S => s, Z => o(98));
  u99: mux21 port map (A0 => x(99), A1 => y(99), S => s, Z => o(99));
  u100: mux21 port map (A0 => x(100), A1 => y(100), S => s, Z => o(100));
  u101: mux21 port map (A0 => x(101), A1 => y(101), S => s, Z => o(101));
  u102: mux21 port map (A0 => x(102), A1 => y(102), S => s, Z => o(102));
  u103: mux21 port map (A0 => x(103), A1 => y(103), S => s, Z => o(103));
  u104: mux21 port map (A0 => x(104), A1 => y(104), S => s, Z => o(104));
  u105: mux21 port map (A0 => x(105), A1 => y(105), S => s, Z => o(105));
  u106: mux21 port map (A0 => x(106), A1 => y(106), S => s, Z => o(106));
  u107: mux21 port map (A0 => x(107), A1 => y(107), S => s, Z => o(107));
  u108: mux21 port map (A0 => x(108), A1 => y(108), S => s, Z => o(108));
  u109: mux21 port map (A0 => x(109), A1 => y(109), S => s, Z => o(109));
  u110: mux21 port map (A0 => x(110), A1 => y(110), S => s, Z => o(110));
  u111: mux21 port map (A0 => x(111), A1 => y(111), S => s, Z => o(111));
  u112: mux21 port map (A0 => x(112), A1 => y(112), S => s, Z => o(112));
  u113: mux21 port map (A0 => x(113), A1 => y(113), S => s, Z => o(113));
end source;
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity mux21 is

  port (
    A0 : in  std_logic;
    A1 : in  std_logic;
    S  : in  std_logic;
    Z  : out std_logic);

end mux21;

architecture sim of mux21 is

begin  -- rtl

  Z <= A0 when S='0' else
       A1 when S='1' else
       'X';
end sim;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity all_or_114 is
  port (
    x : in std_logic_vector(113 downto 0);
    z : out std_logic
  );
end all_or_114;


architecture source of all_or_114 is
begin
  z <= x(0) or x(1) or x(2) or x(3) or x(4) or x(5) or x(6) or x(7) or x(8) or x(9) or x(10) or x(11) or x(12) or x(13) or x(14) or x(15) or x(16) or x(17) or x(18) or x(19) or x(20) or x(21) or x(22) or x(23) or x(24) or x(25) or x(26) or x(27) or x(28) or x(29) or x(30) or x(31) or x(32) or x(33) or x(34) or x(35) or x(36) or x(37) or x(38) or x(39) or x(40) or x(41) or x(42) or x(43) or x(44) or x(45) or x(46) or x(47) or x(48) or x(49) or x(50) or x(51) or x(52) or x(53) or x(54) or x(55) or x(56) or x(57) or x(58) or x(59) or x(60) or x(61) or x(62) or x(63) or x(64) or x(65) or x(66) or x(67) or x(68) or x(69) or x(70) or x(71) or x(72) or x(73) or x(74) or x(75) or x(76) or x(77) or x(78) or x(79) or x(80) or x(81) or x(82) or x(83) or x(84) or x(85) or x(86) or x(87) or x(88) or x(89) or x(90) or x(91) or x(92) or x(93) or x(94) or x(95) or x(96) or x(97) or x(98) or x(99) or x(100) or x(101) or x(102) or x(103) or x(104) or x(105) or x(106) or x(107) or x(108) or x(109) or x(110) or x(111) or x(112) or x(113);
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_15_4 is
  port (
    i : in std_logic_vector(14 downto 0);
    o : out std_logic_vector(14 downto 0);
    clk : in std_logic
  );
end delay_15_4;


architecture source of delay_15_4 is
signal dummy1 : std_logic_vector(14 downto 0);
signal dummy2 : std_logic_vector(14 downto 0);
signal dummy3 : std_logic_vector(14 downto 0);
signal dummy4 : std_logic_vector(14 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      o <= dummy3;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_15_2 is
  port (
    i : in std_logic_vector(14 downto 0);
    o : out std_logic_vector(14 downto 0);
    clk : in std_logic
  );
end delay_15_2;


architecture source of delay_15_2 is
signal dummy1 : std_logic_vector(14 downto 0);
signal dummy2 : std_logic_vector(14 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      o <= dummy1;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_15_5 is
  port (
    i : in std_logic_vector(14 downto 0);
    o : out std_logic_vector(14 downto 0);
    clk : in std_logic
  );
end delay_15_5;


architecture source of delay_15_5 is
signal dummy1 : std_logic_vector(14 downto 0);
signal dummy2 : std_logic_vector(14 downto 0);
signal dummy3 : std_logic_vector(14 downto 0);
signal dummy4 : std_logic_vector(14 downto 0);
signal dummy5 : std_logic_vector(14 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      o <= dummy4;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_128_9 is
  port (
    i : in std_logic_vector(127 downto 0);
    o : out std_logic_vector(127 downto 0);
    clk : in std_logic
  );
end delay_128_9;


architecture source of delay_128_9 is
signal dummy1 : std_logic_vector(127 downto 0);
signal dummy2 : std_logic_vector(127 downto 0);
signal dummy3 : std_logic_vector(127 downto 0);
signal dummy4 : std_logic_vector(127 downto 0);
signal dummy5 : std_logic_vector(127 downto 0);
signal dummy6 : std_logic_vector(127 downto 0);
signal dummy7 : std_logic_vector(127 downto 0);
signal dummy8 : std_logic_vector(127 downto 0);
signal dummy9 : std_logic_vector(127 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      dummy5 <= dummy4;
      dummy6 <= dummy5;
      dummy7 <= dummy6;
      dummy8 <= dummy7;
      o <= dummy8;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_128_6 is
  port (
    i : in std_logic_vector(127 downto 0);
    o : out std_logic_vector(127 downto 0);
    clk : in std_logic
  );
end delay_128_6;


architecture source of delay_128_6 is
signal dummy1 : std_logic_vector(127 downto 0);
signal dummy2 : std_logic_vector(127 downto 0);
signal dummy3 : std_logic_vector(127 downto 0);
signal dummy4 : std_logic_vector(127 downto 0);
signal dummy5 : std_logic_vector(127 downto 0);
signal dummy6 : std_logic_vector(127 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      dummy5 <= dummy4;
      o <= dummy5;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity delay_128_5 is
  port (
    i : in std_logic_vector(127 downto 0);
    o : out std_logic_vector(127 downto 0);
    clk : in std_logic
  );
end delay_128_5;


architecture source of delay_128_5 is
signal dummy1 : std_logic_vector(127 downto 0);
signal dummy2 : std_logic_vector(127 downto 0);
signal dummy3 : std_logic_vector(127 downto 0);
signal dummy4 : std_logic_vector(127 downto 0);
signal dummy5 : std_logic_vector(127 downto 0);
begin
  process(clk) begin
    if(clk'event and clk='1') then
      dummy1 <= i;
      dummy2 <= dummy1;
      dummy3 <= dummy2;
      dummy4 <= dummy3;
      o <= dummy4;
    end if;
  end process;
end source;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity int_mul_28x28_3 is
  port (
    x : in std_logic_vector(27 downto 0);
    y : in std_logic_vector(27 downto 0);
    z : out std_logic_vector(55 downto 0);
    clk : in std_logic
  );
end int_mul_28x28_3;


architecture source of int_mul_28x28_3 is

signal xh : std_logic_vector(13 downto 0);
signal xl : std_logic_vector(13 downto 0);

signal yh : std_logic_vector(13 downto 0);
signal yl : std_logic_vector(13 downto 0);

signal xlyl : std_logic_vector(27 downto 0);
signal xlyh : std_logic_vector(27 downto 0);
signal xhyl : std_logic_vector(27 downto 0);
signal xhyh : std_logic_vector(27 downto 0);

signal xlyl_reg : std_logic_vector(27 downto 0);
signal xlyh_reg : std_logic_vector(27 downto 0);
signal xhyl_reg : std_logic_vector(27 downto 0);
signal xhyh_reg : std_logic_vector(27 downto 0);

signal sumll : std_logic_vector(55 downto 0); 
signal sumlh : std_logic_vector(55 downto 0); 
signal sumhl : std_logic_vector(55 downto 0); 
signal sumhh : std_logic_vector(55 downto 0);

signal sum0     : std_logic_vector(55 downto 0); 
signal sum1     : std_logic_vector(55 downto 0); 
signal sum0_reg : std_logic_vector(55 downto 0); 
signal sum1_reg : std_logic_vector(55 downto 0);

signal res : std_logic_vector(55 downto 0); 

begin
  xh <= x(27 downto 14);
  xl <= x(13 downto 0);

  yh <= y(27 downto 14);
  yl <= y(13 downto 0);
	
  xlyl <= xl*yl;
  xlyh <= xl*yh;
  xhyl <= xh*yl;
  xhyh <= xh*yh;

  process(clk) begin
    if(clk'event and clk='1') then
      xlyl_reg <= xlyl;
      xlyh_reg <= xlyh;
      xhyl_reg <= xhyl;
      xhyh_reg <= xhyh;
    end if;
  end process;

--   xy
  sumll <= "0000000000000000000000000000"&xlyl_reg;
  sumlh <= "00000000000000" & xlyh_reg &"00000000000000";
  sumhl <= "00000000000000" & xhyl_reg &"00000000000000";
  sumhh <= xhyh_reg&"0000000000000000000000000000";
  
  sum0 <= sumll+sumlh;
  sum1 <= sumhl+sumhh;

  process(clk) begin
    if(clk'event and clk='1') then
      sum0_reg <= sum0;
      sum1_reg <= sum1;
    end if;
  end process;

  res <= sum0_reg + sum1_reg;

  process(clk) begin
    if(clk'event and clk='1') then
      z <= res;
    end if;
  end process;

end source;
-------------------------------------------------------------------------------

 
