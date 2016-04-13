-- VHDL pattern output written by  TetraMAX (TM)  E-2010.12-SP5-i110710_172605 
-- Date: Tue Apr 12 19:06:32 2016
-- Module tested: s27

--     Uncollapsed Stuck Fault Summary Report
-- -----------------------------------------------
-- fault class                     code   #faults
-- ------------------------------  ----  ---------
-- Detected                         DT        155
-- Possibly detected                PT          0
-- Undetectable                     UD          1
-- ATPG untestable                  AU          0
-- Not detected                     ND          0
-- -----------------------------------------------
-- total faults                               156
-- test coverage                           100.00%
-- -----------------------------------------------
-- 
--            Pattern Summary Report
-- -----------------------------------------------
-- #internal patterns                          15
--     #full_sequential patterns               15
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

ENTITY s27_test IS
END s27_test;

ARCHITECTURE testbench OF s27_test IS

   constant LENMAX: INTEGER := 3;
   constant SHBEG: INTEGER := 0;
   constant SHEND: INTEGER := 0;
   constant NSHIFTS: INTEGER := 3; -- LENMAX for serial
   constant NCHAINS: INTEGER := 1;
   constant NINPUTS: INTEGER := 7;
   constant NOUTPUTS: INTEGER := 2;
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
   SIGNAL CK, G0, G1, G17, G2, G3, test_si, test_so, test_se: std_logic;

   -- *** Component Declaration ***
   COMPONENT s27 PORT (
      CK: IN std_logic;
      G0: IN std_logic;
      G1: IN std_logic;
      G17: OUT std_logic;
      G2: IN std_logic;
      G3: IN std_logic;
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
      PI(5) <= LOAD0(bit);
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
      PI(6) <= 'X'; 
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
      PI(6) <= '1'; 
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
   G3 <= PI(4);
   test_si <= PI(5);
   test_se <= PI(6);

   -- *** Map outputs and bidis ***
   PO(0) <= G17;
   PO(1) <= test_so;

   -- *** Map scanouts ***
   SCANOUT(0) <= test_so;

   -- *** Instantiation of Component ***
   dut: s27 port map (
      CK => CK,
      G0 => G0,
      G1 => G1,
      G17 => G17,
      G2 => G2,
      G3 => G3,
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
      POnames(0) := new STRING'("G17");
      POnames(1) := new STRING'("test_so");
      CHAINnames(0) := new STRING'("1");
      INPINV(0) := "110";
      OUTINV(0) := "011";
      SHBEGM(0) := "000";
      nofails := 0; pattern := -1;
      -- *** test setup procedure ***
      test_setup(PI); -- 200

      -- *** Scan test ***
pattern := 0; -- 200
LOAD0 <= "001";
UNLMSK(0) <= "000";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 600
wait for 0 ns;
PI <= "0101010";
wait for 100 ns; -- 700
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 740
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 800
wait for 0 ns; pulse_CK(PI);  -- 900

pattern := 1; -- 900
LOAD0 <= "100";
UNLOAD(0) <= "111";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1300
wait for 0 ns;
PI <= "0101100";
wait for 100 ns; -- 1400
XPCT <= "01";
MASK <= "11";
wait for 40 ns; -- 1440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1500

pattern := 2; -- 1500
LOAD0 <= "100";
UNLOAD(0) <= "100";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1900
wait for 0 ns;
PI <= "0100000";
wait for 100 ns; -- 2000
XPCT <= "11";
MASK <= "11";
wait for 40 ns; -- 2040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2100
wait for 0 ns; pulse_CK(PI);  -- 2200

pattern := 3; -- 2200
LOAD0 <= "010";
UNLOAD(0) <= "111";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2600
wait for 0 ns;
PI <= "0110110";
wait for 100 ns; -- 2700
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 2740
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2800

pattern := 4; -- 2800
LOAD0 <= "111";
UNLOAD(0) <= "010";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3200
wait for 0 ns;
PI <= "0101110";
wait for 100 ns; -- 3300
XPCT <= "11";
MASK <= "11";
wait for 40 ns; -- 3340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3400
wait for 0 ns; pulse_CK(PI);  -- 3500

pattern := 5; -- 3500
LOAD0 <= "010";
UNLOAD(0) <= "111";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3900
wait for 0 ns;
PI <= "0010110";
wait for 100 ns; -- 4000
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 4040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4100

pattern := 6; -- 4100
LOAD0 <= "100";
UNLOAD(0) <= "010";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4500
wait for 0 ns;
PI <= "0101100";
wait for 100 ns; -- 4600
XPCT <= "01";
MASK <= "11";
wait for 40 ns; -- 4640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4700
wait for 0 ns; pulse_CK(PI);  -- 4800

pattern := 7; -- 4800
LOAD0 <= "101";
UNLOAD(0) <= "100";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5200
wait for 0 ns;
PI <= "0010110";
wait for 100 ns; -- 5300
XPCT <= "11";
MASK <= "11";
wait for 40 ns; -- 5340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5400
wait for 0 ns; pulse_CK(PI);  -- 5500

pattern := 8; -- 5500
LOAD0 <= "001";
UNLOAD(0) <= "010";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5900
wait for 0 ns;
PI <= "0000100";
wait for 100 ns; -- 6000
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 6040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6100
wait for 0 ns; pulse_CK(PI);  -- 6200

pattern := 9; -- 6200
LOAD0 <= "000";
UNLOAD(0) <= "010";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6600
wait for 0 ns;
PI <= "0110100";
wait for 100 ns; -- 6700
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 6740
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6800
wait for 0 ns; pulse_CK(PI);  -- 6900

pattern := 10; -- 6900
LOAD0 <= "000";
UNLOAD(0) <= "011";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7300
wait for 0 ns;
PI <= "0011100";
wait for 100 ns; -- 7400
XPCT <= "00";
MASK <= "11";
wait for 40 ns; -- 7440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7500

pattern := 11; -- 7500
LOAD0 <= "100";
UNLOAD(0) <= "000";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7900
wait for 0 ns;
PI <= "0011000";
wait for 100 ns; -- 8000
XPCT <= "01";
MASK <= "11";
wait for 40 ns; -- 8040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8100

pattern := 12; -- 8100
LOAD0 <= "110";
UNLOAD(0) <= "100";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8500
wait for 0 ns;
PI <= "0001011";
wait for 100 ns; -- 8600
XPCT <= "11";
MASK <= "11";
wait for 40 ns; -- 8640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8700

pattern := 13; -- 8700
LOAD0 <= "010";
UNLOAD(0) <= "110";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 9100
wait for 0 ns;
PI <= "0100100";
wait for 100 ns; -- 9200
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 9240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 9300
wait for 0 ns; pulse_CK(PI);  -- 9400

pattern := 14; -- 9400
LOAD0 <= "110";
UNLOAD(0) <= "011";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 9800
wait for 0 ns;
PI <= "0111110";
wait for 100 ns; -- 9900
XPCT <= "11";
MASK <= "11";
wait for 40 ns; -- 9940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 10000
wait for 0 ns; pulse_CK(PI);  -- 10100

LOAD0 <= "000";
UNLOAD(0) <= "111";
UNLMSK(0) <= "111";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 10500

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
      DEALLOCATE(CHAINnames(0));
   END PROCESS;
END testbench;

CONFIGURATION s27_ctl OF s27_test IS
   FOR testbench
      FOR dut: s27 USE ENTITY WORK.s27;
      END FOR;
   END FOR;
END s27_ctl;
