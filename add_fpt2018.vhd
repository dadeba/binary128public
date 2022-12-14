library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fp_add_128_112_15_5 is
  port (
    x : in std_logic_vector(127 downto 0);
    y : in std_logic_vector(127 downto 0);
    z : out std_logic_vector(127 downto 0);
    clk : in std_logic
  );
end fp_add_128_112_15_5;


architecture source of fp_add_128_112_15_5 is

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

component swap_128
  port (
    f : in std_logic;
    x : in std_logic_vector(127 downto 0);
    y : in std_logic_vector(127 downto 0);
    xs : out std_logic_vector(127 downto 0);
    ys : out std_logic_vector(127 downto 0)
  );
end component;

component int_rshift_V
  port (
    c : in std_logic_vector(6 downto 0);
    i : in std_logic_vector(112 downto 0);
    o : out std_logic_vector(112 downto 0);
    s : out std_logic
  );
end component;

component int_sadder_v_115_2
  port (
    x : in std_logic_vector(114 downto 0);
    sx : in std_logic;
    y : in std_logic_vector(114 downto 0);
    sy : in std_logic;
    z : out std_logic_vector(114 downto 0);
    sz : out std_logic;
    clk : in std_logic
  );
end component;

component int_pencx_114_15_0
  port (
    i : in std_logic_vector(113 downto 0);
    ss : out std_logic_vector(14 downto 0)
  );
end component;

component int_lshift_V
  port (
    c : in std_logic_vector(6 downto 0);
    i : in std_logic_vector(113 downto 0);
    o : out std_logic_vector(113 downto 0)
  );
end component;

component all_or_114
  port (
    x : in std_logic_vector(113 downto 0);
    z : out std_logic
  );
end component;

component delay_15_4
  port (
    i : in std_logic_vector(14 downto 0);
    o : out std_logic_vector(14 downto 0);
    clk : in std_logic
  );
end component;



signal signz,sz,sz_reg : std_logic;
signal manz,mz  : std_logic_vector(112 downto 0);
signal expz,ez  : std_logic_vector(14 downto 0);
signal ex0, ey0 : std_logic_vector(15 downto 0);

signal xx, yy : std_logic_vector(127 downto 0);
signal sx, sy : std_logic;
signal sx_reg, sy_reg : std_logic;
signal mx, my : std_logic_vector(112 downto 0);
signal mx0, my0 : std_logic_vector(112 downto 0);
signal ex, ey : std_logic_vector(14 downto 0);

signal dx   : std_logic_vector(15 downto 0);
signal dy   : std_logic_vector(15 downto 0);
signal diff : std_logic_vector(15 downto 0);

signal qx, qy0, qy : std_logic_vector(112 downto 0);
signal px, py : std_logic_vector(114 downto 0);
signal px_reg, py_reg : std_logic_vector(114 downto 0);
signal rf1, rf2 : std_logic;

signal ff : std_logic;
signal rshft : std_logic_vector(6 downto 0);

signal res   : std_logic_vector(114 downto 0);
signal res_reg   : std_logic_vector(114 downto 0);

signal lshft : std_logic_vector(14 downto 0);
signal lshft_reg : std_logic_vector(14 downto 0);

signal res_n     : std_logic_vector(113 downto 0);
signal res_n_reg : std_logic_vector(113 downto 0);

signal ex_reg, ec2, ec3 : std_logic_vector(14 downto 0);

signal zf   : std_logic;

begin
  ex0 <= '0'&x(126 downto 112);
  ey0 <= '0'&y(126 downto 112);

  dx <= ex0 - ey0;
  dy <= ey0 - ex0;

-- swap 
  s0 : swap_128 port map ( f => dx(15), x => x, y => y, xs => xx, ys => yy);

  with dx(15) select
    diff <= dy when '1', 
            dx when others;

  e0 : extract_128_112_15 port map ( x => xx, s => sx, m => mx0, e => ex);
  e1 : extract_128_112_15 port map ( x => yy, s => sy, m => my0, e => ey);

-- if input is zero
  with ex select
    mx <= (others => '0') when "000000000000000", 
          mx0 when others;

  with ey select
    my <= (others => '0') when "000000000000000", 
          my0 when others;

-- if diff >= 128
  ff <= diff(14) or diff(13) or diff(12) or diff(11) or diff(10) or diff(9) or diff(8) or diff(7);
  with ff select
    rshft <= "1111111"         when '1',
            diff(6 downto 0)  when others;	  

-- x 113 bit
  qx <= mx;
-- y 113 bit : right shift
  rs : int_rshift_V port map (c => rshft, i => my, o => qy0, s => rf1);
  qy <= qy0(112 downto 1) & (qy0(0) or rf1); -- force1 rounding

-- 115 bit signed adder
  px <= "00"&qx;
  py <= "00"&qy;

  process(clk) begin
    if(clk'event and clk='1') then
      px_reg <= px;
      py_reg <= py;
      sx_reg <= sx;
      sy_reg <= sy;

    end if;
  end process;


  add: int_sadder_v_115_2 port map (x => px_reg, sx => sx_reg, y => py_reg, sy => sy_reg, 
                              z => res, sz => sz, clk => clk);
-- penc
  penc : int_pencx_114_15_0 port map (i => res(113 downto 0), ss => lshft);

-- lshift
  ls : int_lshift_V port map (c => lshft(6 downto 0), i => res(113 downto 0), o => res_n);

  process(clk) begin
    if(clk'event and clk='1') then
      res_reg <= res;
      res_n_reg <= res_n;
      lshft_reg <= lshft;
      sz_reg <= sz;

    end if;
  end process;


-- exp
  d4 : delay_15_4 port map (i => ex, o => ex_reg, clk => clk);
  ec2 <= ex_reg - lshft_reg;
  ec3 <= ec2 + "000000000000001";
-- 
  zftest : all_or_114 port map (x => res_reg(113 downto 0), z => zf);

-- force1 rounding
  mz(112 downto 0) <= res_n_reg(113 downto 2) & (res_n_reg(1) or res_n_reg(0));

  with zf select
    ez <= (others => '0') when '0',
          ec3             when others;

  c0 : compose_128_112_15 port map (s => sz_reg, m => mz, e => ez, z => z, clk => clk); 
end source;
