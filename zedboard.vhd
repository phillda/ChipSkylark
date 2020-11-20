-- Written by Ryan Kim, Digilent Inc.
-- Modified by Michael Mattioli
-- Adapted to EECE 5134C/6034C at University of Cincinnati
--------------------------------------------------------------------
-- PB_N   => Reset LCD, A and B values
-- PB_W   => load A and B data to given address
-- PB_S   => Reset (Null) Asynchronous Circuit  => Nulls Asynchronous S
-- PB_E   => Calculate Answer                   => Calculates Asynch S
-- DIP8-5 => 4 address bits for loading input
-- DIP4-1 => 4 data bits for loading input
-- LED7-4 => 4 address bits for loading input
-- LED3-0 => 4 data bits for loading input
--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity zedboard is
     port (  GCLK         : in std_logic;
            rst         : in std_logic;
            oled_sdin   : out std_logic;
            oled_sclk   : out std_logic;
            oled_dc     : out std_logic;
            oled_res    : out std_logic;
            oled_vbat   : out std_logic;
            oled_vdd    : out std_logic;
           --led outputs   
            GPIO_LED        :   out std_logic_vector(7 downto 0);   
              --pushbutton
            GPIO_SW_N : in std_logic;  --high when pressed
            GPIO_SW_W : in std_logic;  --high when pressed    
            GPIO_SW_S : in std_logic;  --high when pressed
            GPIO_SW_E : in std_logic;   --high when pressed
              --dip switch inputs
           GPIO_DIP_SW         : in  std_logic_vector(7 downto 0)
            );
end zedboard;

architecture behavioral of zedboard is

    component oled_init is
        port (  clk         : in std_logic;
                rst         : in std_logic;
                en          : in std_logic;
                sdout       : out std_logic;
                oled_sclk   : out std_logic;
                oled_dc     : out std_logic;
                oled_res    : out std_logic;
                oled_vbat   : out std_logic;
                oled_vdd    : out std_logic;
                fin         : out std_logic);
    end component;

    component oled_ex is
        port (  clk         : in std_logic;
                rst         : in std_logic;
                en          : in std_logic;
                sdout       : out std_logic;
                oled_sclk   : out std_logic;
                oled_dc     : out std_logic;
                fin         : out std_logic;
              --led outputs   
            GPIO_LED        :   out std_logic_vector(7 downto 0);   
              --pushbutton
            GPIO_SW_N : in std_logic;  --high when pressed
            GPIO_SW_W : in std_logic;  --high when pressed    
            GPIO_SW_S : in std_logic;  --high when pressed
            GPIO_SW_E : in std_logic;   --high when pressed
              --dip switch inputs
           GPIO_DIP_SW         : in  std_logic_vector(7 downto 0)
                 );
    end component;
    
    component clock_synth
  port (
    CLK16 : out STD_LOGIC; -- 100 MHz
    CLK : out STD_LOGIC;   --  6.25 MHz
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC -- System Clock 100 MHz
  );
end component;

    type states is (Idle, OledInitialize, OledExample, Done);

    signal current_state : states := Idle;

    signal init_en          : std_logic := '0';
    signal init_done        : std_logic;
    signal init_sdata       : std_logic;
    signal init_spi_clk     : std_logic;
    signal init_dc          : std_logic;

    signal example_en       : std_logic := '0';
    signal example_sdata    : std_logic;
    signal example_spi_clk  : std_logic;
    signal example_dc       : std_logic;
    signal example_done     : std_logic;
    
      -- debounced push button pulse signals
   signal PB_EVENT_N,PB_EVENT_E,PB_EVENT_S,PB_EVENT_W    : std_logic;        -- PB pulse
  signal PB_DELAY_N,PB_DELAY_E,PB_DELAY_S,PB_DELAY_W    : std_logic_vector(11 downto 0);
  
  
   signal locked : std_logic := '1';
   signal CLK100, clk625 : std_logic;

begin

    CLK_comp: clock_synth port map(CLK16 => CLK100,
                        CLK => clk625,
                       reset => '0', locked => locked,
                       clk_in1 => GCLK );

    Initialize: oled_init port map (CLK100,
                                    rst,
                                    init_en,
                                    init_sdata,
                                    init_spi_clk,
                                    init_dc,
                                    oled_res,
                                    oled_vbat,
                                    oled_vdd,
                                    init_done);

    Example: oled_ex port map ( CLK100,
                                rst,
                                example_en,
                                example_sdata,
                                example_spi_clk,
                                example_dc,
                                example_done,
                                GPIO_LED,
                                PB_EVENT_N,
                                PB_EVENT_W,
                                PB_EVENT_S,
                                PB_EVENT_E,
                                GPIO_DIP_SW
                                );

    -- MUXes to indicate which outputs are routed out depending on which block is enabled
    oled_sdin <= init_sdata when current_state = OledInitialize else example_sdata;
    oled_sclk <= init_spi_clk when current_state = OledInitialize else example_spi_clk;
    oled_dc <= init_dc when current_state = OledInitialize else example_dc;
    -- End output MUXes

    -- MUXes that enable blocks when in the proper states
    init_en <= '1' when current_state = OledInitialize else '0';
    example_en <= '1' when current_state = OledExample else '0';
    -- End enable MUXes

    process (CLK100)
     variable flag: integer := 0;
    begin
        if rising_edge(CLK100) then
            if rst = '1' then
                current_state <= Idle;
            else
                case current_state is
                    when Idle =>
                        current_state <= OledInitialize;
                    -- Go through the initialization sequence
                    when OledInitialize =>
                        if init_done = '1' then
                            current_state <= OledExample;
                        end if;
                    -- Do example and do nothing when finished
                    when OledExample =>
                        if example_done = '1' then
                            current_state <= Done;
                        end if;
                    -- Do nthing
                    when Done =>
                        current_state <= Done;
                    when others =>
                        current_state <= Idle;
                end case;
            end if;
        end if;
    end process;


----------------------------------------------------------------------------
-- debounced push buttons   
----------------------------------------------------------------------------
  dff_pb: process (CLK100)                                                     
  begin                                                                         
    if(CLK100'event and CLK100 = '1') then
      PB_DELAY_N(0) <= GPIO_SW_N;  -- input from board push button
      PB_DELAY_W(0) <= GPIO_SW_W;  -- input from board push button
      PB_DELAY_S(0) <= GPIO_SW_S;  -- input from board push button
      PB_DELAY_E(0) <= GPIO_SW_E;  -- input from board push button
      for I in 1 to 11 loop
        PB_DELAY_N(I) <= PB_DELAY_N(I-1);
        PB_DELAY_W(I) <= PB_DELAY_W(I-1); 
        PB_DELAY_S(I) <= PB_DELAY_S(I-1); 
        PB_DELAY_E(I) <= PB_DELAY_E(I-1); 
      end loop;
    end if;
  end process dff_pb;
  -- may need to add or delete delays depending on the board you are using ...
  PB_EVENT_N <= PB_DELAY_N(0) and PB_DELAY_N(1) and PB_DELAY_N(2) ;
--       and PB_DELAY_N(3) ;
--		and PB_DELAY_N(4) and PB_DELAY_N(5) and PB_DELAY_N(6) and PB_DELAY_N(7) and
--		PB_DELAY_N(8) and PB_DELAY_N(9) and PB_DELAY_N(10) and
--		not(PB_DELAY_N(11));
  PB_EVENT_W <= PB_DELAY_W(0) and PB_DELAY_W(1) and PB_DELAY_W(2);
--   and PB_DELAY_W(3) and
--		PB_DELAY_W(4) and PB_DELAY_W(5) and PB_DELAY_W(6) and PB_DELAY_W(7) and
--		PB_DELAY_W(8) and PB_DELAY_W(9) and PB_DELAY_W(10) and
--		not(PB_DELAY_W(11));
  PB_EVENT_S <= PB_DELAY_S(0) and PB_DELAY_S(1) and PB_DELAY_S(2);
  -- and PB_DELAY_S(3);
--		 and PB_DELAY_S(4) and PB_DELAY_S(5) and PB_DELAY_S(6) and PB_DELAY_S(7) and
--		PB_DELAY_S(8) and PB_DELAY_S(9) and PB_DELAY_S(10) and
--		not(PB_DELAY_S(11));
  PB_EVENT_E <= PB_DELAY_E(0) and PB_DELAY_E(1) and PB_DELAY_E(2);
--   and PB_DELAY_E(3) and
--		PB_DELAY_E(4) and PB_DELAY_E(5) and PB_DELAY_E(6) and PB_DELAY_E(7) and
--		PB_DELAY_E(8) and PB_DELAY_E(9) and PB_DELAY_E(10) and
--		not(PB_DELAY_E(11));

end behavioral;
