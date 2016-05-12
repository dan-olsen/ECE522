-- VHDL pattern output written by  TetraMAX (TM)  E-2010.12-SP5-i110710_172605 
-- Date: Tue Apr 12 19:06:46 2016
-- Module tested: s298

--     Uncollapsed Stuck Fault Summary Report
-- -----------------------------------------------
-- fault class                     code   #faults
-- ------------------------------  ----  ---------
-- Detected                         DT        786
-- Possibly detected                PT          0
-- Undetectable                     UD          0
-- ATPG untestable                  AU          0
-- Not detected                     ND          0
-- -----------------------------------------------
-- total faults                               786
-- test coverage                           100.00%
-- -----------------------------------------------
-- 
--            Pattern Summary Report
-- -----------------------------------------------
-- #internal patterns                          36
--     #full_sequential patterns               36
-- -----------------------------------------------
-- 
-- rule  severity  #fails  description
-- ----  --------  ------  ---------------------------------
-- B10   warning       12  unconnected module internal net
-- 
-- clock_name        off  usage
-- ----------------  ---  --------------------------
-- CK                 0   master shift 
-- 
-- There are no constraint ports
-- There are no equivalent pins
-- There are no net connections

LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.Std_Logic_TextIO.all;
USE Std.TextIO.all;
USE Std.Standard.all;

ENTITY s298_test IS
END s298_test;

ARCHITECTURE testbench OF s298_test IS

   constant LENMAX: INTEGER := 14;
   constant SHBEG: INTEGER := 0;
   constant SHEND: INTEGER := 0;
   constant NSHIFTS: INTEGER := 14; -- LENMAX for serial
   constant NCHAINS: INTEGER := 1;
   constant NINPUTS: INTEGER := 6;
   constant NOUTPUTS: INTEGER := 7;
   SUBTYPE InVector IS std_logic_vector (0 TO NINPUTS-1);
   SUBTYPE OutVector IS std_logic_vector (0 TO NOUTPUTS-1);
   TYPE POString IS ARRAY (0 TO NOUTPUTS-1) OF LINE;
   SUBTYPE ChainVector IS std_logic_vector (0 TO NCHAINS-1);
   SUBTYPE ScanVector IS std_logic_vector (0 TO LENMAX-1);
   SUBTYPE ScanVectorBit IS BIT_VECTOR (0 TO LENMAX-1);
   TYPE ScanArray IS ARRAY (0 TO NCHAINS-1) of ScanVector;
   TYPE ScanArrayBit IS ARRAY (0 TO NCHAINS-1) of ScanVectorBit;
   TYPE ChainString IS ARRAY (0 TO NCHAINS-1) OF LINE;
   SIGNAL PO, ALLPOS, XPCT, MASK: OutVector;
   SIGNAL PI, ALLPIS: InVector;
   SIGNAL LOAD0, LOADSH0: ScanVector;
   SIGNAL SCANOUT: ChainVector;
   SIGNAL UNLOAD, UNLMSK, CHOUT, CHAINOUT: ScanArray;
   SIGNAL CHAINOUT0: ScanVector;

   -- *** Signal Declarations ***
   SIGNAL CK, G0, G1, G117, G118, G132, G133, G2, G66, G67, test_si, test_so, test_se:
          std_logic;

   -- *** Component Declaration ***
   COMPONENT s298 PORT (
      CK: IN std_logic;
      G0: IN std_logic;
      G1: IN std_logic;
      G117: OUT std_logic;
      G118: OUT std_logic;
      G132: OUT std_logic;
      G133: OUT std_logic;
      G2: IN std_logic;
      G66: OUT std_logic;
      G67: OUT std_logic;
      test_si: IN std_logic;
      test_so: OUT std_logic;
      test_se: IN std_logic);
   END COMPONENT;

   -- *** Procedures ***

   PROCEDURE pulse_CK (
      SIGNAL PI : OUT InVector ) IS
   BEGIN
      wait for 45 ns; PI(0) <= '1'; wait for 10 ns; PI(0) <= '0'; 
      wait for 45 ns;
   END pulse_CK;


   PROCEDURE measurePO (
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   VARIABLE firstfail: BOOLEAN;
   VARIABLE L : Line;
   BEGIN
      firstfail := TRUE;
      FOR bit IN 0 TO NOUTPUTS-1 LOOP
         IF (MASK(bit) = '1') THEN
            IF(XPCT(bit) /= PO(bit)) THEN
               IF (firstfail = TRUE) THEN
                  Std.TextIO.Write(L, String'("T = "));
                  Std.TextIO.Write(L, now);
                  Std.TextIO.Write(L, String'(" ----- ERROR(S) during pattern "));
                  Std.TextIO.Write(L, pattern);
                  Std.TextIO.Write(L, String'(" -----"));
                  Std.TextIO.WriteLine(Output, L);
                  firstfail := FALSE;
               END IF;
               Std.TextIO.Write(L, String'("T = "));
               Std.TextIO.Write(L, now);
               Std.TextIO.Write(L, String'(" : "));
               Std.TextIO.Write(L, String'(POnames(bit).all));
               Std.TextIO.Write(L, String'(" (output "));
               Std.TextIO.Write(L, bit);
               Std.TextIO.Write(L, String'("), expected "));
               IEEE.Std_Logic_TextIO.Write(L, XPCT(bit));
               Std.TextIO.Write(L, String'(", got "));
               IEEE.Std_Logic_TextIO.Write(L, PO(bit));
               Std.TextIO.WriteLine(Output, L);
               nofails := nofails + 1;
            END IF;
         END IF;
      END LOOP;
      DEALLOCATE(L);
   END measurePO;


   PROCEDURE forcePI_allclock_launch_capture_WFT (
      SIGNAL ALLPIS: IN InVector;
      SIGNAL PI: OUT InVector ) IS
   BEGIN
      PI <= ALLPIS;
   END forcePI_allclock_launch_capture_WFT;

   PROCEDURE measurePO_allclock_launch_capture_WFT (
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      ALLPOS <= PO;
      wait for 0 ns; measurePO(ALLPOS, XPCT, MASK, nofails, pattern, POnames);
   END measurePO_allclock_launch_capture_WFT;


   PROCEDURE forcePI_multiclock_capture_WFT (
      SIGNAL ALLPIS: IN InVector;
      SIGNAL PI: OUT InVector ) IS
   BEGIN
      PI <= ALLPIS;
   END forcePI_multiclock_capture_WFT;

   PROCEDURE measurePO_multiclock_capture_WFT (
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      ALLPOS <= PO;
      wait for 0 ns; measurePO(ALLPOS, XPCT, MASK, nofails, pattern, POnames);
   END measurePO_multiclock_capture_WFT;


   PROCEDURE forcePI_allclock_launch_WFT (
      SIGNAL ALLPIS: IN InVector;
      SIGNAL PI: OUT InVector ) IS
   BEGIN
      PI <= ALLPIS;
   END forcePI_allclock_launch_WFT;

   PROCEDURE measurePO_allclock_launch_WFT (
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      ALLPOS <= PO;
      wait for 0 ns; measurePO(ALLPOS, XPCT, MASK, nofails, pattern, POnames);
   END measurePO_allclock_launch_WFT;


   PROCEDURE forcePI_allclock_capture_WFT (
      SIGNAL ALLPIS: IN InVector;
      SIGNAL PI: OUT InVector ) IS
   BEGIN
      PI <= ALLPIS;
   END forcePI_allclock_capture_WFT;

   PROCEDURE measurePO_allclock_capture_WFT (
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      ALLPOS <= PO;
      wait for 0 ns; measurePO(ALLPOS, XPCT, MASK, nofails, pattern, POnames);
   END measurePO_allclock_capture_WFT;


   PROCEDURE forcePI_default_WFT (
      SIGNAL ALLPIS: IN InVector;
      SIGNAL PI: OUT InVector ) IS
   BEGIN
      PI <= ALLPIS;
   END forcePI_default_WFT;

   PROCEDURE measurePO_default_WFT (
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      ALLPOS <= PO;
      wait for 0 ns; measurePO(ALLPOS, XPCT, MASK, nofails, pattern, POnames);
   END measurePO_default_WFT;


   PROCEDURE force_scanin (
      SIGNAL PI: OUT InVector;
      bit: IN INTEGER ) IS
   BEGIN
      PI(4) <= LOAD0(bit);
   END force_scanin;


   PROCEDURE measure_scanout (
      SIGNAL UNLOAD, UNLMSK : IN ScanArray;
      SIGNAL SCANOUT: IN ChainVector;
      bit: IN INTEGER;
      nofails : INOUT INTEGER;
      variable CHAINnames: IN ChainString ) IS
   VARIABLE cbit: INTEGER;
   VARIABLE idx: INTEGER;
   VARIABLE L : Line;
   BEGIN
      IF ((NSHIFTS < LENMAX) AND (bit >= SHBEG)) THEN cbit := bit - LENMAX + NSHIFTS + 1 + SHBEG;
      ELSE cbit := bit; -- because parallel does NSHIFTS + 1 shifts
      END IF;
      idx := cbit + 0;
      FOR chain IN 0 TO 0 LOOP
         IF (UNLMSK(chain)(idx) = '1') THEN
            IF (UNLOAD(chain)(idx) /= SCANOUT(chain)) THEN
               Std.TextIO.Write(L, String'("T = "));
               Std.TextIO.Write(L, now);
               Std.TextIO.Write(L, String'(" : ERROR during serial unload of chain "));
               Std.TextIO.Write(L, String'(CHAINnames(chain).all));
               Std.TextIO.Write(L, String'(" (bit "));
               Std.TextIO.Write(L, idx);
               Std.TextIO.Write(L, String'(") expected "));
               IEEE.Std_Logic_TextIO.Write(L, UNLOAD(chain)(idx));
               Std.TextIO.Write(L, String'(" got "));
               IEEE.Std_Logic_TextIO.Write(L, SCANOUT(chain));
               Std.TextIO.WriteLine(Output, L);
               nofails := nofails + 1;
            END IF;
         END IF;
      END LOOP;
      DEALLOCATE(L);
   END measure_scanout;



   PROCEDURE multiclock_capture (
      SIGNAL ALLPIS : IN InVector;
      SIGNAL PI : OUT InVector;
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      forcePI_multiclock_capture_WFT(ALLPIS, PI);
      wait for 40 ns; measurePO_multiclock_capture_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
      wait for 60 ns;
   END multiclock_capture;

   PROCEDURE allclock_capture (
      SIGNAL ALLPIS : IN InVector;
      SIGNAL PI : OUT InVector;
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      forcePI_allclock_capture_WFT(ALLPIS, PI);
      wait for 40 ns; measurePO_allclock_capture_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
      wait for 60 ns;
   END allclock_capture;

   PROCEDURE allclock_launch (
      SIGNAL ALLPIS : IN InVector;
      SIGNAL PI : OUT InVector;
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      forcePI_allclock_launch_WFT(ALLPIS, PI);
      wait for 40 ns; measurePO_allclock_launch_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
      wait for 60 ns;
   END allclock_launch;

   PROCEDURE allclock_launch_capture (
      SIGNAL ALLPIS : IN InVector;
      SIGNAL PI : OUT InVector;
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      forcePI_allclock_launch_capture_WFT(ALLPIS, PI);
      wait for 40 ns; measurePO_allclock_launch_capture_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
      wait for 60 ns;
   END allclock_launch_capture;

   PROCEDURE shift (
      SIGNAL PI: OUT InVector;
      SIGNAL UNLOAD, UNLMSK : IN ScanArray;
      SIGNAL SCANOUT: IN ChainVector;
      bit: IN INTEGER;
      nofails : INOUT INTEGER;
      variable CHAINnames: IN ChainString ) IS
   BEGIN
      force_scanin(PI, bit);
      wait for 40 ns; measure_scanout(UNLOAD, UNLMSK, SCANOUT, bit, nofails, CHAINnames);
      wait for 5 ns; PI(0) <= '1'; 
      wait for 10 ns; PI(0) <= '0'; 
      wait for 45 ns;
   END shift;

   PROCEDURE capture_CK (
      SIGNAL ALLPIS : IN InVector;
      SIGNAL PI : OUT InVector;
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      forcePI_multiclock_capture_WFT(ALLPIS, PI);
      wait for 40 ns; measurePO_multiclock_capture_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
      wait for 5 ns; PI(0) <= '1'; 
      wait for 10 ns; PI(0) <= '0'; 
      wait for 45 ns;
   END capture_CK;

   PROCEDURE capture (
      SIGNAL ALLPIS : IN InVector;
      SIGNAL PI : OUT InVector;
      SIGNAL ALLPOS : INOUT OutVector;
      SIGNAL PO, XPCT, MASK : IN OutVector;
      nofails : INOUT INTEGER;
      pattern : IN INTEGER;
      variable POnames : IN POString ) IS
   BEGIN
      forcePI_multiclock_capture_WFT(ALLPIS, PI);
      wait for 40 ns; measurePO_multiclock_capture_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
      wait for 60 ns;
   END capture;

   PROCEDURE test_setup (
      SIGNAL PI : OUT InVector ) IS
   BEGIN
      PI(0) <= '0'; 
      PI(1) <= 'X'; 
      PI(2) <= 'X'; 
      PI(3) <= 'X'; 
      PI(4) <= 'X'; 
      PI(5) <= 'X'; 
      wait for 200 ns;
   END test_setup;

   PROCEDURE multiple_shift (
      SIGNAL PI: OUT InVector;
      SIGNAL UNLOAD, UNLMSK : IN ScanArray;
      SIGNAL SCANOUT: IN ChainVector;
      bit: IN INTEGER;
      nofails : INOUT INTEGER;
      variable CHAINnames: IN ChainString ) IS
   BEGIN
      FOR b IN bit TO LENMAX-SHEND-1 LOOP
         shift(PI, UNLOAD, UNLMSK, SCANOUT, b, nofails, CHAINnames);
      END LOOP;
   END multiple_shift;


   PROCEDURE load_unload (
      SIGNAL PI: OUT InVector;
      SIGNAL UNLOAD, UNLMSK : IN ScanArray;
      SIGNAL SCANOUT: IN ChainVector;
      nofails : INOUT INTEGER;
      variable CHAINnames: IN ChainString ) IS
   VARIABLE bit: INTEGER;
   BEGIN
      PI(5) <= '1'; 
      PI(0) <= '0'; 
      wait for 100 ns;
      bit := SHBEG; multiple_shift(PI, UNLOAD, UNLMSK, SCANOUT, bit, nofails, CHAINnames);
      wait for 0 ns;
   END load_unload;

   BEGIN -------------------------------- testbench body --------------------------------
   -- *** Map inputs and bidis ***
   CK <= PI(0);
   G0 <= PI(1);
   G1 <= PI(2);
   G2 <= PI(3);
   test_si <= PI(4);
   test_se <= PI(5);

   -- *** Map outputs and bidis ***
   PO(0) <= G117;
   PO(1) <= G118;
   PO(2) <= G132;
   PO(3) <= G133;
   PO(4) <= G66;
   PO(5) <= G67;
   PO(6) <= test_so;

   -- *** Map scanouts ***
   SCANOUT(0) <= test_so;

   -- *** Instantiation of Component ***
   dut: s298 port map (
      CK => CK,
      G0 => G0,
      G1 => G1,
      G117 => G117,
      G118 => G118,
      G132 => G132,
      G133 => G133,
      G2 => G2,
      G66 => G66,
      G67 => G67,
      test_si => test_si,
      test_so => test_so,
      test_se => test_se);

   -- *** Main Process ***
   PROCESS
   variable nofails, pattern: INTEGER;
   variable POnames: POString;
   variable CHAINnames: ChainString;
   variable SHBEGM, INPINV, OUTINV: ScanArrayBit;
   variable L : Line;
   BEGIN
      POnames(0) := new STRING'("G117");
      POnames(1) := new STRING'("G118");
      POnames(2) := new STRING'("G132");
      POnames(3) := new STRING'("G133");
      POnames(4) := new STRING'("G66");
      POnames(5) := new STRING'("G67");
      POnames(6) := new STRING'("test_so");
      CHAINnames(0) := new STRING'("1");
      INPINV(0) := "10101010101010";
      OUTINV(0) := "01010101010101";
      SHBEGM(0) := "00000000000000";
      nofails := 0; pattern := -1;
      -- *** test setup procedure ***
      test_setup(PI); -- 200

      -- *** Scan test ***
pattern := 0; -- 200
LOAD0 <= "01001111001010";
UNLMSK(0) <= "00000000000000";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1700
wait for 0 ns;
PI <= "010010";
wait for 100 ns; -- 1800
XPCT <= "1001100";
MASK <= "1111111";
wait for 40 ns; -- 1840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1900
wait for 0 ns; pulse_CK(PI);  -- 2000

pattern := 1; -- 2000
LOAD0 <= "01000000100010";
UNLOAD(0) <= "10110010101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3500
wait for 0 ns;
PI <= "000110";
wait for 100 ns; -- 3600
XPCT <= "0101010";
MASK <= "1111111";
wait for 40 ns; -- 3640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3700
wait for 0 ns; pulse_CK(PI);  -- 3800

pattern := 2; -- 3800
LOAD0 <= "00110000100100";
UNLOAD(0) <= "00110010010011";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5300
wait for 0 ns;
PI <= "001000";
wait for 100 ns; -- 5400
XPCT <= "0110010";
MASK <= "1111111";
wait for 40 ns; -- 5440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5500
wait for 0 ns; pulse_CK(PI);  -- 5600

pattern := 3; -- 5600
LOAD0 <= "11011111100011";
UNLOAD(0) <= "10100011110101";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7100
wait for 0 ns;
PI <= "000100";
wait for 100 ns; -- 7200
XPCT <= "1011101";
MASK <= "1111111";
wait for 40 ns; -- 7240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7300
wait for 0 ns; pulse_CK(PI);  -- 7400

pattern := 4; -- 7400
LOAD0 <= "01110111110011";
UNLOAD(0) <= "10101010011010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8900
wait for 0 ns;
PI <= "001100";
wait for 100 ns; -- 9000
XPCT <= "1110100";
MASK <= "1111111";
wait for 40 ns; -- 9040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 9100
wait for 0 ns; pulse_CK(PI);  -- 9200

pattern := 5; -- 9200
LOAD0 <= "00100110010000";
UNLOAD(0) <= "10110111101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 10700
wait for 0 ns;
PI <= "000010";
wait for 100 ns; -- 10800
XPCT <= "1100000";
MASK <= "1111111";
wait for 40 ns; -- 10840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 10900
wait for 0 ns; pulse_CK(PI);  -- 11000

pattern := 6; -- 11000
LOAD0 <= "00110000010001";
UNLOAD(0) <= "00110010000001";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 12500
wait for 0 ns;
PI <= "001000";
wait for 100 ns; -- 12600
XPCT <= "0110010";
MASK <= "1111111";
wait for 40 ns; -- 12640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 12700
wait for 0 ns; pulse_CK(PI);  -- 12800

pattern := 7; -- 12800
LOAD0 <= "10011000101100";
UNLOAD(0) <= "10101010000110";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 14300
wait for 0 ns;
PI <= "011010";
wait for 100 ns; -- 14400
XPCT <= "0011011";
MASK <= "1111111";
wait for 40 ns; -- 14440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 14500
wait for 0 ns; pulse_CK(PI);  -- 14600

pattern := 8; -- 14600
LOAD0 <= "01000000100111";
UNLOAD(0) <= "10001110101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 16100
wait for 0 ns;
PI <= "000010";
wait for 100 ns; -- 16200
XPCT <= "0101010";
MASK <= "1111111";
wait for 40 ns; -- 16240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 16300
wait for 0 ns; pulse_CK(PI);  -- 16400

pattern := 9; -- 16400
LOAD0 <= "10100000011101";
UNLOAD(0) <= "01100011110100";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 17900
wait for 0 ns;
PI <= "001100";
wait for 100 ns; -- 18000
XPCT <= "0100011";
MASK <= "1111111";
wait for 40 ns; -- 18040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 18100
wait for 0 ns; pulse_CK(PI);  -- 18200

pattern := 10; -- 18200
LOAD0 <= "10011101111011";
UNLOAD(0) <= "01101010010010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 19700
wait for 0 ns;
PI <= "010000";
wait for 100 ns; -- 19800
XPCT <= "1011111";
MASK <= "1111111";
wait for 40 ns; -- 19840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 19900
wait for 0 ns; pulse_CK(PI);  -- 20000

pattern := 11; -- 20000
LOAD0 <= "00110100101011";
UNLOAD(0) <= "10110010101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 21500
wait for 0 ns;
PI <= "000000";
wait for 100 ns; -- 21600
XPCT <= "1110010";
MASK <= "1111111";
wait for 40 ns; -- 21640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 21700
wait for 0 ns; pulse_CK(PI);  -- 21800

pattern := 12; -- 21800
LOAD0 <= "00011111001110";
UNLOAD(0) <= "00101100111000";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 23300
wait for 0 ns;
PI <= "000110";
wait for 100 ns; -- 23400
XPCT <= "1011100";
MASK <= "1111111";
wait for 40 ns; -- 23440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 23500
wait for 0 ns; pulse_CK(PI);  -- 23600

pattern := 13; -- 23600
LOAD0 <= "10000000000001";
UNLOAD(0) <= "01110010011111";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 25100
wait for 0 ns;
PI <= "010010";
wait for 100 ns; -- 25200
XPCT <= "0101011";
MASK <= "1111111";
wait for 40 ns; -- 25240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 25300
wait for 0 ns; pulse_CK(PI);  -- 25400

pattern := 14; -- 25400
LOAD0 <= "10111011000101";
UNLOAD(0) <= "10100011101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 26900
wait for 0 ns;
PI <= "001010";
wait for 100 ns; -- 27000
XPCT <= "0010101";
MASK <= "1111111";
wait for 40 ns; -- 27040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 27100
wait for 0 ns; pulse_CK(PI);  -- 27200

pattern := 15; -- 27200
LOAD0 <= "10000011101011";
UNLOAD(0) <= "00101010001010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 28700
wait for 0 ns;
PI <= "000110";
wait for 100 ns; -- 28800
XPCT <= "0101101";
MASK <= "1111111";
wait for 40 ns; -- 28840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 28900
wait for 0 ns; pulse_CK(PI);  -- 29000

pattern := 16; -- 29000
LOAD0 <= "11101011100010";
UNLOAD(0) <= "11101100101000";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 30500
wait for 0 ns;
PI <= "001010";
wait for 100 ns; -- 30600
XPCT <= "0000101";
MASK <= "1111111";
wait for 40 ns; -- 30640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 30700
wait for 0 ns; pulse_CK(PI);  -- 30800

pattern := 17; -- 30800
LOAD0 <= "11001011010010";
UNLOAD(0) <= "01110010000011";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 32300
wait for 0 ns;
PI <= "000010";
wait for 100 ns; -- 32400
XPCT <= "0001101";
MASK <= "1111111";
wait for 40 ns; -- 32440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 32500
wait for 0 ns; pulse_CK(PI);  -- 32600

pattern := 18; -- 32600
LOAD0 <= "10110000110101";
UNLOAD(0) <= "11110010010011";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 34100
wait for 0 ns;
PI <= "000100";
wait for 100 ns; -- 34200
XPCT <= "0110011";
MASK <= "1111111";
wait for 40 ns; -- 34240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 34300
wait for 0 ns; pulse_CK(PI);  -- 34400

pattern := 19; -- 34400
LOAD0 <= "11010100111011";
UNLOAD(0) <= "11110000111010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 35900
wait for 0 ns;
PI <= "000010";
wait for 100 ns; -- 36000
XPCT <= "1111011";
MASK <= "1111111";
wait for 40 ns; -- 36040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 36100
wait for 0 ns; pulse_CK(PI);  -- 36200

pattern := 20; -- 36200
LOAD0 <= "10001100010011";
UNLOAD(0) <= "11110010111000";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 37700
wait for 0 ns;
PI <= "000000";
wait for 100 ns; -- 37800
XPCT <= "1001011";
MASK <= "1111111";
wait for 40 ns; -- 37840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 37900
wait for 0 ns; pulse_CK(PI);  -- 38000

pattern := 21; -- 38000
LOAD0 <= "10101000000000";
UNLOAD(0) <= "10101010001010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 39500
wait for 0 ns;
PI <= "000000";
wait for 100 ns; -- 39600
XPCT <= "0000011";
MASK <= "1111111";
wait for 40 ns; -- 39640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 39700
wait for 0 ns; pulse_CK(PI);  -- 39800

pattern := 22; -- 39800
LOAD0 <= "10110101111111";
UNLOAD(0) <= "10100011100001";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 41300
wait for 0 ns;
PI <= "010010";
wait for 100 ns; -- 41400
XPCT <= "1110111";
MASK <= "1111111";
wait for 40 ns; -- 41440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 41500
wait for 0 ns; pulse_CK(PI);  -- 41600

pattern := 23; -- 41600
LOAD0 <= "11110000101111";
UNLOAD(0) <= "10110101101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 43100
wait for 0 ns;
PI <= "001010";
wait for 100 ns; -- 43200
XPCT <= "0110011";
MASK <= "1111111";
wait for 40 ns; -- 43240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 43300
wait for 0 ns; pulse_CK(PI);  -- 43400

pattern := 24; -- 43400
LOAD0 <= "10111001101000";
UNLOAD(0) <= "01101100101100";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 44900
wait for 0 ns;
PI <= "011110";
wait for 100 ns; -- 45000
XPCT <= "0010111";
MASK <= "1111111";
wait for 40 ns; -- 45040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 45100
wait for 0 ns; pulse_CK(PI);  -- 45200

pattern := 25; -- 45200
LOAD0 <= "00100010111100";
UNLOAD(0) <= "10101100101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 46700
wait for 0 ns;
PI <= "001100";
wait for 100 ns; -- 46800
XPCT <= "0100000";
MASK <= "1111111";
wait for 40 ns; -- 46840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 46900
wait for 0 ns; pulse_CK(PI);  -- 47000

pattern := 26; -- 47000
LOAD0 <= "10011110100001";
UNLOAD(0) <= "11100010101101";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 48500
wait for 0 ns;
PI <= "001010";
wait for 100 ns; -- 48600
XPCT <= "1011001";
MASK <= "1111111";
wait for 40 ns; -- 48640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 48700
wait for 0 ns; pulse_CK(PI);  -- 48800

pattern := 27; -- 48800
LOAD0 <= "11111001110000";
UNLOAD(0) <= "00100011100110";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 50300
wait for 0 ns;
PI <= "010100";
wait for 100 ns; -- 50400
XPCT <= "0010111";
MASK <= "1111111";
wait for 40 ns; -- 50440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 50500
wait for 0 ns; pulse_CK(PI);  -- 50600

pattern := 28; -- 50600
LOAD0 <= "11001100111110";
UNLOAD(0) <= "10111001101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 52100
wait for 0 ns;
PI <= "000010";
wait for 100 ns; -- 52200
XPCT <= "1001011";
MASK <= "1111111";
wait for 40 ns; -- 52240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 52300
wait for 0 ns; pulse_CK(PI);  -- 52400

pattern := 29; -- 52400
LOAD0 <= "01011101111001";
UNLOAD(0) <= "11001100111111";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 53900
wait for 0 ns;
PI <= "000010";
wait for 100 ns; -- 54000
XPCT <= "1011110";
MASK <= "1111111";
wait for 40 ns; -- 54040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 54100
wait for 0 ns; pulse_CK(PI);  -- 54200

pattern := 30; -- 54200
LOAD0 <= "10001110111010";
UNLOAD(0) <= "01101100101110";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 55700
wait for 0 ns;
PI <= "010100";
wait for 100 ns; -- 55800
XPCT <= "1001001";
MASK <= "1111111";
wait for 40 ns; -- 55840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 55900
wait for 0 ns; pulse_CK(PI);  -- 56000

pattern := 31; -- 56000
LOAD0 <= "00011101101110";
UNLOAD(0) <= "10110010101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 57500
wait for 0 ns;
PI <= "010000";
wait for 100 ns; -- 57600
XPCT <= "1011110";
MASK <= "1111111";
wait for 40 ns; -- 57640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 57700
wait for 0 ns; pulse_CK(PI);  -- 57800

pattern := 32; -- 57800
LOAD0 <= "01000101000000";
UNLOAD(0) <= "10101100101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 59300
wait for 0 ns;
PI <= "001010";
wait for 100 ns; -- 59400
XPCT <= "1101110";
MASK <= "1111111";
wait for 40 ns; -- 59440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 59500
wait for 0 ns; pulse_CK(PI);  -- 59600

pattern := 33; -- 59600
LOAD0 <= "10001111000010";
UNLOAD(0) <= "11110010010001";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 61100
wait for 0 ns;
PI <= "001000";
wait for 100 ns; -- 61200
XPCT <= "1001101";
MASK <= "1111111";
wait for 40 ns; -- 61240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 61300
wait for 0 ns; pulse_CK(PI);  -- 61400

pattern := 34; -- 61400
LOAD0 <= "00110111100011";
UNLOAD(0) <= "00110010000011";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 62900
wait for 0 ns;
PI <= "000110";
wait for 100 ns; -- 63000
XPCT <= "1110100";
MASK <= "1111111";
wait for 40 ns; -- 63040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 63100
wait for 0 ns; pulse_CK(PI);  -- 63200

pattern := 35; -- 63200
LOAD0 <= "10111000111000";
UNLOAD(0) <= "01100011111010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 64700
wait for 0 ns;
PI <= "010000";
wait for 100 ns; -- 64800
XPCT <= "0010011";
MASK <= "1111111";
wait for 40 ns; -- 64840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 64900
wait for 0 ns; pulse_CK(PI);  -- 65000

LOAD0 <= "00000000000000";
UNLOAD(0) <= "10101100101010";
UNLMSK(0) <= "11111111111111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 66500

      Std.TextIO.Write(L, String'("Simulation of "));
      Std.TextIO.Write(L, pattern + 1);
      Std.TextIO.Write(L, String'(" patterns completed with "));
      Std.TextIO.Write(L, nofails);
      Std.TextIO.Write(L, String'(" errors"));
      Std.TextIO.WriteLine(Output, L);
      WAIT;
      DEALLOCATE(L);
      DEALLOCATE(POnames(0));
      DEALLOCATE(POnames(1));
      DEALLOCATE(POnames(2));
      DEALLOCATE(POnames(3));
      DEALLOCATE(POnames(4));
      DEALLOCATE(POnames(5));
      DEALLOCATE(POnames(6));
      DEALLOCATE(CHAINnames(0));
   END PROCESS;
END testbench;

CONFIGURATION s298_ctl OF s298_test IS
   FOR testbench
      FOR dut: s298 USE ENTITY WORK.s298;
      END FOR;
   END FOR;
END s298_ctl;
