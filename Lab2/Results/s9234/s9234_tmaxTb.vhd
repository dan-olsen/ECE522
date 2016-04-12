-- VHDL pattern output written by  TetraMAX (TM)  E-2010.12-SP5-i110710_172605 
-- Date: Tue Apr 12 11:54:22 2016
-- Module tested: s9234

--     Uncollapsed Stuck Fault Summary Report
-- -----------------------------------------------
-- fault class                     code   #faults
-- ------------------------------  ----  ---------
-- Detected                         DT      10252
-- Possibly detected                PT          0
-- Undetectable                     UD         14
-- ATPG untestable                  AU          0
-- Not detected                     ND          0
-- -----------------------------------------------
-- total faults                             10266
-- test coverage                           100.00%
-- -----------------------------------------------
-- 
--            Pattern Summary Report
-- -----------------------------------------------
-- #internal patterns                         382
--     #full_sequential patterns              382
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

ENTITY s9234_test IS
END s9234_test;

ARCHITECTURE testbench OF s9234_test IS

   constant LENMAX: INTEGER := 211;
   constant SHBEG: INTEGER := 0;
   constant SHEND: INTEGER := 0;
   constant NSHIFTS: INTEGER := 211; -- LENMAX for serial
   constant NCHAINS: INTEGER := 1;
   constant NINPUTS: INTEGER := 39;
   constant NOUTPUTS: INTEGER := 40;
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
   SIGNAL CK, g102, g107, g1290, g1293, g22, g23, g2584, g301, g306, g310, g314, g319, g32, g3222, 
          g36, g3600, g37, g38, g39, g40, g4098, g4099, g41, g4100, g4101, g4102, g4103, g4104, 
          g4105, g4106, g4107, g4108, g4109, g4110, g4112, g4121, g42, g4307, g4321, g44, g4422, g45,
           g46, g47, g4809, g5137, g5468, g5469, g557, g558, g559, g560, g561, g562, g563, g564, 
          g567, g5692, g6282, g6284, g6360, g6362, g6364, g6366, g6368, g6370, g6372, g6374, g639, 
          g6728, g702, g705, g89, g94, g98, test_si, test_so, test_se:
          std_logic;

   -- *** Component Declaration ***
   COMPONENT s9234 PORT (
      CK: IN std_logic;
      g102: IN std_logic;
      g107: IN std_logic;
      g1290: OUT std_logic;
      g1293: OUT std_logic;
      g22: IN std_logic;
      g23: IN std_logic;
      g2584: OUT std_logic;
      g301: IN std_logic;
      g306: IN std_logic;
      g310: IN std_logic;
      g314: IN std_logic;
      g319: IN std_logic;
      g32: IN std_logic;
      g3222: OUT std_logic;
      g36: IN std_logic;
      g3600: OUT std_logic;
      g37: IN std_logic;
      g38: IN std_logic;
      g39: IN std_logic;
      g40: IN std_logic;
      g4098: OUT std_logic;
      g4099: OUT std_logic;
      g41: IN std_logic;
      g4100: OUT std_logic;
      g4101: OUT std_logic;
      g4102: OUT std_logic;
      g4103: OUT std_logic;
      g4104: OUT std_logic;
      g4105: OUT std_logic;
      g4106: OUT std_logic;
      g4107: OUT std_logic;
      g4108: OUT std_logic;
      g4109: OUT std_logic;
      g4110: OUT std_logic;
      g4112: OUT std_logic;
      g4121: OUT std_logic;
      g42: IN std_logic;
      g4307: OUT std_logic;
      g4321: OUT std_logic;
      g44: IN std_logic;
      g4422: OUT std_logic;
      g45: IN std_logic;
      g46: IN std_logic;
      g47: IN std_logic;
      g4809: OUT std_logic;
      g5137: OUT std_logic;
      g5468: OUT std_logic;
      g5469: OUT std_logic;
      g557: IN std_logic;
      g558: IN std_logic;
      g559: IN std_logic;
      g560: IN std_logic;
      g561: IN std_logic;
      g562: IN std_logic;
      g563: IN std_logic;
      g564: IN std_logic;
      g567: IN std_logic;
      g5692: OUT std_logic;
      g6282: OUT std_logic;
      g6284: OUT std_logic;
      g6360: OUT std_logic;
      g6362: OUT std_logic;
      g6364: OUT std_logic;
      g6366: OUT std_logic;
      g6368: OUT std_logic;
      g6370: OUT std_logic;
      g6372: OUT std_logic;
      g6374: OUT std_logic;
      g639: IN std_logic;
      g6728: OUT std_logic;
      g702: IN std_logic;
      g705: IN std_logic;
      g89: IN std_logic;
      g94: IN std_logic;
      g98: IN std_logic;
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
      PI(37) <= LOAD0(bit);
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
      PI(7) <= 'X'; 
      PI(8) <= 'X'; 
      PI(9) <= 'X'; 
      PI(10) <= 'X'; 
      PI(11) <= 'X'; 
      PI(12) <= 'X'; 
      PI(13) <= 'X'; 
      PI(14) <= 'X'; 
      PI(15) <= 'X'; 
      PI(16) <= 'X'; 
      PI(17) <= 'X'; 
      PI(18) <= 'X'; 
      PI(19) <= 'X'; 
      PI(20) <= 'X'; 
      PI(21) <= 'X'; 
      PI(22) <= 'X'; 
      PI(23) <= 'X'; 
      PI(24) <= 'X'; 
      PI(25) <= 'X'; 
      PI(26) <= 'X'; 
      PI(27) <= 'X'; 
      PI(28) <= 'X'; 
      PI(29) <= 'X'; 
      PI(30) <= 'X'; 
      PI(31) <= 'X'; 
      PI(32) <= 'X'; 
      PI(33) <= 'X'; 
      PI(34) <= 'X'; 
      PI(35) <= 'X'; 
      PI(36) <= 'X'; 
      PI(37) <= 'X'; 
      PI(38) <= 'X'; 
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
      PI(38) <= '1'; 
      PI(0) <= '0'; 
      wait for 100 ns;
      bit := SHBEG; multiple_shift(PI, UNLOAD, UNLMSK, SCANOUT, bit, nofails, CHAINnames);
      wait for 0 ns;
   END load_unload;

   BEGIN -------------------------------- testbench body --------------------------------
   -- *** Map inputs and bidis ***
   CK <= PI(0);
   g102 <= PI(1);
   g107 <= PI(2);
   g22 <= PI(3);
   g23 <= PI(4);
   g301 <= PI(5);
   g306 <= PI(6);
   g310 <= PI(7);
   g314 <= PI(8);
   g319 <= PI(9);
   g32 <= PI(10);
   g36 <= PI(11);
   g37 <= PI(12);
   g38 <= PI(13);
   g39 <= PI(14);
   g40 <= PI(15);
   g41 <= PI(16);
   g42 <= PI(17);
   g44 <= PI(18);
   g45 <= PI(19);
   g46 <= PI(20);
   g47 <= PI(21);
   g557 <= PI(22);
   g558 <= PI(23);
   g559 <= PI(24);
   g560 <= PI(25);
   g561 <= PI(26);
   g562 <= PI(27);
   g563 <= PI(28);
   g564 <= PI(29);
   g567 <= PI(30);
   g639 <= PI(31);
   g702 <= PI(32);
   g705 <= PI(33);
   g89 <= PI(34);
   g94 <= PI(35);
   g98 <= PI(36);
   test_si <= PI(37);
   test_se <= PI(38);

   -- *** Map outputs and bidis ***
   PO(0) <= g1290;
   PO(1) <= g1293;
   PO(2) <= g2584;
   PO(3) <= g3222;
   PO(4) <= g3600;
   PO(5) <= g4098;
   PO(6) <= g4099;
   PO(7) <= g4100;
   PO(8) <= g4101;
   PO(9) <= g4102;
   PO(10) <= g4103;
   PO(11) <= g4104;
   PO(12) <= g4105;
   PO(13) <= g4106;
   PO(14) <= g4107;
   PO(15) <= g4108;
   PO(16) <= g4109;
   PO(17) <= g4110;
   PO(18) <= g4112;
   PO(19) <= g4121;
   PO(20) <= g4307;
   PO(21) <= g4321;
   PO(22) <= g4422;
   PO(23) <= g4809;
   PO(24) <= g5137;
   PO(25) <= g5468;
   PO(26) <= g5469;
   PO(27) <= g5692;
   PO(28) <= g6282;
   PO(29) <= g6284;
   PO(30) <= g6360;
   PO(31) <= g6362;
   PO(32) <= g6364;
   PO(33) <= g6366;
   PO(34) <= g6368;
   PO(35) <= g6370;
   PO(36) <= g6372;
   PO(37) <= g6374;
   PO(38) <= g6728;
   PO(39) <= test_so;

   -- *** Map scanouts ***
   SCANOUT(0) <= test_so;

   -- *** Instantiation of Component ***
   dut: s9234 port map (
      CK => CK,
      g102 => g102,
      g107 => g107,
      g1290 => g1290,
      g1293 => g1293,
      g22 => g22,
      g23 => g23,
      g2584 => g2584,
      g301 => g301,
      g306 => g306,
      g310 => g310,
      g314 => g314,
      g319 => g319,
      g32 => g32,
      g3222 => g3222,
      g36 => g36,
      g3600 => g3600,
      g37 => g37,
      g38 => g38,
      g39 => g39,
      g40 => g40,
      g4098 => g4098,
      g4099 => g4099,
      g41 => g41,
      g4100 => g4100,
      g4101 => g4101,
      g4102 => g4102,
      g4103 => g4103,
      g4104 => g4104,
      g4105 => g4105,
      g4106 => g4106,
      g4107 => g4107,
      g4108 => g4108,
      g4109 => g4109,
      g4110 => g4110,
      g4112 => g4112,
      g4121 => g4121,
      g42 => g42,
      g4307 => g4307,
      g4321 => g4321,
      g44 => g44,
      g4422 => g4422,
      g45 => g45,
      g46 => g46,
      g47 => g47,
      g4809 => g4809,
      g5137 => g5137,
      g5468 => g5468,
      g5469 => g5469,
      g557 => g557,
      g558 => g558,
      g559 => g559,
      g560 => g560,
      g561 => g561,
      g562 => g562,
      g563 => g563,
      g564 => g564,
      g567 => g567,
      g5692 => g5692,
      g6282 => g6282,
      g6284 => g6284,
      g6360 => g6360,
      g6362 => g6362,
      g6364 => g6364,
      g6366 => g6366,
      g6368 => g6368,
      g6370 => g6370,
      g6372 => g6372,
      g6374 => g6374,
      g639 => g639,
      g6728 => g6728,
      g702 => g702,
      g705 => g705,
      g89 => g89,
      g94 => g94,
      g98 => g98,
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
      POnames(0) := new STRING'("g1290");
      POnames(1) := new STRING'("g1293");
      POnames(2) := new STRING'("g2584");
      POnames(3) := new STRING'("g3222");
      POnames(4) := new STRING'("g3600");
      POnames(5) := new STRING'("g4098");
      POnames(6) := new STRING'("g4099");
      POnames(7) := new STRING'("g4100");
      POnames(8) := new STRING'("g4101");
      POnames(9) := new STRING'("g4102");
      POnames(10) := new STRING'("g4103");
      POnames(11) := new STRING'("g4104");
      POnames(12) := new STRING'("g4105");
      POnames(13) := new STRING'("g4106");
      POnames(14) := new STRING'("g4107");
      POnames(15) := new STRING'("g4108");
      POnames(16) := new STRING'("g4109");
      POnames(17) := new STRING'("g4110");
      POnames(18) := new STRING'("g4112");
      POnames(19) := new STRING'("g4121");
      POnames(20) := new STRING'("g4307");
      POnames(21) := new STRING'("g4321");
      POnames(22) := new STRING'("g4422");
      POnames(23) := new STRING'("g4809");
      POnames(24) := new STRING'("g5137");
      POnames(25) := new STRING'("g5468");
      POnames(26) := new STRING'("g5469");
      POnames(27) := new STRING'("g5692");
      POnames(28) := new STRING'("g6282");
      POnames(29) := new STRING'("g6284");
      POnames(30) := new STRING'("g6360");
      POnames(31) := new STRING'("g6362");
      POnames(32) := new STRING'("g6364");
      POnames(33) := new STRING'("g6366");
      POnames(34) := new STRING'("g6368");
      POnames(35) := new STRING'("g6370");
      POnames(36) := new STRING'("g6372");
      POnames(37) := new STRING'("g6374");
      POnames(38) := new STRING'("g6728");
      POnames(39) := new STRING'("test_so");
      CHAINnames(0) := new STRING'("1");
      INPINV(0) := "1010101011010101010010101010101001010101001010101010101010101010101010" &
                   "1010101010100101001010110101010100101010100101011010101010101010101010" &
                   "1010101010101010101010101011010101010101010101010101010101010010010101" &
                   "0";
      OUTINV(0) := "0101010101101010101001010101010100101010100101010101010101010101010101" &
                   "0101010101010010100101011010101010010101010010101101010101010101010101" &
                   "0101010101010101010101010101101010101010101010101010101010101001001010" &
                   "1";
      SHBEGM(0) := "0000000000000000000000000000000000000000000000000000000000000000000000" &
                   "0000000000000000000000000000000000000000000000000000000000000000000000" &
                   "0000000000000000000000000000000000000000000000000000000000000000000000" &
                   "0";
      nofails := 0; pattern := -1;
      -- *** test setup procedure ***
      test_setup(PI); -- 200

      -- *** Scan test ***
pattern := 0; -- 200
LOAD0 <= "0100111101011100001111111011010011111001101000010000001000110001011111" &
         "0011011011010110111011000110000011001110001100110000110000110101111110" &
         "0011101001001010000001010000010110001010010111001011010101111111001110" &
         "0";
UNLMSK(0) <= "0000000000000000000000000000000000000000000000000000000000000000000000" &
             "0000000000000000000000000000000000000000000000000000000000000000000000" &
             "0000000000000000000000000000000000000000000000000000000000000000000000" &
             "0";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 21400
wait for 0 ns;
PI <= "001011010110010110101010010010001111100";
wait for 100 ns; -- 21500
XPCT <= "1111111001001010110100001000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 21540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 21600
wait for 0 ns; pulse_CK(PI);  -- 21700

pattern := 1; -- 21700
LOAD0 <= "0000101111101101011000010010101110010011010011101111101101010010100000" &
         "1100001010100001001010001001100101111111110000001011101100010100001110" &
         "1110011001101010011111110001101101111100111001010110101110100011011111" &
         "0";
UNLOAD(0) <= "0100111100111100011110000110000011011001000000010000101010100101011010" &
             "1010011011001111110011011100000011001010000100110010100101110001111111" &
             "1011101001001010101101011010010111001111010101101011111111111010000110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 42900
wait for 0 ns;
PI <= "001010101011101000110111101010100101010";
wait for 100 ns; -- 43000
XPCT <= "0001011110100011001011010110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 43040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 43100
wait for 0 ns; pulse_CK(PI);  -- 43200

pattern := 2; -- 43200
LOAD0 <= "1111011101100100000000101000000010101101000100010001010000000000110101" &
         "0011000010110001001010000011110011100001101111011001001000010101000010" &
         "1001001111101001011001101000111110001110001111001010000001101101011011" &
         "1";
UNLOAD(0) <= "0100101111001001011000110011101100110111001111001101110110100000001000" &
             "1001001001111111011010100010110101111011111001001001101001010100001101" &
             "0010011101110000011001011001110100011001111000110101110100100111010111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 64400
wait for 0 ns;
PI <= "000100011010100101100000010101101111100";
wait for 100 ns; -- 64500
XPCT <= "1011001010011110000110100100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 64540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 64600
wait for 0 ns; pulse_CK(PI);  -- 64700

pattern := 3; -- 64700
LOAD0 <= "1111000100111011000011010010001011010000101010101001110101111111001100" &
         "0001001010110010000100100111001101001001101000101110001110001100010110" &
         "1000010001011100100100110101101101111000011001110110001111001001011011" &
         "0";
UNLOAD(0) <= "1100011100100100000100010001001000101101001100010101100011100111011100" &
             "1000000010110011010010010001100011100101110110010000101101010101000001" &
             "1100001111101001110001011101110100011111000001111011000111101011110011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 85900
wait for 0 ns;
PI <= "001001111000001100100010111111010000000";
wait for 100 ns; -- 86000
XPCT <= "0000000000101010000100110000011111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 86040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 86100
wait for 0 ns; pulse_CK(PI);  -- 86200

pattern := 4; -- 86200
LOAD0 <= "1011100100101101000111010110000001011111101010100100001010001100000100" &
         "1010111000011100011000011000101010110110111111110011001001000110110010" &
         "1101111111110010011000011011111010001011001000101001010101111111100101" &
         "0";
UNLOAD(0) <= "1100000000111111000111010110001001110000000110100110100101111010010000" &
             "1000101010111110010100101111001110001001101000110100011110001100110101" &
             "0000010111011110100000101100111110111100010001110111101110000110010011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 107400
wait for 0 ns;
PI <= "001001100010101010001101001001011011110";
wait for 100 ns; -- 107500
XPCT <= "1110101010100000111101101010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 107540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 107600
wait for 0 ns; pulse_CK(PI);  -- 107700

pattern := 5; -- 107700
LOAD0 <= "0111111100100110111111001110100001101010110001001001110111011001000101" &
         "1010100011100010101001000100010111100100110111111101110000110111001110" &
         "1001111000111000110011101010111110010110011111111011001101100011010000" &
         "1";
UNLOAD(0) <= "1011100100101101000001111111010001111111001010000100001011001101100000" &
             "0100111010001000010000101000101010110010111111111000001101000010110010" &
             "1101111111111010110110010010101010001111000010111001010111110111001101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 128900
wait for 0 ns;
PI <= "011101110100101111001010001111111010000";
wait for 100 ns; -- 129000
XPCT <= "1100000010111100110100100000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 129040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 129100
wait for 0 ns; pulse_CK(PI);  -- 129200

pattern := 6; -- 129200
LOAD0 <= "0101001001111100011010100010010101010110010100101001110010110001010000" &
         "1100111111100010111110010000101100001111000110100101000000001101010011" &
         "0010110101010110000111001100011101011100000011110100000111100111011010" &
         "1";
UNLOAD(0) <= "0000111111000110111101010111100001101010001101001111101111111101100100" &
             "0000101011110111011001011100010101100100110110110000100100110111001111" &
             "1101011100111000010001101001111110010110010001101011000101101111010100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 150400
wait for 0 ns;
PI <= "000001111000000010101001001101000111100";
wait for 100 ns; -- 150500
XPCT <= "1011100000000010110100101000001111111000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 150540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 150600

pattern := 7; -- 150600
LOAD0 <= "1010100010110110100110001000111011000100000110001100011011110001101111" &
         "0000100101100101001101111100101000100001110001100011000110101101100000" &
         "1001000110110111000011110100111110101010110100011000101011100111110111" &
         "1";
UNLOAD(0) <= "0101001001111100011010100010010101010110010100101001110010110001010000" &
             "1100111111100010111110010000101100001111000110100101000000001101010011" &
             "0010110101010110000111001100011101011100000011110100000111100111011010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 171800
wait for 0 ns;
PI <= "010001001110011000010100010110011111110";
wait for 100 ns; -- 171900
XPCT <= "0101001001100001001101000010011111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 171940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 172000
wait for 0 ns; pulse_CK(PI);  -- 172100

pattern := 8; -- 172100
LOAD0 <= "0101011111111100010101101101111101110010101101110001011000110100000001" &
         "0100010000111010001001001100001101010011111100000100010011000111111101" &
         "1110100001001001101000001010111100111101001100111000100111001111011000" &
         "0";
UNLOAD(0) <= "1110100011010010100000110001101001000110011100101100010011010111100010" &
             "1110100101100001111111010010111101100011100001111100000110100101100001" &
             "0100100110111110000011010001111101111011010010001001001000100111111011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 193300
wait for 0 ns;
PI <= "001100000111101011000011001110001100010";
wait for 100 ns; -- 193400
XPCT <= "0101101110110100010110001100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 193440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 193500
wait for 0 ns; pulse_CK(PI);  -- 193600

pattern := 9; -- 193600
LOAD0 <= "1000101000011101111100001001110011110010010100001010000011101101011010" &
         "0001101111111010100011111101100110011001011100110001010000001000101010" &
         "0101111000111011010000001110010101010010010000101010010001010001011110" &
         "1";
UNLOAD(0) <= "1001111000110100000110010110101101110011100100110110100010101011011101" &
             "1101110110110110010001011010001111111110010100001110110011000011111100" &
             "1010001011001011101000011001100110010101011000110000101100001110110010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 214800
wait for 0 ns;
PI <= "011111010111101001100100111111010101000";
wait for 100 ns; -- 214900
XPCT <= "1101111110110110001110111100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 214940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 215000
wait for 0 ns; pulse_CK(PI);  -- 215100

pattern := 10; -- 215100
LOAD0 <= "1010101001100101011011111101001111000100001101011001101111011101000111" &
         "1101101110001011011110110110010000100010111111001111011101010101010000" &
         "0110100000001100100001010111110110001101011000010111011001111011101001" &
         "0";
UNLOAD(0) <= "1011101001111101100000110101111011010010000110000001000010101010010110" &
             "1011011111010110000001110001110101011101011101111100001000000100101001" &
             "1001011110111011111011011101000101010111000000111011101001011111110100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 236300
wait for 0 ns;
PI <= "011010111001100011101011110111101111100";
wait for 100 ns; -- 236400
XPCT <= "0001110110000110110000111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 236440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 236500
wait for 0 ns; pulse_CK(PI);  -- 236600

pattern := 11; -- 236600
LOAD0 <= "1011100101101101100110110001110001001100100100000100011101000110110011" &
         "0010001101111111001110010000110100001000101100010001001110010000101101" &
         "0110100101101100000100111101001100111110101111111001010001001010000111" &
         "0";
UNLOAD(0) <= "1011101011100101011100110101010111100100000101111111101111101111001111" &
             "1001101110011110010000010010000011100110011111001101110101010101010010" &
             "0110001100011100000111001000100100001100011010100010010100110011101000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 257800
wait for 0 ns;
PI <= "000001010101101010000100100101010110100";
wait for 100 ns; -- 257900
XPCT <= "1111000110100000011101110010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 257940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 258000
wait for 0 ns; pulse_CK(PI);  -- 258100

pattern := 12; -- 258100
LOAD0 <= "1011110001010101110010011010110001111111111001011110110000111101100001" &
         "1001101011100010100100000011100001011100000111001000010010101010100100" &
         "0011001111011010111001100011000000111100111111100011010111001101001010" &
         "1";
UNLOAD(0) <= "1111100101101101110001110101111001101100000100100100111111100110111010" &
             "1101001111101001000011001100100111001000110101011100011010010100101111" &
             "0011101101111110100010001000000110011011000001101001111101001101100111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 279300
wait for 0 ns;
PI <= "010111111000101110011110001000101111010";
wait for 100 ns; -- 279400
XPCT <= "1001010010111001111101000010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 279440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 279500
wait for 0 ns; pulse_CK(PI);  -- 279600

pattern := 13; -- 279600
LOAD0 <= "1000010110101001000111011101111010101001100001101100101111101011001000" &
         "0000110101111110101011011001110000110100110010000000111001010000110011" &
         "1010010001010000101011000110010011101100110110110011011011011101011111" &
         "1";
UNLOAD(0) <= "1000110001010001100000110100110001111111001101110010111011101001001000" &
             "1000110001111011001000011011100011011000010111010000100011100110000111" &
             "1110001111011000111011001101010010011001010001110011111110001110000000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 300800
wait for 0 ns;
PI <= "001110000111101011010001001010101010100";
wait for 100 ns; -- 300900
XPCT <= "0110111110110101010101001010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 300940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 301000
wait for 0 ns; pulse_CK(PI);  -- 301100

pattern := 14; -- 301100
LOAD0 <= "0011000000100011110111011110111100001010111110110011101111100000011001" &
         "0010001110101100000001000110100010101001110110110101111000110111101111" &
         "0101110011110010101111001110000010010000110100111110111010111001100011" &
         "1";
UNLOAD(0) <= "1011110111000101000100110000101010000001010110101110111010001101001100" &
             "1111110101101110001001111011000011110100010111011100100001011100010010" &
             "1010101101011000000011010001000111010001010000100011101100011110010010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 322300
wait for 0 ns;
PI <= "000010001111010111001101001101110100010";
wait for 100 ns; -- 322400
XPCT <= "0101111101001100111100111000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 322440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 322500
wait for 0 ns; pulse_CK(PI);  -- 322600

pattern := 15; -- 322600
LOAD0 <= "1110101101000011100000001010111010000110000111000111001100000001010001" &
         "1001000010110101111011101101110110100111101100100011010111001110010000" &
         "1100101001100000011011000001001001001100000011001111011100000001101111" &
         "1";
UNLOAD(0) <= "0001000001010111100001110111100100001010000100110110110111000010010100" &
             "1011101110101100111011011000100011101101100111110100111000111111001101" &
             "1000110110111000101000010100000010010000010010100111101001111001101011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 343800
wait for 0 ns;
PI <= "000001100111010111100111100101100000000";
wait for 100 ns; -- 343900
XPCT <= "0000101101001110011111111110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 343940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 344000
wait for 0 ns; pulse_CK(PI);  -- 344100

pattern := 16; -- 344100
LOAD0 <= "0100101111011111100100111110100110000110100110111011001010110101010101" &
         "0110001001011010110100010000101100111110100001110010011101111111001010" &
         "1111100011111010001111110010100101010011000110111011000111011011010001" &
         "1";
UNLOAD(0) <= "1100101001110101100000010111101000000010000101000110101111000000011100" &
             "1011100010100111110011010111110100101111101110110000100011011111010011" &
             "0001101111111000101110110100010001001101010011100001111100000011111111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 365300
wait for 0 ns;
PI <= "011000011101101101010101010100010110000";
wait for 100 ns; -- 365400
XPCT <= "1101000110101101001110010100011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 365440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 365500
wait for 0 ns; pulse_CK(PI);  -- 365600

pattern := 17; -- 365600
LOAD0 <= "1011000101010001111110110001000011110111100100100110110110001000111000" &
         "0000010100101111100100010101101110111010111101110001101111000000000001" &
         "0010011111010011011010100000101111001000000111100011001001100110001010" &
         "1";
UNLOAD(0) <= "0011101110011011100000010110111100000010111100111101001000110000011111" &
             "1111001001011100011100011001101110111110110000110000011101110111101010" &
             "0110000110111010100111101001100111000111000001111011010111010110110001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 386800
wait for 0 ns;
PI <= "001000010010000010010111011001001110110";
wait for 100 ns; -- 386900
XPCT <= "1111001000000001011101100010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 386940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 387000
wait for 0 ns; pulse_CK(PI);  -- 387100

pattern := 18; -- 387100
LOAD0 <= "1100011010101010100111111000011100010101101010101111111100000001001100" &
         "1010011100100100101101110010000001000011111011111001111101110110011011" &
         "0110100001011110011011100000010001011001111011110001101010111111001010" &
         "0";
UNLOAD(0) <= "1111000100110101111000111001001001010111011010000100101111001011011000" &
             "1110010100101011000001101101111100111010100101111000101011001100100011" &
             "0110111111011011011010010001100110011101000101100011000101101001100010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 408300
wait for 0 ns;
PI <= "001101111101011110100000001010011001100";
wait for 100 ns; -- 408400
XPCT <= "0100000101111010010101000010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 408440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 408500
wait for 0 ns; pulse_CK(PI);  -- 408600

pattern := 19; -- 408600
LOAD0 <= "0001011101001011000101110111000110101101000111011111101111001011010001" &
         "1001110010000100010010001101000010001000100001110101000100100011110011" &
         "0010110100100000010001111100000101100101001011001000001000101101000100" &
         "1";
UNLOAD(0) <= "1110011010101110100101000001001100110101000110101101111100100011001010" &
             "0101011110101101110101111000000011000011101010110010111101111010111010" &
             "0110100001011110011011001011010011011001010001110001001011111101000010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 429800
wait for 0 ns;
PI <= "010000011011010111101101101100001011110";
wait for 100 ns; -- 429900
XPCT <= "1100001101001110111111000110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 429940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 430000
wait for 0 ns; pulse_CK(PI);  -- 430100

pattern := 20; -- 430100
LOAD0 <= "1001100011011100111101100011011010010010001011111101111011111110110001" &
         "1001011100110100000111110000000111101110000001110100110001110101011111" &
         "1111100000111101011100010000010001101111101010010101011000101111000110" &
         "0";
UNLOAD(0) <= "0100011100001111000000101111000100101101001101011101100110001011011100" &
             "1001111010001011101000000001000011001100101001110110101001101111110000" &
             "0110111100111010011101010101010101000100000101111001010101101001100000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 451300
wait for 0 ns;
PI <= "000010001011100110001001111010101111100";
wait for 100 ns; -- 451400
XPCT <= "0111111110001000110111011110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 451440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 451500
wait for 0 ns; pulse_CK(PI);  -- 451600

pattern := 21; -- 451600
LOAD0 <= "0010001000101010101110010101000000111111001111101010110000010100010100" &
         "1101111010011010010101010011100000101111001101110101011001010000010111" &
         "1111010000101010110011010000011101101000010111010110101110001111100111" &
         "0";
UNLOAD(0) <= "1110100110001100101100101110010010110010001101010101111010101101111000" &
             "1101111110000110011010000000000111101010011001110010110001110001011110" &
             "1110101100111101011000011001010000011010000000110101111111101000000100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 472800
wait for 0 ns;
PI <= "001100100001111010001000110100011010000";
wait for 100 ns; -- 472900
XPCT <= "1110100111110000110100001000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 472940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 473000
wait for 0 ns; pulse_CK(PI);  -- 473100

pattern := 22; -- 473100
LOAD0 <= "1010111000001110111101000000011101010100000100100001001000010000100110" &
         "1111110011111010001010010010000110011100110011110011011110000010001001" &
         "1001100111001010000110111110010001101110011111000001010001101110100001" &
         "0";
UNLOAD(0) <= "0111001001101110101100111101000000011111001011101110100001110001110000" &
             "0011110010011110100100100001100010101011010101111011001101011100110101" &
             "1110010100101010110111001001001101101100010111010110111101001101101011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 494300
wait for 0 ns;
PI <= "001110001111100010111000011100001001100";
wait for 100 ns; -- 494400
XPCT <= "0100011110010011110110000100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 494440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 494500
wait for 0 ns; pulse_CK(PI);  -- 494600

pattern := 23; -- 494600
LOAD0 <= "1010101011001011101100110011101111100001001011100111111100011101011011" &
         "1111100010010101100111001111001000110101011000111010100111110100101011" &
         "0000001110011001011100111010111110000110101001110011111010101110101111" &
         "0";
UNLOAD(0) <= "1011111011001010101100101101000111110100011010101101101011100101101010" &
             "1001110001110010001010100100000111011000110011111111111111000010101011" &
             "0100001111001010100010011011000001011111011111110001101101100001101001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 515800
wait for 0 ns;
PI <= "001101010101101010111000100110011110100";
wait for 100 ns; -- 515900
XPCT <= "0111000110110011110111000110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 515940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 516000
wait for 0 ns; pulse_CK(PI);  -- 516100

pattern := 24; -- 516100
LOAD0 <= "1110011110101010011110111100100011011100101010111001011110000110111100" &
         "0110111110000111001111110100010001100110010100011001000001100101011000" &
         "1110100001101000010000111001000100110100001011111111100111110010011101" &
         "0";
UNLOAD(0) <= "1000101001101111101100101010110111100001010101100101111101111001011011" &
             "0001100000001000010111000101001010110001011001111010100011111100101011" &
             "0001101111011011011010001000111100010011101111110011110011100100001111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 537300
wait for 0 ns;
PI <= "011000000011111111110101010101101010100";
wait for 100 ns; -- 537400
XPCT <= "1100001111101111011000100000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 537440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 537500
wait for 0 ns; pulse_CK(PI);  -- 537600

pattern := 25; -- 537600
LOAD0 <= "1100011011001100001101101110010000000111000110001100001110001000010010" &
         "0101111011110100000110011001100010101010010000111111110010100001011110" &
         "1010001110011110000110101001100111001011100010000110101110001001111010" &
         "1";
UNLOAD(0) <= "1110111111000110011000001101111001110101110110111101101011101101011110" &
             "1001111100001111111001111000010001100110011100010111100101101001011010" &
             "1010101001101000110010011000010111010101001001111110100111011111010100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 558800
wait for 0 ns;
PI <= "000011000101101111111000101111011000110";
wait for 100 ns; -- 558900
XPCT <= "1100010110101111110111100110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 558940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 559000
wait for 0 ns; pulse_CK(PI);  -- 559100

pattern := 26; -- 559100
LOAD0 <= "0110000110001100010101011111101010000011000111001001110111001100100011" &
         "0011010000001001001100101101100101110100100110111000010000110110011000" &
         "0011101000001001101110000010110001001011010010111110010010111011101011" &
         "0";
UNLOAD(0) <= "1110011000001000001101000111000010000111010110001100010110101111011110" &
             "1011110001100010001110110001100010101110011000110101110010100101111100" &
             "1011101111011110001000101000110101011011100110000010011101000111111010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 580300
wait for 0 ns;
PI <= "011011100000111110000101101111101111110";
wait for 100 ns; -- 580400
XPCT <= "0101110011101000011110111100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 580440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 580500
wait for 0 ns; pulse_CK(PI);  -- 580600

pattern := 27; -- 580600
LOAD0 <= "0111110111010011101101001110100001100010100110100100010000110100010100" &
         "0100110011100010001101000110101111001101000010101010101100100000001001" &
         "0110101010110110011011011001100010000111110100101011011111111001001000" &
         "0";
UNLOAD(0) <= "0001000111001100010000001110111000000011000101101111100111101101001010" &
             "1110011010011110111000010101100111110000111110110010110001110110011000" &
             "1011001001011001101010001000100001011111010110111011010101111110101111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 601800
wait for 0 ns;
PI <= "001110111110001110000001010101111000100";
wait for 100 ns; -- 601900
XPCT <= "1100111000111000010011101110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 601940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 602000
wait for 0 ns; pulse_CK(PI);  -- 602100

pattern := 28; -- 602100
LOAD0 <= "0110010001100011010110001011101011001010001010101100001010011000010110" &
         "1100101110110001000000100110100100000111110100110110111000100111010000" &
         "0011100001001111010110011110011000100011010100111011110011111101000101" &
         "0";
UNLOAD(0) <= "0100110101010111101101011110111001000010100110000100011011010101011000" &
             "1010111011110101001101111110101111001001000010100000101100101000001010" &
             "0010001011110100011001010100110010110011110100101010010100110100100100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 623300
wait for 0 ns;
PI <= "001001011110101110010100110110011101110";
wait for 100 ns; -- 623400
XPCT <= "0101101010101001011101001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 623440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 623500
wait for 0 ns; pulse_CK(PI);  -- 623600

pattern := 29; -- 623600
LOAD0 <= "0001100000100111110111010100111101111101101001011011101000101100001111" &
         "1011001110000000100110001000011010100101000100110110011010110000011000" &
         "0001000000011110000001101100111001010110000101110011100011111110000111" &
         "1";
UNLOAD(0) <= "0000010011000111010000001010101001001010010110101100001011111101110010" &
             "0010101100110100011010110000100111000011110100110110111100101111110010" &
             "1010000100011111110010111110011001110110010000111011100001110110000101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 644800
wait for 0 ns;
PI <= "011101111111111010001100010000001000000";
wait for 100 ns; -- 644900
XPCT <= "0100001111110000111100000000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 644940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 645000
wait for 0 ns; pulse_CK(PI);  -- 645100

pattern := 30; -- 645100
LOAD0 <= "0000111001010010001111111110001011110100001100110000011011011010110100" &
         "0011111000110101010110110101101101010011100100010000110010110110010101" &
         "1101001010111011101011011110111111001101100111011000110111010101001000" &
         "1";
UNLOAD(0) <= "0100100000000111110010111100110101011101000001011001101010101001001000" &
             "1011000110011111101010001100001011100001010101111110111111110000111011" &
             "1000001000011110100001011010110011010110000101110011001101110110000111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 666300
wait for 0 ns;
PI <= "001101011001110110010010010100111110000";
wait for 100 ns; -- 666400
XPCT <= "0111100111011001010100011000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 666440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 666500
wait for 0 ns; pulse_CK(PI);  -- 666600

pattern := 31; -- 666600
LOAD0 <= "1001100100010100000111000101110011101011101100100100100111111001000001" &
         "1111111100011101001000110100000011001001111111110101001111010101010011" &
         "0010100010101111001001110001011010001110000110001100110111110110101001" &
         "0";
UNLOAD(0) <= "0010111000010110001101100110001011010100010010110110010010111011011010" &
             "1111110000101111111110110101111100010011110101010100100110111110010100" &
             "1000101011111001101111001100111101001001000001001001111111011000100000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 687800
wait for 0 ns;
PI <= "010111100101010011011010011001001011000";
wait for 100 ns; -- 687900
XPCT <= "1100010101010101110101110010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 687940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 688000
wait for 0 ns; pulse_CK(PI);  -- 688100

pattern := 32; -- 688100
LOAD0 <= "1101011100111000011110011010101101011010101110111100101001000011101000" &
         "1111101101111100101100011001010111111101100111101000101101110111100100" &
         "0100000101000010010110100101001101010011011111100100001011101101111010" &
         "0";
UNLOAD(0) <= "1111100110110000000100100101100011001011111000000100100110101111001101" &
             "1111111100000111110000001100010001001101100111111001101011010101110001" &
             "0111101110101111101001001000000010011110000010111100011101111001101101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 709300
wait for 0 ns;
PI <= "001111101011011011000100011001001000100";
wait for 100 ns; -- 709400
XPCT <= "0100011101110100011101110010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 709440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 709500
wait for 0 ns; pulse_CK(PI);  -- 709600

pattern := 33; -- 709600
LOAD0 <= "0100000000100011000110100000010101110011000010101101010001011000011111" &
         "1111010101100011100110010000000010101010110100000110101011010010011111" &
         "1110010011111001010101111001101110001110001100111011101101010101011100" &
         "1";
UNLOAD(0) <= "1111011100011100011000010010101101111010100110111100100010000101101100" &
             "1101100111101010111000111011000110111101100110101100101001111111100100" &
             "0100101101000010010000010111000111010111011011100100000110101110111010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 730800
wait for 0 ns;
PI <= "010111111010011010100010101101101011000";
wait for 100 ns; -- 730900
XPCT <= "1100011001110010010001110010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 730940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 731000
wait for 0 ns; pulse_CK(PI);  -- 731100

pattern := 34; -- 731100
LOAD0 <= "0101001101001011111110111101010100110000000100011101000100100000011011" &
         "0101011001000011110100100100010110101000000110101110000101010000010001" &
         "1011101110111110011111100010111101010010100110110111101111010101000110" &
         "0";
UNLOAD(0) <= "0110000000000111000100001000001101110011001100001101101010101111011011" &
             "1100010111110111101010000010010000101010100100001010101111011110011111" &
             "1010011111111001011001011100110100011110001000101010001110010100010100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 752300
wait for 0 ns;
PI <= "001101011100111111010001010010001001100";
wait for 100 ns; -- 752400
XPCT <= "1100000011111101010101000010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 752440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 752500
wait for 0 ns; pulse_CK(PI);  -- 752600

pattern := 35; -- 752600
LOAD0 <= "0010100101111110110101001110111101110101101001011001001101001011000101" &
         "0110100100101010010100011111000001101111101100110011000001010001110110" &
         "0101110100111101011010011010001101001111001010100010000101100101111110" &
         "1";
UNLOAD(0) <= "0000001100001111111100010100001110010000011000111101111110100111011111" &
             "1110011001011011101000010110010100101100010110100000100001011100110011" &
             "0010001010111110011111001101110101000010100100110111001100010100100110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 773800
wait for 0 ns;
PI <= "011011111001010010001010010111011010110";
wait for 100 ns; -- 773900
XPCT <= "0100110101000000110110111100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 773940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 774000
wait for 0 ns; pulse_CK(PI);  -- 774100

pattern := 36; -- 774100
LOAD0 <= "1101010010001011001111110101010010001000100010111011101010001100000111" &
         "1110100101010011000001110110111000111000111100011001101011100011101110" &
         "1011010011011011110011101101101010100000111100010001100010001001100000" &
         "1";
UNLOAD(0) <= "0011100100111100110101111011100101100101100101011101000111101101001001" &
             "1101100110110000100100011100010001101011101111111001000111010100111100" &
             "1010010100111111111110001101101111101111001011100010101101100011001110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 795300
wait for 0 ns;
PI <= "000000101010001011100011011101101100110";
wait for 100 ns; -- 795400
XPCT <= "1101001000100110010000100000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 795440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 795500
wait for 0 ns; pulse_CK(PI);  -- 795600

pattern := 37; -- 795600
LOAD0 <= "0010011101100110110101100010010010001100101001111100000101101001000111" &
         "0110100101000111011110111110001010001110000111011011010101110011001011" &
         "0101001001011011001110001111000100101101110110100011111010001000010110" &
         "1";
UNLOAD(0) <= "1110010010101111001100010101011010101000100000111111111010101011101101" &
             "1100100111011111000011001000101011111100100100011111101111101011001111" &
             "1010011110011001111011111100110010010001111110100000011111001111001000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 816800
wait for 0 ns;
PI <= "011010011010111010000000000011001111000";
wait for 100 ns; -- 816900
XPCT <= "1101111011100000010111111110000000100000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 816940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 817000
wait for 0 ns; pulse_CK(PI);  -- 817100

pattern := 38; -- 817100
LOAD0 <= "0100100000111101100100110110101010101000100011001011011100011101001111" &
         "1100101000100001010011101001101010110011001111100001010101000111000001" &
         "0011100010001110011110011100000010100011110111001101101111100101011011" &
         "0";
UNLOAD(0) <= "0010011111000110110100101011001000001100101001011100111111101101101011" &
             "1110100111000110101000001000001011001010010111011101111101110111101010" &
             "0100101100011011000100011111010111001001110000110011001111000101010010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 838300
wait for 0 ns;
PI <= "011011110111010010001011100110101010000";
wait for 100 ns; -- 838400
XPCT <= "0100111101000000110010011100000111100100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 838440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 838500
wait for 0 ns; pulse_CK(PI);  -- 838600

pattern := 39; -- 838600
LOAD0 <= "0110110011100111111110010010100011100100100000000101011100100001111111" &
         "0110011100010101011111111100000000010001110001010010011110000111101100" &
         "0010010100111110001111011010110001101010110011110000010110001110110000" &
         "1";
UNLOAD(0) <= "0100100001111101100100011111110010001000101101001101111110101011001011" &
             "1111100010111111110011001111111001110011000110101111110101000011000010" &
             "0111001110001100010110011111010011000011110101111000110110101001010111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 859800
wait for 0 ns;
PI <= "001100110011101110000101110110111100010";
wait for 100 ns; -- 859900
XPCT <= "1101101110111000011001001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 859940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 860000
wait for 0 ns; pulse_CK(PI);  -- 860100

pattern := 40; -- 860100
LOAD0 <= "1101111000100010001100011101101100101001101010010001001010000101010110" &
         "1110001100110001001010100111100111100101100111100101111100010100110101" &
         "1101000100100111011000110110111101001000010001111000111000011101010000" &
         "0";
UNLOAD(0) <= "0010110000010111100000010110101001000100101000100110010101100011110011" &
             "1111111110101001011111001100000010011001111000010000011110000011001101" &
             "0110110010110100100110011011110011101011110011110001111111000110011010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 881300
wait for 0 ns;
PI <= "000110000011010110001100010101101101100";
wait for 100 ns; -- 881400
XPCT <= "0101011101011000111010110100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 881440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 881500
wait for 0 ns; pulse_CK(PI);  -- 881600

pattern := 41; -- 881600
LOAD0 <= "0011001111110011011100111000010011010101101110111110100101011100111011" &
         "1001011111010000000011100010101110011110100001000110011110010000001010" &
         "1010010010001010111011010001001111001001011000110100100110100110011001" &
         "0";
UNLOAD(0) <= "1000111001000110001000000101110100000001100010110101100010001101011011" &
             "1111001110111011111001111011000111100000001110100111110101011100010100" &
             "0100001000101101011000010001110111010101010101111001100100011011010000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 902800
wait for 0 ns;
PI <= "011100110001110111010110010101001011010";
wait for 100 ns; -- 902900
XPCT <= "1100100111011101011111111110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 902940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 903000
wait for 0 ns; pulse_CK(PI);  -- 903100

pattern := 42; -- 903100
LOAD0 <= "0000010100110100100100100110101000001111000101000001001011110111010011" &
         "0101011101111110011001001111101110111100001110100100111101110001000101" &
         "0111111000111100000101011101101100100111100000011110110010011110100101" &
         "0";
UNLOAD(0) <= "0100001111010111011000101000011001110101011000011110100111101001011110" &
             "1001011101011110101011011010111100011110111001010010101011011000101000" &
             "0110011010001010110011001000010110011100010000100101001100100010110001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 924300
wait for 0 ns;
PI <= "001001110110101010001010010111001110100";
wait for 100 ns; -- 924400
XPCT <= "0111101010100000110110111100001110110000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 924440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 924500
wait for 0 ns; pulse_CK(PI);  -- 924600

pattern := 43; -- 924600
LOAD0 <= "1010000011001111111101111010000100010110101000000010000101000101010001" &
         "1000101110001101000110110110100110111001011000000011100101110000111011" &
         "0110001001111010000011110000011000001000100000000001011000111110110110" &
         "0";
UNLOAD(0) <= "0101010100110100100110101110110010001111000001000001110010100101111011" &
             "1110011111100110000011000011101111111000011111101110111001110001100100" &
             "0011111100111110100101011010100101000010100010111110100110011100101101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 945800
wait for 0 ns;
PI <= "011101111001101010001100010101101011010";
wait for 100 ns; -- 945900
XPCT <= "1100000110110000111110110100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 945940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 946000
wait for 0 ns; pulse_CK(PI);  -- 946100

pattern := 44; -- 946100
LOAD0 <= "0010110011011000100110111111010000011101000101000010100110101111011110" &
         "0010010010010000011010110001001000001001111110010100010101010110111011" &
         "0010111011101101000111011110011100100010101000010010001000110110100001" &
         "0";
UNLOAD(0) <= "1111000011101111111000101011010100010110000000000100111111100011011010" &
             "1011100110001111000010011110100110111001011001011010100001110000011011" &
             "0010101100111000000001101010000010011001000110110001010100110101011110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 967300
wait for 0 ns;
PI <= "010010000101001011110000110100111110100";
wait for 100 ns; -- 967400
XPCT <= "1101110100100111010100001000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 967440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 967500
wait for 0 ns; pulse_CK(PI);  -- 967600

pattern := 45; -- 967600
LOAD0 <= "0110101010001010011110001100111101001110100110101101100010100011000100" &
         "0000010001011110010110011111011111111100010011010100010011010101101111" &
         "1000101010011100010010010110000101101110000010110111000101001111000011" &
         "1";
UNLOAD(0) <= "1010110010110100000100101010011000110101010010100100110011101011110110" &
             "1001010100011100010001110001011001101100001111011110010101011010011000" &
             "0010001011111101001111101001011101100001000010010011101001011110101100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 988800
wait for 0 ns;
PI <= "010001010100111110111011110110111111100";
wait for 100 ns; -- 988900
XPCT <= "0101100011101011110101001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 988940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 989000
wait for 0 ns; pulse_CK(PI);  -- 989100

pattern := 46; -- 989100
LOAD0 <= "0111100001001010100110110111100000100001101100110000011000101001110100" &
         "0001010001100111001011110110011010001111000000110000101100110100110011" &
         "1111011010010011000001111010101100101101001100010010001100000111100110" &
         "0";
UNLOAD(0) <= "0011101011001110011100000000100111001110011010101101101001100101001010" &
             "1110011001000100111111111101001110111000011010010110010111011001001111" &
             "1101101011011100110110001001000111101110000100100111111101001100100011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1010300
wait for 0 ns;
PI <= "011001000111001111000000010110111111100";
wait for 100 ns; -- 1010400
XPCT <= "1101001100101100010100000000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1010440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1010500
wait for 0 ns; pulse_CK(PI);  -- 1010600

pattern := 47; -- 1010600
LOAD0 <= "0111100101110101011100010100000010100110000110000110000000100011001110" &
         "1010101001100111001101100101001101100110111100100100000011110011111101" &
         "1011010101001001100001111101001101101110101101100010010100010100011101" &
         "0";
UNLOAD(0) <= "0010100001001110100100001110101000100001000010010100000011001101111100" &
             "1101010011101101011011101100011000001111000000110110101100111000010000" &
             "0011111110011001001001010010111110011101000010010011010001001110101010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1031800
wait for 0 ns;
PI <= "010110110000011010100100111000011001000";
wait for 100 ns; -- 1031900
XPCT <= "1100010001110010011111000110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1031940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1032000
wait for 0 ns; pulse_CK(PI);  -- 1032100

pattern := 48; -- 1032100
LOAD0 <= "1111001010110110011110000100001000010011101111110001101000001110111010" &
         "1010111000000010100010111000011110111010011011010000011010110001011111" &
         "0101001000100100111000110101101001011111111110010000111001011101110101" &
         "1";
UNLOAD(0) <= "0100100101110101011000001100001000100110000010100110010001100001001000" &
             "0100100011101011100101100111011100100010100100111110000111110011111101" &
             "1010110101001011100011001110011100111010000101100011000100011100110001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1053300
wait for 0 ns;
PI <= "001100110000011111100101010111001001110";
wait for 100 ns; -- 1053400
XPCT <= "0100000001111110011100100000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1053440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1053500
wait for 0 ns; pulse_CK(PI);  -- 1053600

pattern := 49; -- 1053600
LOAD0 <= "0001110111110111111101100100001001011011101100101110111110101011001101" &
         "1100101111000101111110010001001110001100110110000110001000010110100010" &
         "0001101100010111111111110101000101001100011000100011110100110100111010" &
         "0";
UNLOAD(0) <= "1110001011110110011010010100011000110011001011010111110011001111111100" &
             "1100110010010111100010101100001111111110000010010100101011110001111100" &
             "1100001000101110010000000101110010011011010010100001100101011100111001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1074800
wait for 0 ns;
PI <= "011001100111111111100010000001101111010";
wait for 100 ns; -- 1074900
XPCT <= "0101001111101110010011100110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1074940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1075000
wait for 0 ns; pulse_CK(PI);  -- 1075100

pattern := 50; -- 1075100
LOAD0 <= "0010011111111100000110001010010010011001100110010111101110000101011110" &
         "1110111011001100111001010110010011010010100101000010111111010000011000" &
         "1100000011011101110101000111001001100010101100000100100001011100010111" &
         "0";
UNLOAD(0) <= "0110110111010111111100101100001011111011100000001110101110001001001101" &
             "1001100111000011111010001111011101001100111111000110111101010010000011" &
             "1001101000010101110111010101010110001100011110100010110110110110111110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1096300
wait for 0 ns;
PI <= "010000110101001010010011010000101100100";
wait for 100 ns; -- 1096400
XPCT <= "1101100100100001010001001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1096440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1096500
wait for 0 ns; pulse_CK(PI);  -- 1096600

pattern := 51; -- 1096600
LOAD0 <= "0001011110001011111110001111011010011101100111000101110100101111111111" &
         "1111000000000111101001111111110111100001101011110010000111010101001011" &
         "1011001111011100101111111001000100011111100111101010010111110111100101" &
         "1";
UNLOAD(0) <= "0011011111011000000110100010011000111001111010010111110111100011111010" &
             "1001111001000110001001111110000010010010100101001110111111010000011001" &
             "0100101011010101110101001110000011000011101100110001001100010110110011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1117800
wait for 0 ns;
PI <= "001111011011011011101101111101101001010";
wait for 100 ns; -- 1117900
XPCT <= "0100011101110110111001100010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1117940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1118000
wait for 0 ns; pulse_CK(PI);  -- 1118100

pattern := 52; -- 1118100
LOAD0 <= "0000101000100010001100110111101101111100001100101011100011111010110000" &
         "1010110111100011111010101110100011001011100001110011010000100010110010" &
         "0101011000101000000101011000111010111100101001001110000011000100110100" &
         "1";
UNLOAD(0) <= "0110011111101111111000100010010010011101101001000111110110101111111101" &
             "1111000010000011110000011101110101100101100011111010110111011001001000" &
             "0110101010010100101011011001010110011011100111101011111111110100101001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1139300
wait for 0 ns;
PI <= "000000111011101111001000011000101101100";
wait for 100 ns; -- 1139400
XPCT <= "0101101110101100110110011100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1139440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1139500
wait for 0 ns; pulse_CK(PI);  -- 1139600

pattern := 53; -- 1139600
LOAD0 <= "0000011111111111001100110001000100011010001111010111110110011101011011" &
         "0101101010100001000111101010100111110100000000100001100100110001011010" &
         "0011000100001110101011110010000101101101100000110110101111000100001111" &
         "1";
UNLOAD(0) <= "0100101000000110001100101111100101111100000010101101110010101011111110" &
             "1001110111111110001010100100110001001111111001110010110001101010010001" &
             "1100011000111000100101011111110000001001000111111111000101000111111100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1160800
wait for 0 ns;
PI <= "010010001011111010101101011101011110100";
wait for 100 ns; -- 1160900
XPCT <= "1101011111100010111111110110011100111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1160940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1161000
wait for 0 ns; pulse_CK(PI);  -- 1161100

pattern := 54; -- 1161100
LOAD0 <= "1011000010001110101100111111100010111110000111011011101100010000010101" &
         "1111110110111001111101011011011101111000011111000100110110110010011010" &
         "1100110011101001101101110100000100000000110111000001010001111110000100" &
         "0";
UNLOAD(0) <= "0000011110011111001000100001010100011010000001010111110110111001010011" &
             "1011100010111001101111000010110101110000011001101011100000110001111000" &
             "0010000101001110001001111100010101111001100000100110100110001111100111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1182300
wait for 0 ns;
PI <= "010101000010110110001100100101101100010";
wait for 100 ns; -- 1182400
XPCT <= "1101001011011000111010100100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1182440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1182500
wait for 0 ns; pulse_CK(PI);  -- 1182600

pattern := 55; -- 1182600
LOAD0 <= "0001001110000001010100101111000111010110101100011010100101001000001101" &
         "1010001111011010010000001111101110000101010100000001101100000100110101" &
         "0111011110011111101100011100110001101111100101111011010110100111000110" &
         "0";
UNLOAD(0) <= "1111000011101110101000101110100000011110001001111111111111100011111001" &
             "1010111110111110100001010011001110111000010111000110110111110010011010" &
             "0101011010101001101111011011000100000001110101100000010100111010100100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1203800
wait for 0 ns;
PI <= "011011000000110010101100000101001101110";
wait for 100 ns; -- 1203900
XPCT <= "1101110011000010111110111100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1203940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1204000
wait for 0 ns; pulse_CK(PI);  -- 1204100

pattern := 56; -- 1204100
LOAD0 <= "1100100111000111100110111111101001000101001110010000010101100101111110" &
         "1101000000111110000110110010111011000001001011001110010100000000101111" &
         "0110110011100111100100100111010100101001101110100100010010010011110000" &
         "0";
UNLOAD(0) <= "0101001111000101010010100111000111010110000000011110111110101001001000" &
             "1010001111010010111010011011111101000001010101011110101101001000110110" &
             "0011011010011111101100001011100011001011000001111011000100101011100110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1225300
wait for 0 ns;
PI <= "010110010101001010100000010000011110000";
wait for 100 ns; -- 1225400
XPCT <= "0101010100110010010100010000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1225440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1225500
wait for 0 ns; pulse_CK(PI);  -- 1225600

pattern := 57; -- 1225600
LOAD0 <= "1111001010011001001111000001101011011001011011101101000101010111000001" &
         "1101011111001101100011110000100001100010100101000001101010100111111011" &
         "0011011011000111101011000011010011110100100011100011001011101011001010" &
         "0";
UNLOAD(0) <= "1011100111100111100110000110111011100101001010010010010100000111111010" &
             "0101000010101110000111110010111000000001000010001100010100000100101100" &
             "0110110011100111101000000010000101111000101110100100010010010100111100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1246800
wait for 0 ns;
PI <= "011010000101111100111110111111100011110";
wait for 100 ns; -- 1246900
XPCT <= "0100110111101011101001101010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1246940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1247000
wait for 0 ns; pulse_CK(PI);  -- 1247100

pattern := 58; -- 1247100
LOAD0 <= "1111011000011110110101010110110010101011110000011010001100000011111100" &
         "0011100100111011001110011111011100010100101101100111001001100010110011" &
         "0100010010001100001010000111000000101001000111000111010111000001110110" &
         "0";
UNLOAD(0) <= "1011101011010101001000010001110001010001001100101111111011001110001001" &
             "1011010101000111111001000010000011100010011100000101100011101111011010" &
             "1110101111000101001011000001000100010001100001100010010110001111000010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1268300
wait for 0 ns;
PI <= "010011110000110010110110100000010101000";
wait for 100 ns; -- 1268400
XPCT <= "1101110011000011011110011100010000100101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1268440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1268500
wait for 0 ns; pulse_CK(PI);  -- 1268600

pattern := 59; -- 1268600
LOAD0 <= "1110100110010100001111010001001110001100011110000000111001000111110101" &
         "1000000000101001001111000110000000000000001101111110101110000100111001" &
         "1110011101000010001101011100010011101111011010101000110100111111011111" &
         "1";
UNLOAD(0) <= "1011011001110010110001010011101000001011001110111100001101100000110000" &
             "1110100100111111100100101011011101010000010100111100000101100110110010" &
             "1101010110011110101010101101000010111110000011000111111100000001011011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1289800
wait for 0 ns;
PI <= "011110000000010111110010011111110011100";
wait for 100 ns; -- 1289900
XPCT <= "0100110001011111010100111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1289940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1290000
wait for 0 ns; pulse_CK(PI);  -- 1290100

pattern := 60; -- 1290100
LOAD0 <= "0101010101010101000101100011110100010101011000110000011010010010101101" &
         "0110101010001100111111001110011010101111101111011111001011111010001110" &
         "1110000011000001010111101110100101000010001000100000100100010101100101" &
         "1";
UNLOAD(0) <= "1101100111110000001101010000011110100101000100100100100001001110110100" &
             "0100000100111001110101000000000011100100001100110100110110000100011000" &
             "0110001101001000101001000001000101110101010000111001100111010010110111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1311300
wait for 0 ns;
PI <= "010101110010001110000100111011010101010";
wait for 100 ns; -- 1311400
XPCT <= "1101001000111000011110110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1311440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1311500
wait for 0 ns; pulse_CK(PI);  -- 1311600

pattern := 61; -- 1311600
LOAD0 <= "0100101101101111100101111101000110010000000101010010111011101111001000" &
         "0000011111011100010111111100011100010111101000101000001010100110000101" &
         "1010000010110101001011111100010101000000100001110010010001000010011001" &
         "0";
UNLOAD(0) <= "0001010110110101000001010011101100110101001100010100000010010100000001" &
             "1000100010000100000101000000011001101011001110010101000111110110101101" &
             "1111100110000011111101110101100100000110001010100000011101010111001100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1332800
wait for 0 ns;
PI <= "011111010110010010111100000111000100100";
wait for 100 ns; -- 1332900
XPCT <= "1101011001010011111110100100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1332940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1333000
wait for 0 ns; pulse_CK(PI);  -- 1333100

pattern := 62; -- 1333100
LOAD0 <= "1111101100000100000000110001010101100011100100100111101101110110011110" &
         "0000110010110001000111010100001110110010110010011110111010010110101100" &
         "1100010010111000110110110111111001100011001011111101101111011001001101" &
         "1";
UNLOAD(0) <= "1111001100101011100000010100010100010000011111110100110110000000001010" &
             "1010010101001111110001110010011101010011001000111100100011100110100101" &
             "1011111111111111100111010000000101000011000001100011000100001000110000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1354300
wait for 0 ns;
PI <= "000101011101001100010010100111101011100";
wait for 100 ns; -- 1354400
XPCT <= "1010000100111001000111110110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1354440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1354500
wait for 0 ns; pulse_CK(PI);  -- 1354600

pattern := 63; -- 1354600
LOAD0 <= "1011011110001000010000000111001110010101000001100011011111011101010100" &
         "1001001101000101100011011101011010000010100101110011111110011111101111" &
         "1100000111001000110001101110101110010001111110111001000010110000110001" &
         "0";
UNLOAD(0) <= "1010101101000000000100010000011111100011011110100111101111101011011000" &
             "1001111000111111011001101000001111010010001010010100110111010110001110" &
             "1000011111111000010000001101110011010110000001111101011101010110100100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1375800
wait for 0 ns;
PI <= "001111001100001010111000010110001111110";
wait for 100 ns; -- 1375900
XPCT <= "0011010000110011110110010100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1375940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1376000
wait for 0 ns; pulse_CK(PI);  -- 1376100

pattern := 64; -- 1376100
LOAD0 <= "0001011001101000101011110101000011100111110111000110110111010001111000" &
         "1011101111111101100000001111001001010111101010111000011010000010111011" &
         "0111010011110011001100110101101111111000111010111010001010001011010010" &
         "1";
UNLOAD(0) <= "1010011111001100010100110111010100110101011111000111111011101011111000" &
             "1100000101000010011001100001011001000010000101111100100111011111101110" &
             "0100101111001010111011001101110100010011010010111001010101110101011001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1397300
wait for 0 ns;
PI <= "000100111111000100010100001011110100000";
wait for 100 ns; -- 1397400
XPCT <= "1001001100011001001101110010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1397440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1397500
wait for 0 ns; pulse_CK(PI);  -- 1397600

pattern := 65; -- 1397600
LOAD0 <= "0110000111001101011111000010101000011011000001010101011010011001000101" &
         "1001000111111000011111101000010001100011010100100001001001110111101101" &
         "1000110110110011011001100100001111000011110111110100111011110100011011" &
         "0";
UNLOAD(0) <= "0101011011111100100001110110001011100111000111100010110110010000111000" &
             "0001101101101101000000101101001010011011101011110100011010001110011001" &
             "1010110111111001100000010000101110111001010000100011101011001000110000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1418800
wait for 0 ns;
PI <= "000011001110111010111000101111011100000";
wait for 100 ns; -- 1418900
XPCT <= "0101011011100011110101110010000111101000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1418940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1419000
wait for 0 ns; pulse_CK(PI);  -- 1419100

pattern := 66; -- 1419100
LOAD0 <= "1001000111100001101100001110011110000001001011110010001011101010011011" &
         "0111011000101100010011010111100011011100011010000100011010000010000000" &
         "1100100010100100111000000001000101000001001000111000101010110100000010" &
         "1";
UNLOAD(0) <= "0101000001011001000111001111100000011011010101110110010011011011010010" &
             "0010101101110001111110000010010000101011010100111110001101110011101100" &
             "1000010011111011111110010100001101000011010101110101111010111101010101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1440300
wait for 0 ns;
PI <= "001011011101110011010010111100011100000";
wait for 100 ns; -- 1440400
XPCT <= "0101110111000101010110011100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1440440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1440500
wait for 0 ns; pulse_CK(PI);  -- 1440600

pattern := 67; -- 1440600
LOAD0 <= "0101111000111000110110010001100100001001101010001110000000111001100000" &
         "1011100101100110010100000111100100010000001110000110011001000100100110" &
         "1001010011001000000111100101001001101101001000101111111010001111010100" &
         "0";
UNLOAD(0) <= "1111000001110101100110110110001110100001010001110110000010001001010111" &
             "1101111000100100100011010111110001011100011011001000011010001010100000" &
             "1000100010110110111100000100000101000100011000110000101000111010000000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1461800
wait for 0 ns;
PI <= "000100111111111110111100001110011100000";
wait for 100 ns; -- 1461900
XPCT <= "1101001111111011111101010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1461940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1462000
wait for 0 ns; pulse_CK(PI);  -- 1462100

pattern := 68; -- 1462100
LOAD0 <= "0011100100010010110100001101001101101011111001000000100010010011001101" &
         "1110001011110000000100000110000001111001111110001111000100000100010111" &
         "0010101000000000001101010000100011101001101111000010000101110010010100" &
         "1";
UNLOAD(0) <= "0100111000111100100000010110100100101001010010100110001000111011110000" &
             "0101100101101110110110101011100111011000011110010110011001001100100110" &
             "1000110111001010100110011000011011101100010000110011111000000110010110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1483300
wait for 0 ns;
PI <= "001011101010011001010101111000100000000";
wait for 100 ns; -- 1483400
XPCT <= "0100111001100101001010001100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1483440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1483500
wait for 0 ns; pulse_CK(PI);  -- 1483600

pattern := 69; -- 1483600
LOAD0 <= "1110111111100001010110011100111111001000100010001011110110100110101010" &
         "0000010010010101011110010001101011010011110000100000110101010100100111" &
         "0011110110000011111011101000011001000000000101101011111110110111100011" &
         "0";
UNLOAD(0) <= "0100100011110110100000110111001101101011000101000110110011000010011100" &
             "1000110001110110110000011110010001111101100111011000100101001100010100" &
             "0010001110001000101010010001110011011000010001100011111110110101010100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1504800
wait for 0 ns;
PI <= "001111001010101010101000000011001000000";
wait for 100 ns; -- 1504900
XPCT <= "0100011010110010110100100000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1504940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1505000
wait for 0 ns; pulse_CK(PI);  -- 1505100

pattern := 70; -- 1505100
LOAD0 <= "1010101111111101000111011101000100101010001010000001100011001100111110" &
         "0101110000010101001010101001010110101100111000010010111100100000101000" &
         "1010101100001101101101001000000000011010100101001001101011101111010100" &
         "0";
UNLOAD(0) <= "1110111001010101000100001110100101001000001010100110101111000011111000" &
             "1010111010101011011010111011111001011011110000111000110001011000100111" &
             "0010111011001011110100010001010011000101010011110011111110111100001011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1526300
wait for 0 ns;
PI <= "000011110000111111000100111001101100010";
wait for 100 ns; -- 1526400
XPCT <= "1101110011101100011000101000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1526440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1526500
wait for 0 ns; pulse_CK(PI);  -- 1526600

pattern := 71; -- 1526600
LOAD0 <= "1101011010101101110010111011111011000100001000001110011000000000100011" &
         "1101010110100111000101100100001001101001010110111101011011010101001011" &
         "1101111101011000100100011000100010111101110001101110011001010100001100" &
         "0";
UNLOAD(0) <= "1100101011111101000000101110001100001010000010100110111011101001111110" &
             "1110111010101010100010110001000110101100110001010000111101100100001011" &
             "0011101010011101101000101000010000011011110001110000101101100110010110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1547800
wait for 0 ns;
PI <= "011101101100000110101110110101010100100";
wait for 100 ns; -- 1547900
XPCT <= "0001100000011010111101101010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1547940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1548000
wait for 0 ns; pulse_CK(PI);  -- 1548100

pattern := 72; -- 1548100
LOAD0 <= "1111000011101111010000111001111101000101011111101101111011000001010000" &
         "0110001101000110001000100011010101110011101010000101110110001111010111" &
         "0101100100101100001101111001110000110010110011101010001110001010100101" &
         "0";
UNLOAD(0) <= "1100011011001101100000010111100011000100000100100111010000100010000011" &
             "0010110110101011011101010100011001101001001110110001011011010101101000" &
             "1000111111011010000000001101110000111000110001101010101001011001000110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1569300
wait for 0 ns;
PI <= "000110000000011011111111011111001111110";
wait for 100 ns; -- 1569400
XPCT <= "0011010001110111111111110110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1569440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1569500
wait for 0 ns; pulse_CK(PI);  -- 1569600

pattern := 73; -- 1569600
LOAD0 <= "0010001011100011110101100000010111101100101001001111101100110110001111" &
         "1000001110010110001001111000100001011010101000011001010011110011000100" &
         "0010110110011010010110010100101000101101110011101011011001101100110001" &
         "0";
UNLOAD(0) <= "1100100011100011000010010101100101000101000110100101110011101111011100" &
             "1110001101001010110001110011000111110110001110001101110011000111110100" &
             "0000101100101110001001001000110100010001110011111010101100001111101110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1590800
wait for 0 ns;
PI <= "010101001111000110000100011100101011000";
wait for 100 ns; -- 1590900
XPCT <= "1100101100011000011111001110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1590940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1591000
wait for 0 ns; pulse_CK(PI);  -- 1591100

pattern := 74; -- 1591100
LOAD0 <= "0110001011111110111010010010111111101011001001011101011101101100010111" &
         "1001010111011101100111110101111001101000001101000001101001001100001000" &
         "0100100110101101011010101100100101001010001111001100000111011101000101" &
         "0";
UNLOAD(0) <= "0110001011100111100000110101011111001100000101100101111111100011001010" &
             "1011001110100010000001001000100010011010101001010100110111111111000110" &
             "1010111110011000010010111100110010011001010011111011101111101011011011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1612300
wait for 0 ns;
PI <= "010001011000111011111011001000100110010";
wait for 100 ns; -- 1612400
XPCT <= "0001000011100111110101010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1612440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1612500
wait for 0 ns; pulse_CK(PI);  -- 1612600

pattern := 75; -- 1612600
LOAD0 <= "1110010011101110100110000011000010110101111001101010100101111101111110" &
         "0011011011011111101001101010011000100100100000100111011001010011011110" &
         "0111001111000100000010011110011110100101100000100000110101001011000011" &
         "0";
UNLOAD(0) <= "0111001010101010101100010111110111101011010101010101100111101110011110" &
             "1000010101101011110011000111101010101100010100011100101101000100001001" &
             "1100101110111101111010101101100101011111000001101101101100011111000101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1633800
wait for 0 ns;
PI <= "000100001001000101110110100000010000010";
wait for 100 ns; -- 1633900
XPCT <= "1100100100011111001100011000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1633940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1634000
wait for 0 ns; pulse_CK(PI);  -- 1634100

pattern := 76; -- 1634100
LOAD0 <= "0101111101001101011000001101000101101101110001110111100001111100000101" &
         "0001100100110010100011101011011000011000110011111100010010000110100110" &
         "1111101010100100100100100001000101001100100110100110001010111100010000" &
         "1";
UNLOAD(0) <= "1001010010011010100000010111001000010101000111100110110101011000110110" &
             "1011111001100011001001101110001011101100101000110100001101010111111100" &
             "1010101111001110100010000001001111110000010000110001111110000011000001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1655300
wait for 0 ns;
PI <= "001011101011010111110001111001000100010";
wait for 100 ns; -- 1655400
XPCT <= "1001011101001111010111110110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1655440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1655500
wait for 0 ns; pulse_CK(PI);  -- 1655600

pattern := 77; -- 1655600
LOAD0 <= "0101011101101101100111001111011110000010111110010111000011000001101100" &
         "0000010110011010100111110100110000011011001101010010010110010001011111" &
         "0101100110000001101101110001111100011110111100100110100110111000110100" &
         "0";
UNLOAD(0) <= "0100111011011001000110010110001111001101001101110110110010001010011100" &
             "1111100100110110111011011001001010011100100010110000110111000110100101" &
             "1110001110101110100000110100010111011000010000110111101111111010010010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1676800
wait for 0 ns;
PI <= "001010010001101010011111010100001100000";
wait for 100 ns; -- 1676900
XPCT <= "0101010110100001111101010010001010001000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1676940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1677000
wait for 0 ns; pulse_CK(PI);  -- 1677100

pattern := 78; -- 1677100
LOAD0 <= "1010101000101001101110110111001110101101111000111011100111000001111101" &
         "1011010111000100011101010011100001100011010001000111000010010011011110" &
         "0110011010000010111000000001111010000011101000011100110010010100110011" &
         "0";
UNLOAD(0) <= "0111011001111001100010010110000110100010000110010010110010000011111000" &
             "1001110100110010000011111100100010011011010100011000110111010101111101" &
             "0100001110011011101000000100100110011011010010110111101101110100111110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1698300
wait for 0 ns;
PI <= "000100011100110110011111111000010000010";
wait for 100 ns; -- 1698400
XPCT <= "0100100011011001111100011000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1698440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1698500
wait for 0 ns; pulse_CK(PI);  -- 1698600

pattern := 79; -- 1698600
LOAD0 <= "1001001111101111110100010101011111000100111100010111001000101101011100" &
         "1000000011011110001001000011110101011111100001110011111001000000000110" &
         "0100000010100011010101101110100111000100111001010100001010001000101001" &
         "0";
UNLOAD(0) <= "1110101010011101100010110111000110101101000100110110110111000010111000" &
             "0000110101101100101101001011110001101011011001010000000110011111111100" &
             "1110111110001010111100000100111010000010010010000101111010010011011001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1719800
wait for 0 ns;
PI <= "000010101001101011001011110001001100010";
wait for 100 ns; -- 1719900
XPCT <= "0101010110100100110111110110011000110101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1719940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1720000
wait for 0 ns; pulse_CK(PI);  -- 1720100

pattern := 80; -- 1720100
LOAD0 <= "0000000111100010100100010001100001010101110001000101001101111010001001" &
         "1010101111000011010101001001110101100000000001100101001110000111001011" &
         "1100110110110011001111110101111111100111110110011100101110010000011011" &
         "1";
UNLOAD(0) <= "1001001010011111100110110111000111100100000110010010110010001001011100" &
             "1001100011101110001001101001100110011111111001111100111101000100100101" &
             "1100101110101011110000100101100111010001010011100101101111000111101011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1741300
wait for 0 ns;
PI <= "001100001101011100001101110111011000000";
wait for 100 ns; -- 1741400
XPCT <= "1100000101111000101111110110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1741440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1741500
wait for 0 ns; pulse_CK(PI);  -- 1741600

pattern := 81; -- 1741600
LOAD0 <= "1001100010111110011110010110011000000010101111100111101010000011010011" &
         "0101010001111011011110000111100000010001110001100111000011100110001111" &
         "0010011000100110111010001011001111101000001100110110111111101100010101" &
         "0";
UNLOAD(0) <= "0100000011010110100000110111100011010101001101100110010100011011011000" &
             "0011100111111011111101001011110100101000000001110100011010001111101000" &
             "0100010110111011100110000101111111100010010000000101111110011101010101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1762800
wait for 0 ns;
PI <= "000100101010111110010000111010001100010";
wait for 100 ns; -- 1762900
XPCT <= "0101101011111001010101001010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1762940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1763000
wait for 0 ns; pulse_CK(PI);  -- 1763100

pattern := 82; -- 1763100
LOAD0 <= "0000000010000101111111010001010001101011110110001100000001100011100010" &
         "1010000010101110111000110100011101010100001011001111011110110110011010" &
         "1100011001010111011111101010111111111110110100100100000011000001010111" &
         "0";
UNLOAD(0) <= "1001100000011010000100110111001010100010111001100110100010000011111001" &
             "1100110001111111111010001111100010011001110001100011100011100010101101" &
             "1110011110100110110110010111000110001100011000100110101100100101110011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1784300
wait for 0 ns;
PI <= "001000110001101101101100011000110000000";
wait for 100 ns; -- 1784400
XPCT <= "1100000110101110101101010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1784440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1784500
wait for 0 ns; pulse_CK(PI);  -- 1784600

pattern := 83; -- 1784600
LOAD0 <= "0100111101101001101011011001101010010101111111000100000010011110111101" &
         "1100110100001100000111000111010110010010000010011001011000100000001010" &
         "1011100010000111001001111001000001110110100000111000011111101101100100" &
         "1";
UNLOAD(0) <= "0011000010110101100001110111000011001011001110100011010000000000110110" &
             "0011100011101110010000101110011101010100010011010000011010110110011001" &
             "0100111100011101111110000101101111101010010000100101111000000111110001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1805800
wait for 0 ns;
PI <= "000101111010101110000011100000111000000";
wait for 100 ns; -- 1805900
XPCT <= "0000001010111000010001000010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1805940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1806000
wait for 0 ns; pulse_CK(PI);  -- 1806100

pattern := 84; -- 1806100
LOAD0 <= "1110101101110110110010110111100010011110111001011101000001101101110001" &
         "1011111111010101010100001110011110111000000100011101111100110100101110" &
         "1110010000110110111010001101110011001100110110101111001010001110000111" &
         "0";
UNLOAD(0) <= "0101111000011101100101010111101010010101100101000010010010011011111010" &
             "0110111110101101001111011101000110011010011010010001001100101100001001" &
             "1010100110001101100000010100000011110011111010110001101111101111101100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1827300
wait for 0 ns;
PI <= "000001000000110111011011000001001100010";
wait for 100 ns; -- 1827400
XPCT <= "1001100011001101110101111010000111100101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1827440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1827500
wait for 0 ns; pulse_CK(PI);  -- 1827600

pattern := 85; -- 1827600
LOAD0 <= "1101001110110000111111111011110000010000110010000100111110011110111110" &
         "1110000111001000000001010001111101101100111111011001010011010100001011" &
         "1111101011001000011010101010100101011000101010111001111101100100001000" &
         "0";
UNLOAD(0) <= "1100101001010010100100010111100000011110000101010010111011001011111110" &
             "1010110101101111111010001000001111111100010100010100101001110100101110" &
             "0011111110111110110100000000110011001001010000110111101101001011000001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1848800
wait for 0 ns;
PI <= "001010010010101001001100100001000100000";
wait for 100 ns; -- 1848900
XPCT <= "1101011010100100101101110010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1848940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1849000
wait for 0 ns; pulse_CK(PI);  -- 1849100

pattern := 86; -- 1849100
LOAD0 <= "0100101011010100101011000111100000011101110110010100110000101111111111" &
         "1011111100001111000001100010101000101000001110011101110100110001111010" &
         "1000111011101011011111010110000011110011111010100110011001111001100101" &
         "0";
UNLOAD(0) <= "1011001001110100100000010111100010110000101110100010111110101000011110" &
             "1000100111111110010001111001111101101100111110011001100111011100101011" &
             "1110001111001010110010011101100110011001111000100001101111101101000100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1870300
wait for 0 ns;
PI <= "001010011101010111011001100111000100000";
wait for 100 ns; -- 1870400
XPCT <= "1001110101001101110101101010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1870440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1870500
wait for 0 ns; pulse_CK(PI);  -- 1870600

pattern := 87; -- 1870600
LOAD0 <= "1101101011100100010001101011100100111101110001001001101010010010111000" &
         "1010101110000001100000101011100100000011100000000001110110100011000011" &
         "1111111100111000001100011001101001111010111011010111000100111100110100" &
         "0";
UNLOAD(0) <= "0001101000110000100100010111100010111101000100110010110010101010111110" &
             "1101111100100110100001001100101011101100001110010100110101110101111000" &
             "0000111110111011111010001100000011010010010010100111111101111011101101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1891800
wait for 0 ns;
PI <= "000111010111101001110111001101011000010";
wait for 100 ns; -- 1891900
XPCT <= "1000111110110111001110111100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1891940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1892000
wait for 0 ns; pulse_CK(PI);  -- 1892100

pattern := 88; -- 1892100
LOAD0 <= "1000100111011110111010101011000101110111110100011010100100011000100100" &
         "1110001000101000010100101100000001101111100010001111010100100110011111" &
         "1011101110011011101110100101001101101001110001011110011110110011011111" &
         "1";
UNLOAD(0) <= "1100101010010000000001010111101110111101001111000010111010110011111100" &
             "0001101100110000001001111011100110001111111000011000110010100111100011" &
             "0011011110111010101010011100111011111011010011000111101110111101011100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1913300
wait for 0 ns;
PI <= "000011100011101100101010111100111000010";
wait for 100 ns; -- 1913400
XPCT <= "1000011110101010100000010000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1913440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1913500
wait for 0 ns; pulse_CK(PI);  -- 1913600

pattern := 89; -- 1913600
LOAD0 <= "1010101000001000001001011111000100011000110111010111001010000111100010" &
         "0000110001010010000100011111111100011010011011000000111011100001101111" &
         "1101011110101001011111111110011111100111100011101000001000011011101101" &
         "0";
UNLOAD(0) <= "1101100000011110100100110111000111010111101110010010110100111001110010" &
             "0111101011110000011100111110010000101011111011000101010100100110011100" &
             "0011001111010001101110011000001111101000110001010111111110110101110101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1934800
wait for 0 ns;
PI <= "000100100001001000000000011111010000000";
wait for 100 ns; -- 1934900
XPCT <= "1000000100110000000111100110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1934940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1935000
wait for 0 ns; pulse_CK(PI);  -- 1935100

pattern := 90; -- 1935100
LOAD0 <= "1000010101101100000110011011110101011110110111001101100111000001100110" &
         "1111111110001111110111001001110100101111111011000110110010000101100111" &
         "1110011010101101101000110101101111100011101100000110111000100110001001" &
         "0";
UNLOAD(0) <= "1010101001111100000101110110001110011000001111010010010001100010111010" &
             "1111110011111000000110111011101111011010001011011100111011101101101100" &
             "1100011111101011111010001001011111110011010011110001111010011100101101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1956300
wait for 0 ns;
PI <= "000010001000111101001100000110110000000";
wait for 100 ns; -- 1956400
XPCT <= "1100010011101100101001010010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1956440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1956500
wait for 0 ns; pulse_CK(PI);  -- 1956600

pattern := 91; -- 1956600
LOAD0 <= "1100011101110110010100100001111001001001110110001100010001011010101000" &
         "0110001110111000100001010110110001100110111110011010011110000100111110" &
         "1000100011001110001100011101011101110011100001011000011011001010000000" &
         "0";
UNLOAD(0) <= "1101010011111100000000110110100111111110101111000010110110100000110110" &
             "0000111110101110110110111111110101101111110011000100110110000101000100" &
             "1110111110100101101110101000101111100010111000000111111010100100100001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1977800
wait for 0 ns;
PI <= "001101110110100101100001011100111000010";
wait for 100 ns; -- 1977900
XPCT <= "0100101010011110000011001110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1977940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1978000
wait for 0 ns; pulse_CK(PI);  -- 1978100

pattern := 92; -- 1978100
LOAD0 <= "1101101101101011110010001101100100101110110100000110001110101111100100" &
         "1100011000000100110000110101101101111100010001001000111011100111101110" &
         "1011100110101111101111101011010111100110110010001000110110001010100110" &
         "1";
UNLOAD(0) <= "1111011001110110000100010110101011001001100110100010010000111001110100" &
             "1010111110110100010001101100100010101110111110010100011010000100011100" &
             "0001000101000100100010011000001111110011110001010001111001000010100100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 1999300
wait for 0 ns;
PI <= "001111100010110000101111001111011000000";
wait for 100 ns; -- 1999400
XPCT <= "1000011011010010101101100010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 1999440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1999500
wait for 0 ns; pulse_CK(PI);  -- 1999600

pattern := 93; -- 1999600
LOAD0 <= "1000100100100011111000010011101001111100110110011111010010100000110111" &
         "1010111011001101110011011010010001110101110111001000010010100101110111" &
         "1010011101010000011000000110000001010101100111110100000111101110101100" &
         "0";
UNLOAD(0) <= "1010101010011111100000010110100110001110101110000010010110101001110000" &
             "0110111010100000111000111111101111111000011000001000111111101111101101" &
             "1111100110101111101110111001010111100011110010010000101100001010101100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2020800
wait for 0 ns;
PI <= "000100100001110010101011001111101000010";
wait for 100 ns; -- 2020900
XPCT <= "0000100111010010110111101110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2020940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2021000
wait for 0 ns; pulse_CK(PI);  -- 2021100

pattern := 94; -- 2021100
LOAD0 <= "1010000001111101010000100111111001111001110000010111101000000101101011" &
         "0111001100000010110001100101011101100101100010011111111010000101001010" &
         "1101100001000111011010100111000111101010101110100101101101001011011010" &
         "0";
UNLOAD(0) <= "1011100000010111100100110110100011011100001100110010110010000001011010" &
             "1011110011101011111010001010000010111001110111011100100111101101010100" &
             "1110111111011000110110000001000011000001010011100101101110101000101000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2042300
wait for 0 ns;
PI <= "001100001000000011110010010100001100010";
wait for 100 ns; -- 2042400
XPCT <= "0001000000010111010111010110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2042440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2042500
wait for 0 ns; pulse_CK(PI);  -- 2042600

pattern := 95; -- 2042600
LOAD0 <= "1000001111000100000100110110100010111100001000100000011100010001000001" &
         "0011110101111110010011110000101111100000101001010001101100000011011111" &
         "0010011101100110000110001111101000111001111011110000100011010111101000" &
         "1";
UNLOAD(0) <= "1000000001011001000100110111101001111001100100110010111011000001011111" &
             "1100101100110110011001001101001110101101100011011101101011000101101011" &
             "1000001111000111110110000000010111001010111000100101101111000011010100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2063800
wait for 0 ns;
PI <= "000101000011010110100101000111101000010";
wait for 100 ns; -- 2063900
XPCT <= "1100101101011010011110101100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2063940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2064000
wait for 0 ns; pulse_CK(PI);  -- 2064100

pattern := 96; -- 2064100
LOAD0 <= "0101010110010011000010100101100101100100110101000110001111110000110000" &
         "0010001010101000000001110000110101111111101010000111011110110101101100" &
         "1011001101010010111100100011111111011111111101000010011111110110001011" &
         "0";
UNLOAD(0) <= "1011001001110100000000100111101010111100001100000110110110000011011000" &
             "1101110111101010100011000000111100101000101001010100111001000111011100" &
             "0111111111101100101110010010100001001001010111110001101101011011001010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2085300
wait for 0 ns;
PI <= "000010001010011011110101001011110100000";
wait for 100 ns; -- 2085400
XPCT <= "1001011001100111011101100010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2085440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2085500
wait for 0 ns; pulse_CK(PI);  -- 2085600

pattern := 97; -- 2085600
LOAD0 <= "0110011110010101100101101111111101101000110101011100010011111001111010" &
         "0010001101001100101000100111010000000011010000011110010110010000011110" &
         "1111110101000010011110101110010011111100111100101000011011101110011100" &
         "0";
UNLOAD(0) <= "0011010000110111000010010111101111100100001111000010010110010000111100" &
             "1000100000110010110001101010110101111111100010011000011010111101001100" &
             "0010001111011000111010010000101111011010010001000011111100110111100011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2106800
wait for 0 ns;
PI <= "000011101000111011100010101001111000010";
wait for 100 ns; -- 2106900
XPCT <= "0100010011100110010111110110011000001000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2106940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2107000
wait for 0 ns; pulse_CK(PI);  -- 2107100

pattern := 98; -- 2107100
LOAD0 <= "0111100011010111101110110001101000111011110110000010000110101100111110" &
         "0110101111001001100010100001010101110111010110000100111110000110111111" &
         "1110001010010010001101000101110101111100110101001110011011111000010000" &
         "0";
UNLOAD(0) <= "0001011001010101100101010110101111101000001111010010010011011011110110" &
             "1100101111100000101010111001000011001111010000011100010010010100011101" &
             "0010110111011000111010000001000011111000010000100001101001100110110100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2128300
wait for 0 ns;
PI <= "001100001100111101111000001101101100000";
wait for 100 ns; -- 2128400
XPCT <= "0101100011111111100000111000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2128440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2128500
wait for 0 ns; pulse_CK(PI);  -- 2128600

pattern := 99; -- 2128600
LOAD0 <= "0110101011100000010011010111001001100111110011000001011010101001100000" &
         "0110010001000110001100100001010000110000010001000010111001000011000111" &
         "1010111100000010111110111111111011111110110101000010100101110000100101" &
         "0";
UNLOAD(0) <= "0101100011010011100100010110100000011011100110100010110111001001111111" &
             "1010101101111111111010101011000110111111010110000100111111000110011101" &
             "0010001110011000101000100100100110011000110001100111111100111100110000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2149800
wait for 0 ns;
PI <= "000101000000110100000011010100110000000";
wait for 100 ns; -- 2149900
XPCT <= "0000000011011000000000000000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2149940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2150000
wait for 0 ns; pulse_CK(PI);  -- 2150100

pattern := 100; -- 2150100
LOAD0 <= "1110111011001101001110011011010101011111110111000000011100100111101010" &
         "0110000111000101101111110101111100000000000000001011111011110011011010" &
         "1000000111010110111111000010110111111110110110001100010111011110101111" &
         "0";
UNLOAD(0) <= "0000101011010100000101010110001001000111101111100010010001001010111001" &
             "1110110011101000101100101111010001111000010000000100111001001111000100" &
             "1111111110001000110010100000111011111011110011010011101110110010001101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2171300
wait for 0 ns;
PI <= "001000000100110110001010001001111000010";
wait for 100 ns; -- 2171400
XPCT <= "1100100011001000110000111000001000001101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2171440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2171500
wait for 0 ns; pulse_CK(PI);  -- 2171600

pattern := 101; -- 2171600
LOAD0 <= "0010010101100010111010001011001101010001110111001100011000101110111000" &
         "1011000011011111010110000000001001000110000010010010011101100111101011" &
         "1001011010101111001001100001100011001001110000010111100110000010101011" &
         "0";
UNLOAD(0) <= "1010111011010101000100010111000111010111101110000010010001001011110011" &
             "1010100111101000101101111011001111101000010100000101110011110111011000" &
             "1000100111011100111010100000110111110001110010010101111110010011101101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2192800
wait for 0 ns;
PI <= "000111100000110110010000010011111000000";
wait for 100 ns; -- 2192900
XPCT <= "0000010011011001010101110010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2192940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2193000
wait for 0 ns; pulse_CK(PI);  -- 2193100

pattern := 102; -- 2193100
LOAD0 <= "0001001010101101000010100011000100000010110001001111111001010000100100" &
         "0100100100010001010110110110001001111011110111010100111110100110100011" &
         "1000010110111100111001111010011011010010101000001101111111011110111100" &
         "0";
UNLOAD(0) <= "0101010001010110100100110110001111010001001111000010011001101001111010" &
             "0010100001100111111110111000011001001010011011010000011001101111001010" &
             "0001111111101101101110001000100011001001010010000111101111000000101001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2214300
wait for 0 ns;
PI <= "000110110000011100111111010100101100010";
wait for 100 ns; -- 2214400
XPCT <= "1001010001111011101001010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2214440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2214500
wait for 0 ns; pulse_CK(PI);  -- 2214600

pattern := 103; -- 2214600
LOAD0 <= "0000110110000010001011110101000000111001110111001001110110111000101101" &
         "0000100110110011100111111010001100111001001111010011110000110110000011" &
         "1001101011000110011100001110100111011000101001000001011000111111011011" &
         "0";
UNLOAD(0) <= "0010001010011001000000110110000110100010101111000010111010100011111000" &
             "1100100100110011111010101100001011111011101111010000111111100110000011" &
             "0100011111111100111110001001010011000010111010110100101101011100011100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2235800
wait for 0 ns;
PI <= "000100101100100110101000100011110100010";
wait for 100 ns; -- 2235900
XPCT <= "1001100010011010110100101000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2235940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2236000
wait for 0 ns; pulse_CK(PI);  -- 2236100

pattern := 104; -- 2236100
LOAD0 <= "0011110011110111100010011101011100111100110011011101011000011100100100" &
         "0110011001011101110010101100010001110001010011000010110100000111010011" &
         "1001100010100010011000110100111111010011111001010101110111100110001001" &
         "1";
UNLOAD(0) <= "0010110010110110000101110111000010111001001101100010111110011010010010" &
             "1000101110111110010110001100001111111001011111010100110100111110000011" &
             "1100001111001100111010000001110111011001010001010001111001110001110101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2257300
wait for 0 ns;
PI <= "000001100010110010111000111111001000010";
wait for 100 ns; -- 2257400
XPCT <= "0000001011000011110101100010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2257440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2257500
wait for 0 ns; pulse_CK(PI);  -- 2257600

pattern := 105; -- 2257600
LOAD0 <= "0101111101110011011110101111110110011101111010010000011111111000101011" &
         "0100101100100010000110010001111010000110010010011110110110010111011010" &
         "1101001010000011011001000111000001100001111010110010100110101111100000" &
         "1";
UNLOAD(0) <= "0101110010010011100100110110000110111100101111010010111011001011111000" &
             "1100111001101111111010111110010000111001011011001100110101000111110010" &
             "0101101110110010111100010001100111000011111001100101111100100000000001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2278800
wait for 0 ns;
PI <= "000110000101001110000111101101011000010";
wait for 100 ns; -- 2278900
XPCT <= "1100110100111000011100111000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2278940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2279000
wait for 0 ns; pulse_CK(PI);  -- 2279100

pattern := 106; -- 2279100
LOAD0 <= "1101111001101010011000110101001101101001110011010000111111100000101110" &
         "1100000001101110100011011101100101010100111110000010011010010010011111" &
         "1101111010110101001011110011110011011000110100111101010001011100100001" &
         "0";
UNLOAD(0) <= "1010111011010111000010010110101110110101100100010010010010011001110011" &
             "1101101110110110011101011001001011101010001110010100110010011111111000" &
             "0000001110000011111000000000010111110001111010100010101111000110001000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2300300
wait for 0 ns;
PI <= "000100000100100011111000110010111000010";
wait for 100 ns; -- 2300400
XPCT <= "0000000010010111110010010100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2300440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2300500
wait for 0 ns; pulse_CK(PI);  -- 2300600

pattern := 107; -- 2300600
LOAD0 <= "0111100111100100111000110011001101110001110101000001011111111110101011" &
         "0011110110001011011101100101011100111111001100011011110001110100101110" &
         "1100101100010110011110000101111111110111110001110100001101001100001010" &
         "0";
UNLOAD(0) <= "1011111001110110000100010110000111000001101110010010111010001001111110" &
             "0110100101101110000001101011000111111100010110001100010110011110011110" &
             "1000101110110101101010000000100111010001110010100100111000010010001000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2321800
wait for 0 ns;
PI <= "001011110111111111101100101101110100010";
wait for 100 ns; -- 2321900
XPCT <= "0001111111101110111110111100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2321940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2322000
wait for 0 ns; pulse_CK(PI);  -- 2322100

pattern := 108; -- 2322100
LOAD0 <= "1011000001111101000101110101101101101000110010011001100011111110101010" &
         "1110100001000100101111110101011001001100110001000100110010000011110110" &
         "1001000101110011001100001100011101101101111101000010111011111100110101" &
         "0";
UNLOAD(0) <= "0101100011110100100000010111000111010001001101000010010111011000110100" &
             "1011111110111010110111001001001111111111011100010100110001110100001100" &
             "1001001111011100111110110100101111100011010001110101101111000111100000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2343300
wait for 0 ns;
PI <= "000011101100001100000110100011100100000";
wait for 100 ns; -- 2343400
XPCT <= "0101110000101000001010101100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2343440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2343500
wait for 0 ns; pulse_CK(PI);  -- 2343600

pattern := 109; -- 2343600
LOAD0 <= "0001010110111001010101000001001100100111110010010100001101111110100010" &
         "0110100000101011101010100000010001111011000010001001010000100111111011" &
         "1010010010110010001110001110101001010100100101100010110011010100011110" &
         "0";
UNLOAD(0) <= "1110000010011101000000110110101111101000101110010010110011001000111011" &
             "1100110011101010001011101111001010001000100001000100110011000111010100" &
             "1100101111111001101010000101010111011000111011110011111110111110011101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2364800
wait for 0 ns;
PI <= "000001000001010011010000101010111100010";
wait for 100 ns; -- 2364900
XPCT <= "0101100101000101010011001110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2364940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2365000
wait for 0 ns; pulse_CK(PI);  -- 2365100

pattern := 110; -- 2365100
LOAD0 <= "1001111001101000110000010111011000001101110011010001111010111011100100" &
         "0110111001010110001001110011111001111011010101010101011011010101010110" &
         "1100100101110010101100000111011111110101101101100100101101111110100101" &
         "0";
UNLOAD(0) <= "0001010010011101000101110111001110000111101110010010010110011011111101" &
             "1111100000110100111010101010010000111111000011001101010000101111011000" &
             "1011010111111000101010000000101011110001110001110011101000011011010100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2386300
wait for 0 ns;
PI <= "001000110010110101101011010111111100000";
wait for 100 ns; -- 2386400
XPCT <= "0001101011001110100010101100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2386440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2386500
wait for 0 ns; pulse_CK(PI);  -- 2386600

pattern := 111; -- 2386600
LOAD0 <= "1100100010000001000110111011110100010011110101010001101001101010100001" &
         "0110001000101100001001100011000101010100101010011011111001110110001110" &
         "1101010000010011101100001000110001011100100101001100101001001110000111" &
         "0";
UNLOAD(0) <= "1010111011011100100110110111000010101101101111110010110000011011111101" &
             "1100111011101000111001101001101010111111010101010101011111011101010100" &
             "1100100111111000100000110000011110110000111011110101101111111011001101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2407800
wait for 0 ns;
PI <= "000001011000001111101011110110100100010";
wait for 100 ns; -- 2407900
XPCT <= "1101100000101110110000011000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2407940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2408000
wait for 0 ns; pulse_CK(PI);  -- 2408100

pattern := 112; -- 2408100
LOAD0 <= "1001000011110100111000010001111001011010110011001110000001100111100111" &
         "0010110010000000111100110100011100001110011011011001011000110110100110" &
         "1010101110000101011100000010110011111100111101101010000111001110110000" &
         "1";
UNLOAD(0) <= "1101100010110101000100010111100110010011101101010010110010001000111110" &
             "1110110010101110010001011001000111011100100010010001111001111110001101" &
             "1000111110011001101010000000100011011001111001100101111101000111100101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2429300
wait for 0 ns;
PI <= "001000010111111011011101110001111000000";
wait for 100 ns; -- 2429400
XPCT <= "0000101111100101111111101110000101101101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2429440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2429500
wait for 0 ns; pulse_CK(PI);  -- 2429600

pattern := 113; -- 2429600
LOAD0 <= "0000100001010111010110011001001001010001110100010101000001100110110000" &
         "1110011011000111111110100010110101111011101110011010111011000111001010" &
         "1111101111110011011100101011011111010101100000011000010011110100010101" &
         "1";
UNLOAD(0) <= "1010000000110000100000110111100011111010001101100010010000000001111100" &
             "1001111000111010110101001100001110001110010011011000011100110110000101" &
             "1110001110001101110110010001110010101001010011110011101111001111011100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2450800
wait for 0 ns;
PI <= "000110001010000111000001101001111000010";
wait for 100 ns; -- 2450900
XPCT <= "0100011000011100010001110010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2450940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2451000
wait for 0 ns; pulse_CK(PI);  -- 2451100

pattern := 114; -- 2451100
LOAD0 <= "0000001010101101101000110111001001101101110101011001000000000111110000" &
         "0010001000101110001110100111011000001110111001010100010010010000110011" &
         "1010010100000111101100001111110111110111100000001000011101000110110101" &
         "0";
UNLOAD(0) <= "0000100011110111000100110110001011010001100110110010010000000011110101" &
             "0010111011101010010110111000110101111111101111010000111011000111001000" &
             "1010101111111001111110110100011111000001110000010001111011110010110101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2472300
wait for 0 ns;
PI <= "001000011000000101111101101001101000010";
wait for 100 ns; -- 2472400
XPCT <= "0000100000001111101110101100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2472440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2472500
wait for 0 ns; pulse_CK(PI);  -- 2472600

pattern := 115; -- 2472600
LOAD0 <= "1000101010000111010111101001010100100100110010001110111100100101111001" &
         "0100011111101011101100100010010000110111011000011100111100110110111110" &
         "1111100011000010101111000010011101110101111000000100111111111010011010" &
         "0";
UNLOAD(0) <= "0001001010111001100000110110000011001101001111110010110010000001111100" &
             "1110111000101010000000101001011001001110101001010100111011010100010000" &
             "1110111110011101100010000000100111010010010010100001111101001000111001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2493800
wait for 0 ns;
PI <= "001001011101111011011101101111111000010";
wait for 100 ns; -- 2493900
XPCT <= "1100100111100101111001101010000101010001";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2493940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2494000
wait for 0 ns; pulse_CK(PI);  -- 2494100

pattern := 116; -- 2494100
LOAD0 <= "0011000000010011111001011111011000011110110011000101110011100010110000" &
         "0010101010001110101100000101011001011101100101001000110101000011010010" &
         "1100101111010011101110100100111001010100111000010110000001011010011110" &
         "0";
UNLOAD(0) <= "1001101010110011000001110110000110100100001100000010110100000001110110" &
             "1001111101110110110100011000000010111111011001001000111000110110011100" &
             "0010000111011000101010000000001111110000010000010101111101111110010000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2515300
wait for 0 ns;
PI <= "000100010011010000111101100111111000010";
wait for 100 ns; -- 2515400
XPCT <= "0000001101010011101111110110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2515440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2515500
wait for 0 ns; pulse_CK(PI);  -- 2515600

pattern := 117; -- 2515600
LOAD0 <= "0010111110101100011001001111010001101001110010000110111001110001111110" &
         "1010101110101110001110101110111101001001011100000101010100000101110011" &
         "1101000001010011111101101100110011111100101100101100010111101000000000" &
         "0";
UNLOAD(0) <= "0101000011010111100001110110000000111110001111100010110001000001011000" &
             "1001100000101000101101111111001010011001101101011100110001001111010001" &
             "0100101111011001101010010001101010010001010000010111111000011010010100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2536800
wait for 0 ns;
PI <= "001011010101000111101010001111100000000";
wait for 100 ns; -- 2536900
XPCT <= "1000010100001110110111110110000111000000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2536940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2537000
wait for 0 ns; pulse_CK(PI);  -- 2537100

pattern := 118; -- 2537100
LOAD0 <= "0000101000111001110110010001011000011010110010001100010001111011101101" &
         "0010011110101011111001100011010000111111111010010000010010000011110111" &
         "1110110010010110101110101101111001011000111100110010111011000000100100" &
         "0";
UNLOAD(0) <= "0101111011111100000110110111000001101001000110100010110011000010111110" &
             "1001101110100110010011111110101110001101000101010100110101000101010001" &
             "0001101111011001110000100101100011011000010000110101101110101001000000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2558300
wait for 0 ns;
PI <= "001000110000101110110011001111100100000";
wait for 100 ns; -- 2558400
XPCT <= "0101000010101011010101110010010110100100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2558440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2558500
wait for 0 ns; pulse_CK(PI);  -- 2558600

pattern := 119; -- 2558600
LOAD0 <= "1011001001011111101001010011101000000010110001010011000010100011111000" &
         "0010010001100111101101110110011101010001011001011000011010010011011111" &
         "1000011011110011111110101100010001010101101100101010001000111000001111" &
         "0";
UNLOAD(0) <= "0101101011111101100100110110001010111010000100100010110010001000111000" &
             "1000110100111111000000001101010001111011110011010100110111001111010101" &
             "1010011110011100100110000101100011001001010010100011111111001100001100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2579800
wait for 0 ns;
PI <= "001010111010100010100011010001101100010";
wait for 100 ns; -- 2579900
XPCT <= "0001011010000010010110100100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2579940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2580000
wait for 0 ns; pulse_CK(PI);  -- 2580100

pattern := 120; -- 2580100
LOAD0 <= "1001011110000110011100011000001110111101101100110100011001001011000011" &
         "0100110011010110001001110010011100000101010000101101001110110100010010" &
         "0110100100001101110100111110000011100011000010111011000010110000111011" &
         "1";
UNLOAD(0) <= "1110001011111111100100110110101000100010001111110010110011000011011000" &
             "1100111011101111000000101100001110011001010001011100111011010111011100" &
             "1100111111111001111000010101010010010001010000100011111111111000000001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2601300
wait for 0 ns;
PI <= "000100000000110001011000100000011001100";
wait for 100 ns; -- 2601400
XPCT <= "0100000011010101100111010110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2601440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2601500
wait for 0 ns; pulse_CK(PI);  -- 2601600

pattern := 121; -- 2601600
LOAD0 <= "1011010100101100011110101000101100011000000101100110000010101011110011" &
         "1010011000000110000111111011001000111111010011000100100011111010101111" &
         "1110011000100001000010111000111000101001011100110011101111000100101011" &
         "0";
UNLOAD(0) <= "1010111110000010011100110001000110010101110100110110001010101101001101" &
             "1010111101001000111000011010011101100100011101101101000010110100110010" &
             "0010100101001111110010001000011111010101000010101011010110011011111010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2622800
wait for 0 ns;
PI <= "010000110010100101111010100001111100110";
wait for 100 ns; -- 2622900
XPCT <= "0101001010001111100101100010011111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2622940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2623000
wait for 0 ns; pulse_CK(PI);  -- 2623100

pattern := 122; -- 2623100
LOAD0 <= "1000110111011110100101101100010010001000110000001000000001001011000100" &
         "1110100111000110001101110101101101011001110010010011101100111111000101" &
         "1111101011011011001100111011010100100010101001011110000111110100111010" &
         "0";
UNLOAD(0) <= "1110000101001000011100110000100100111000011101100100001011001001110100" &
             "0100010000000111001111010011011000111111010011010000100011110110001110" &
             "1110111101111001001010010101111000111100010010110011100100011000101011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2644300
wait for 0 ns;
PI <= "001011111100101100110000110100101001110";
wait for 100 ns; -- 2644400
XPCT <= "1100010010101011000010010100011111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2644440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2644500
wait for 0 ns; pulse_CK(PI);  -- 2644600

pattern := 123; -- 2644600
LOAD0 <= "0000010100111000100001100111110110000110000100100101100110100101010001" &
         "1001100110001111100110010100010000011100100100001001101110001011001010" &
         "0001010100101100111010010111111100100110110110010111011000011100110000" &
         "1";
UNLOAD(0) <= "1010110110011010100110110001001010101000100110101100110010101111001010" &
             "1000101101000110011000111101110101001001111011010001111101110111000101" &
             "0010101111010001101010101100010111010011101011101111111101100101011110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2665800
wait for 0 ns;
PI <= "000011011011000101100101110100111101100";
wait for 100 ns; -- 2665900
XPCT <= "1001111100001110001111011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2665940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2666000
wait for 0 ns; pulse_CK(PI);  -- 2666100

pattern := 124; -- 2666100
LOAD0 <= "1011111001100101100101110010000010100000110000101100011001101001100101" &
         "0110100111001101001111011111001110110010111000000011001100000011111000" &
         "1101000000101101100011100110111101110100101110011101000101111100001010" &
         "1";
UNLOAD(0) <= "1011110100010100100001110011111100000110001100100111111010101101010100" &
             "0011100110000011001100000010000011111100000101010100100010001111001011" &
             "0000100100111100010010111100101100110001010010000111111000111011111001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2687300
wait for 0 ns;
PI <= "000011101000001011100101100100011000110";
wait for 100 ns; -- 2687400
XPCT <= "1100010000100110011111010110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2687440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2687500
wait for 0 ns; pulse_CK(PI);  -- 2687600

pattern := 125; -- 2687600
LOAD0 <= "0011001100001011001110101011101011010000000100000000010110100000010000" &
         "1011000010110011101000001101111101000011010010001001010011000110011101" &
         "1001010011111111110100011110000101110010011110101001100100011110100000" &
         "0";
UNLOAD(0) <= "0011011000101101100001110011001000100000100100001110011101100111001101" &
             "1000100111001111000101001011001111010110000001001101000100000111111011" &
             "0000110100111111100011001101101110110011101000001101000100010111000011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2708800
wait for 0 ns;
PI <= "010011001110001100000101100110010010100";
wait for 100 ns; -- 2708900
XPCT <= "0100111000101000001100001000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2708940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2709000
wait for 0 ns; pulse_CK(PI);  -- 2709100

pattern := 126; -- 2709100
LOAD0 <= "0011101000011011100111111110001010110011000001111100011100110000011100" &
         "0000110101010011100010001111000100111100110101100111111101001010011101" &
         "1000001001001000101100001101000111111110101101000000110011110100001111" &
         "0";
UNLOAD(0) <= "0000001101001111001010110011101001110000000110100010001111100110110000" &
             "0000000010110110011000110111101110000011000011010100010011001110111111" &
             "1000010110111111111000011001010100110111010010111001110100011101101000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2730300
wait for 0 ns;
PI <= "000001011101110101111100011100000001000";
wait for 100 ns; -- 2730400
XPCT <= "0100100111001111101101001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2730440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2730500
wait for 0 ns; pulse_CK(PI);  -- 2730600

pattern := 127; -- 2730600
LOAD0 <= "0010011010111110100111011000101110011111111011000101110111100001001000" &
         "1000100110011010010010100110001000000000101000110001101011110110100101" &
         "0100111111100101110100110110001001000110111000100010000111100011111100" &
         "1";
UNLOAD(0) <= "0100001000011111100000110111000000110011011111111110110011100100011100" &
             "1101110101011111101000110011010101111100010101110100110101001110111101" &
             "0100001101001010101000001100010100011000000001100001110110010001000010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2751800
wait for 0 ns;
PI <= "010010011110100101111111101011001110100";
wait for 100 ns; -- 2751900
XPCT <= "0101011010001111101101110010011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2751940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2752000
wait for 0 ns; pulse_CK(PI);  -- 2752100

pattern := 128; -- 2752100
LOAD0 <= "0010101001011110010110110011011100110001011101001000111110100110001100" &
         "0111110110100111101010110111011101101111110110110000000101011001010101" &
         "1010000111010000110011001111101001001011111100110110001011111010000111" &
         "0";
UNLOAD(0) <= "0001011011111010000010110001100110111110000111000111110111000111001110" &
             "1000101000011010010000111000011001000101011001110100100011110110100101" &
             "1000011111111111110110010000000111001011010010110011000101101001011101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2773300
wait for 0 ns;
PI <= "011010110010111110111101000010111101110";
wait for 100 ns; -- 2773400
XPCT <= "0101111011101011111000001000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2773440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2773500
wait for 0 ns; pulse_CK(PI);  -- 2773600

pattern := 129; -- 2773600
LOAD0 <= "0010101011000000011000101011111001011100011100101101110110010101000111" &
         "1000001101011101100001011100100100011110011001000000001110111001110010" &
         "1111111000001100111101110110100011111101110010100010011000011100010010" &
         "0";
UNLOAD(0) <= "0010101101001010000000110110010100110001000111100110110111000101000001" &
             "1000011100001011101010100101001110100011110111110100000101010101010100" &
             "0010100111011000010000010001111001011011101000111111111001111100100101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2794800
wait for 0 ns;
PI <= "000101011001001110100001111111000111000";
wait for 100 ns; -- 2794900
XPCT <= "0011000100111010010111110110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2794940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2795000
wait for 0 ns; pulse_CK(PI);  -- 2795100

pattern := 130; -- 2795100
LOAD0 <= "1100010111011001110110000000010000011000101001101101000000100011101001" &
         "0010010111111110000110100110001110010000110111010101001001100100111011" &
         "0101110011111110100010010100110001101111110011010000010111001001001010" &
         "1";
UNLOAD(0) <= "0011101111110100001100110110111001011100001100100111110111100100101010" &
             "1111001111100110000011010010100111011010001001010100111111111101110000" &
             "0110111100001110011011101101100001011001010000110011111110011110110100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2816300
wait for 0 ns;
PI <= "000000010101110111011100110011111011010";
wait for 100 ns; -- 2816400
XPCT <= "1110100111001101111101101010000111110001";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2816440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2816500
wait for 0 ns; pulse_CK(PI);  -- 2816600

pattern := 131; -- 2816600
LOAD0 <= "0100111110100110010101100001111001001100000101101101011110111000001100" &
         "0001111101010110110011101101100001010100000110001010111100101111100010" &
         "1100010001001001101100001111010001100101110111010100000001011001010110" &
         "1";
UNLOAD(0) <= "0101110110010101100000010101000010011001011101000111010100100111000110" &
             "1011011101000111111101001000001111110101011010010100000001101100011000" &
             "1100110111111100101000101101100111111000010001010001111101101001000101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2837800
wait for 0 ns;
PI <= "000010010110101100111111010100100001000";
wait for 100 ns; -- 2837900
XPCT <= "0100111010101011101111001110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2837940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2838000
wait for 0 ns; pulse_CK(PI);  -- 2838100

pattern := 132; -- 2838100
LOAD0 <= "1001111110001010011010111010010110101111010100111100111001100100100101" &
         "1000011000011111100010010101111011011111000000110011000111100100101110" &
         "1000111110011011110001011100001000101111111100001010000111011111100011" &
         "1";
UNLOAD(0) <= "0000111010010010000010010100100011001100010111100111110110101100101010" &
             "1110010101100110011011100111100010010000010110010100111101100111000000" &
             "0000111100011001100110011100010001000001010001110101101100010110110000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2859300
wait for 0 ns;
PI <= "000101010001001000111101010101010001010";
wait for 100 ns; -- 2859400
XPCT <= "1000100100110011101101101010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2859440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2859500
wait for 0 ns; pulse_CK(PI);  -- 2859600

pattern := 133; -- 2859600
LOAD0 <= "0001011110110100010110111001110111000000100000011111101000001110001000" &
         "1101101111101100100000001011001100111100000101001100110110001010000001" &
         "1001000011101100010010111011110110000101111110110111010110011010110010" &
         "0";
UNLOAD(0) <= "1111111010011110001000110111010100101111001100110110110000100100100000" &
             "0101111000101011011011010101101010011011000001111100000111101100101100" &
             "0001111110011011111001101000001000111011000010010011111101010111101001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2880800
wait for 0 ns;
PI <= "010111010000111100100010011010000001110";
wait for 100 ns; -- 2880900
XPCT <= "1100010011111010000101010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2880940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2881000
wait for 0 ns; pulse_CK(PI);  -- 2881100

pattern := 134; -- 2881100
LOAD0 <= "0101000011000101010100010010010101011001010010101000111010110100101100" &
         "1111110111010010100100110111010011011111011111101001000000001011010000" &
         "1110010110100000111101101000111010011001011111000110001111111101111011" &
         "1";
UNLOAD(0) <= "0001011010000100000100110100111101100000101110010001111010101000101000" &
             "1000101111001110101001111011001110111000010101000000110011000110100010" &
             "0101101111101110111010001000100110010000111010100111111100011100011000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2902300
wait for 0 ns;
PI <= "010011101100110100000101001100011111110";
wait for 100 ns; -- 2902400
XPCT <= "1101010011001000001110000100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2902440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2902500
wait for 0 ns; pulse_CK(PI);  -- 2902600

pattern := 135; -- 2902600
LOAD0 <= "1110000010010101011111101000111110000011011110111101010011100010010000" &
         "1011100100111001110101101010110001111010011101001101011011010100011001" &
         "1110110100110101000101110101010011101010111111001010000111010001110011" &
         "1";
UNLOAD(0) <= "0110000010100101000010010111011101111001001110100110100010010101101000" &
             "0000110111111010100100100111000011011011010110100001000100000111110000" &
             "1110010110100010011001000101111000011101011011010110101110111011011001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2923800
wait for 0 ns;
PI <= "010111001001010100110111001010110101100";
wait for 100 ns; -- 2923900
XPCT <= "0101010101011011001101010010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2923940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2924000
wait for 0 ns; pulse_CK(PI);  -- 2924100

pattern := 136; -- 2924100
LOAD0 <= "1000001011100001110010000000011100110010010001011111100110011110001011" &
         "1101110010110011011111110101001100000110111000000011100000111011111100" &
         "0011001110110001011010001001000100010010101100111010000110100110110001" &
         "1";
UNLOAD(0) <= "1101000110100001001001010101101110100011000110110101010011000110010000" &
             "0101000100010001110100110010110000111010000100010100011011010100011001" &
             "1110010100111101100111100100000001101010010011010011101110011001111001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2945300
wait for 0 ns;
PI <= "011010110101101000100000001101000100100";
wait for 100 ns; -- 2945400
XPCT <= "0001110110100010000101101010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2945440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2945500
wait for 0 ns; pulse_CK(PI);  -- 2945600

pattern := 137; -- 2945600
LOAD0 <= "1011001000000100010111101101111000001110011110111100000100101100100001" &
         "0001101000011010000111010100011101011010100001001101010111100110101010" &
         "1011100100100110001000100101111000111100111000101000011011111010100111" &
         "0";
UNLOAD(0) <= "1110001110100101101100110101011110110010001101110100110110001000001011" &
             "1001110011110011000011000111011100001010110001001001110001111111111101" &
             "1010001100110011111110100000010100000011101010110010101110100111011011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2966800
wait for 0 ns;
PI <= "001000100010111100101110000000010100000";
wait for 100 ns; -- 2966900
XPCT <= "0101001011101010101101000010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2966940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2967000
wait for 0 ns; pulse_CK(PI);  -- 2967100

pattern := 138; -- 2967100
LOAD0 <= "0000001110110101110001100011101111011000101101001110000000110101100100" &
         "0101010111011011111110010010100100111110101001110100110000000101001101" &
         "1101110001001010011011110100011110111110011011001010110000110100101110" &
         "0";
UNLOAD(0) <= "1111001011010100000010110111100000101110001100110110110111011010111000" &
             "1100101010110001111011010110001110011010111001010100100010100110101001" &
             "0110001110111110101010010001100000011000010010000001111100111111101111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 2988300
wait for 0 ns;
PI <= "001110010111100111110000111110110011010";
wait for 100 ns; -- 2988400
XPCT <= "0010011110011111010011000110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 2988440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 2988500
wait for 0 ns; pulse_CK(PI);  -- 2988600

pattern := 139; -- 2988600
LOAD0 <= "0010001100000100111001010111100100001001100101101010010000001001100111" &
         "0111111001010110010111100110100011011010101010010000001011010000010111" &
         "1011010100110010000000111000101001111101011000011010101000000110110100" &
         "1";
UNLOAD(0) <= "0111001111110001110100110010111111111000110111101100100010110000101100" &
             "1001010101010101010011101100110101111110111001110100010100000101001101" &
             "1100011101000000111111011101000110001110011011001011100101111000101110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3009800
wait for 0 ns;
PI <= "010000101010000111110111101001110111000";
wait for 100 ns; -- 3009900
XPCT <= "1001001000001111011010100100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3009940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3010000
wait for 0 ns; pulse_CK(PI);  -- 3010100

pattern := 140; -- 3010100
LOAD0 <= "1111010010110010010000100010111100100011011100001010101111100100111011" &
         "0011110000111100010111000111011001001001000001001001101011000011111001" &
         "1111100100100101100000110001111010111110001001110000001100110010111011" &
         "1";
UNLOAD(0) <= "0100001101100000111010110110101100101001111101001100100011001010001110" &
             "1100110001001000000010001100110001011110101011010000101110010100010100" &
             "1010111100111000001100010001110010001101110010111011110101001000111100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3031300
wait for 0 ns;
PI <= "010010001111111010011010111001101101010";
wait for 100 ns; -- 3031400
XPCT <= "0001011111100001110110110100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3031440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3031500
wait for 0 ns; pulse_CK(PI);  -- 3031600

pattern := 141; -- 3031600
LOAD0 <= "0000110011111110110101100010011100110101101010110111100100000011010111" &
         "1101101001010001000010000110110000001011101110010010001100110000100111" &
         "0100101001000100011111111111010100101100010000011000000010101111100110" &
         "0";
UNLOAD(0) <= "1101010110000110000100010111110100100011000100100110100111000011111010" &
             "1101010000000010101011000111011001001001011000011000101011001111011001" &
             "1110101100111101000110010000100000001111010011101001101100111101111001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3052800
wait for 0 ns;
PI <= "010011110011000100111111011111100101100";
wait for 100 ns; -- 3052900
XPCT <= "0101011100001011101011110110011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3052940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3053000
wait for 0 ns; pulse_CK(PI);  -- 3053100

pattern := 142; -- 3053100
LOAD0 <= "0010100110111010010110101100010100110111001010000101111011010100000001" &
         "0011110011101000111111010110011000111110101110101111011111011000010111" &
         "1000001100101001101011011111000110000011101010000011110010101010110100" &
         "0";
UNLOAD(0) <= "0000110010111010100000110110000100010101110100111101100110000010011010" &
             "1111101001010110000000001000000011001011101111010100100101110100000101" &
             "0001001100011100111011010000010110011101011010101001101101100000001110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3074300
wait for 0 ns;
PI <= "011100101000010100111100100000011001000";
wait for 100 ns; -- 3074400
XPCT <= "1100100001011011101101001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3074440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3074500
wait for 0 ns; pulse_CK(PI);  -- 3074600

pattern := 143; -- 3074600
LOAD0 <= "1100011101011011101001000111110011111110010010110110011011100111101010" &
         "1101001011100101101011110110001110001001100011110000011010110100101110" &
         "1001001011011110111100010110110100000111111100001110010111011100000000" &
         "1";
UNLOAD(0) <= "0011100110111110010000110101010100110111010100000011111011110101001000" &
             "1000110001110010100100010010001011111010001111110100010011011100110110" &
             "0000001100101011101111001000000100000000000010000011011010100001011101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3095800
wait for 0 ns;
PI <= "000110100110100111111100100011111101000";
wait for 100 ns; -- 3095900
XPCT <= "1001111010011111111011111110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3095940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3096000
wait for 0 ns; pulse_CK(PI);  -- 3096100

pattern := 144; -- 3096100
LOAD0 <= "1001101011000101100101100110111000001111001111111011101111001111001110" &
         "1101110011100100011101010001010110100011111110001000111011100010000111" &
         "1100111010111000011100110001101001101000111000110111110101110110001110" &
         "1";
UNLOAD(0) <= "0010111100010111101001010010110011110110001110010110010010101011101110" &
             "0000000001100100011001100000001111001101010010110100010010111100001100" &
             "1100111110010100111000111101110001010011111000011111111101011010000001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3117300
wait for 0 ns;
PI <= "011011111100101001010010101000001010110";
wait for 100 ns; -- 3117400
XPCT <= "0100010010100101000110010100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3117440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3117500
wait for 0 ns; pulse_CK(PI);  -- 3117600

pattern := 145; -- 3117600
LOAD0 <= "0000001101100001110110001101010000110100000110001101101111101111000010" &
         "0100100101010000101110100110100001010111000001100000010111100011000110" &
         "1011011011111111011000111001101110100001011011010111011100100100100101" &
         "0";
UNLOAD(0) <= "1110101010100011100100110110111010101011010111011101111110101011001100" &
             "1000111001100110000000100011010100100111111111001000111101110111101011" &
             "1000111111111110101100001000010000001001111001110111011100111100110110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3138800
wait for 0 ns;
PI <= "000110111010001010010000100100011011010";
wait for 100 ns; -- 3138900
XPCT <= "1110011000110001010101010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3138940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3139000
wait for 0 ns; pulse_CK(PI);  -- 3139100

pattern := 146; -- 3139100
LOAD0 <= "0111100010110110110110111110100110011111001011111000100101111111011100" &
         "0010001000110001010100001101110010110111011011001010111010000010110010" &
         "0001011100011010100101011010001010100110110110011010101110000000100111" &
         "1";
UNLOAD(0) <= "0100001100000101110100100000011010110100011010101001101110101101101010" &
             "1100110101010111001110110110110001010011001001101010000011101011100110" &
             "0110011010111111010010011101111101110101011111000111101110101110101001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3160300
wait for 0 ns;
PI <= "000011000111101110010110111000111110010";
wait for 100 ns; -- 3160400
XPCT <= "1111111110101001011100001000010000001100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3160440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3160500
wait for 0 ns; pulse_CK(PI);  -- 3160600

pattern := 147; -- 3160600
LOAD0 <= "0010011000010010110000000011011010111111101110100000001111101011010110" &
         "0101011100011001001010011000100001000100110011100001011001110111011000" &
         "1010001001101011111101101001111000101111100011001111000000111000101001" &
         "1";
UNLOAD(0) <= "0000100011110010110000011110101110011111010011111110110101111001010000" &
             "1111000000111001000100110111110000110011010010010110111110000010010000" &
             "1101011100011000100111011011011000100011010110001011111110000110001111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3181800
wait for 0 ns;
PI <= "011111111011000100011010100011010010010";
wait for 100 ns; -- 3181900
XPCT <= "0000011100011001100110110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3181940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3182000
wait for 0 ns; pulse_CK(PI);  -- 3182100

pattern := 148; -- 3182100
LOAD0 <= "1001110010100100000111110100111100001111110111101000000010110111001011" &
         "0101011000011000011101111111101110010110011011110010011101110111001110" &
         "0111010101001011111101010011101000100100100111001111001000110011111110" &
         "0";
UNLOAD(0) <= "0111011001010110100100110111000000011111111110101110011111101100011010" &
             "1111010100010110011010101010100011000000101011100001011101111111111010" &
             "1110001101101011111011111101101011111011100011001111111000111011101001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3203300
wait for 0 ns;
PI <= "001001011110011001010001010111110100000";
wait for 100 ns; -- 3203400
XPCT <= "0101101001100101000000101000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3203440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3203500
wait for 0 ns; pulse_CK(PI);  -- 3203600

pattern := 149; -- 3203600
LOAD0 <= "0011000011101100110101011001010100101000000010001110100100010100100001" &
         "0000001101110111001101011101000011011010000101100111010011101110100011" &
         "1100001111000110011110011011111111100000011001111100000111100111101001" &
         "0";
UNLOAD(0) <= "1011110000110000000101110110101110001111101101100110011010110000010101" &
             "1110110001111000110101001101111100011110000011111000011001110111001111" &
             "0110010111001001111100111001101010100001110011010110101011110110111110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3224800
wait for 0 ns;
PI <= "000011000011101000000010001010011001010";
wait for 100 ns; -- 3224900
XPCT <= "1100111110100000000111011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3224940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3225000
wait for 0 ns; pulse_CK(PI);  -- 3225100

pattern := 150; -- 3225100
LOAD0 <= "1110101110100001111010000010111010011111110011101101001110011101010111" &
         "1110010001000110110001101100010101100111101110011011011001000100001001" &
         "0100100100101100101110000000011100011100101011000000110000011100111001" &
         "0";
UNLOAD(0) <= "0010000011001100100101110101011111101010001100100100100111010011101000" &
             "1101000111101000011101010111010001011010011101111100010011100110100000" &
             "1101101111001111111000110001111101010101010011101001101010100111001011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3246300
wait for 0 ns;
PI <= "000001011110100000010101100111101010110";
wait for 100 ns; -- 3246400
XPCT <= "0010101010000001001001101010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3246440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3246500
wait for 0 ns; pulse_CK(PI);  -- 3246600

pattern := 151; -- 3246600
LOAD0 <= "1001100000110110011110010010100010010101111011000101100011000001101111" &
         "1110101101010101000000110110001001110011010001000010110101001000101100" &
         "0000010101001001100001011101111110100111100100110110111010100100110001" &
         "0";
UNLOAD(0) <= "1100101101100101111000010011111000111011100101101111110111101101011011" &
             "1100010001000010010001001101000111100011111100011001111101011100000001" &
             "1010101100100000100110011101110111001001101011110011001111010001001101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3267800
wait for 0 ns;
PI <= "010101000010110001011001011101101011000";
wait for 100 ns; -- 3267900
XPCT <= "1100101011010101100001111010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3267940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3268000
wait for 0 ns; pulse_CK(PI);  -- 3268100

pattern := 152; -- 3268100
LOAD0 <= "0001001111111101101010100010011111100100110101000000110001100011000001" &
         "0111000111111110101110110101000001010001011101011010100001111111010000" &
         "1101101101100110011011100000101001111001010001011111100011111101011001" &
         "0";
UNLOAD(0) <= "1110100010010010011100110010100011010111101101100011110010100111101111" &
             "1110101101001011101000001110011000110101010001001100100101000100001100" &
             "0101111101100000000001011000110110010011100010100111110100100010011001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3289300
wait for 0 ns;
PI <= "011001001010011111110101111100011000100";
wait for 100 ns; -- 3289400
XPCT <= "0000001001101111011100010000011011111000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3289440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3289500
wait for 0 ns; pulse_CK(PI);  -- 3289600

pattern := 153; -- 3289600
LOAD0 <= "1110001111101100101111001001011011010101111110011001100100110110001001" &
         "1100111100100111100010000101010000101001101100111101101001110111111011" &
         "0110101010011010110010000110001011101010000000001011011101111000011010" &
         "1";
UNLOAD(0) <= "0111001110111001101000110010001101000100101101100100101010000111001101" &
             "1010001101100001110010001101000011010101001101010000100001110111110010" &
             "1100100101100110110011110101100011011101010001001111001111110110110001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3310800
wait for 0 ns;
PI <= "000001011010000001001100111111111101100";
wait for 100 ns; -- 3310900
XPCT <= "0101101000000100101000101000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3310940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3311000
wait for 0 ns; pulse_CK(PI);  -- 3311100

pattern := 154; -- 3311100
LOAD0 <= "0000101101001000011111010010011001111110100000001010000001100001001100" &
         "0001100000001100110010000100010100000011101001011010001110001110110101" &
         "1111100101110011111111100110100010000111101001001011110010110100010110" &
         "0";
UNLOAD(0) <= "0000001111100100111001010101010001010101100100111111101101111111001111" &
             "0110111110100111010000011001000011101101001100111101100001110111011011" &
             "1010101111011000010010011100011011111100000000001010101101111001110111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3332300
wait for 0 ns;
PI <= "011101011001110000001001000010000101110";
wait for 100 ns; -- 3332400
XPCT <= "0101000111010000100100010000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3332440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3332500
wait for 0 ns; pulse_CK(PI);  -- 3332600

pattern := 155; -- 3332600
LOAD0 <= "0000011011010110111111010010100110110010111101001100110111101011101110" &
         "0100010000000100110010101110000110110000101000010001101011011010101100" &
         "1100001100010010010100001100100011001011001001010111001010010011011011" &
         "0";
UNLOAD(0) <= "1001001100100100011100110010000011111110001110101110111010001010101000" &
             "1101100010001010110000101000010101000011011001011100110111001110110110" &
             "0110101101111011111111100101100011000001000001111011011101110000010111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3353800
wait for 0 ns;
PI <= "011011011110001000010101001010101110100";
wait for 100 ns; -- 3353900
XPCT <= "1101111000100001001001011010011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3353940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3354000
wait for 0 ns; pulse_CK(PI);  -- 3354100

pattern := 156; -- 3354100
LOAD0 <= "1110101110100000011101111000100000010011001011111010101010011101101011" &
         "1010110011111011001100011000000110101111111011110001100010000110011111" &
         "1001110110110100011010100111000001000100100011100111100101110111110111" &
         "1";
UNLOAD(0) <= "1100111010110010111010110011101110110010100111101100101010000111101010" &
             "1100010000001010000000101000010101010000001001011101110111010110001110" &
             "1000101100010000010100010001110011001111001001110110000111111111110010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3375300
wait for 0 ns;
PI <= "001101110000110000100110000101100000110";
wait for 100 ns; -- 3375400
XPCT <= "1100000011010010001110100100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3375440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3375500
wait for 0 ns; pulse_CK(PI);  -- 3375600

pattern := 157; -- 3375600
LOAD0 <= "1010111001101100100111111001110100010101101001000011110111110011000101" &
         "1001110001100111000010010111111010100100100110110111011100110101010011" &
         "0100111000100101010101111000100001000110011010010000101011010100101011" &
         "1";
UNLOAD(0) <= "1011101110100101011000010001111000010111001101011100111011001000101010" &
             "1010110011111011110000010100010101101011111010111100100001011100011111" &
             "1111011110111100100010100000000001010001000011110101100101111001011111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3396800
wait for 0 ns;
PI <= "010110111110000100101101110011111001000";
wait for 100 ns; -- 3396900
XPCT <= "1100011000011010101100110000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3396940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3397000
wait for 0 ns; pulse_CK(PI);  -- 3397100

pattern := 158; -- 3397100
LOAD0 <= "1011111011101110011100011001100001101110100001010110100111000010010000" &
         "0011101101100101001111111010010100110100010010100110110111001101111110" &
         "1010011001011001101110110000100111000101001000010110100111000111100000" &
         "1";
UNLOAD(0) <= "1110111001001100100001110001100100110101000101000001100111010001000010" &
             "0100111011101110011010011101111000100000101111110000011100110101000001" &
             "0000111101101101010001010100110011010110010010000001001011010001001011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3418300
wait for 0 ns;
PI <= "011101111110001001111111000100011001100";
wait for 100 ns; -- 3418400
XPCT <= "1100001000110111101111010110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3418440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3418500
wait for 0 ns; pulse_CK(PI);  -- 3418600

pattern := 159; -- 3418600
LOAD0 <= "1000001011000111011010100100101100001010111011111111101001101101001010" &
         "1111001001100111100111101001100110001011111100011001111111111100011001" &
         "1011011011100000011000110010101000010111010001011110010100010111011110" &
         "0";
UNLOAD(0) <= "1110111011001010011000110000100101101110010111110110100111100001111100" &
             "1100101101101111011111111010010100110100001011111000110011100101111100" &
             "0010111101011011100000011001110110010100000010000011110110000110001000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3439800
wait for 0 ns;
PI <= "011000011010110000100111011011001000110";
wait for 100 ns; -- 3439900
XPCT <= "0000001011000010001101110010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3439940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3440000
wait for 0 ns; pulse_CK(PI);  -- 3440100

pattern := 160; -- 3440100
LOAD0 <= "0100110101001000100100111000100101001001010110110000110100010101101001" &
         "0011110100111011101001100111111010010000100111110000111011101110001010" &
         "1110111100000101111010011101101000101011101110110111111110111100110100" &
         "0";
UNLOAD(0) <= "1000001010100111011000110101111100011010100111101101100010001011001010" &
             "1110000011100111110011101001110100001011111111011001111011100111111000" &
             "0010111111100110111000110000010010010111010000101100010111011001000110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3461300
wait for 0 ns;
PI <= "010110000100001100010010010001100101000";
wait for 100 ns; -- 3461400
XPCT <= "1101110000111001000110101100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3461440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3461500
wait for 0 ns; pulse_CK(PI);  -- 3461600

pattern := 161; -- 3461600
LOAD0 <= "1000110110101010110110000011010011111101000101100011110100000110000010" &
         "1001110100100110001000110000011110010111100001100011010111001011001010" &
         "0110000011010000110111110110000010000100111110110011010010100110101010" &
         "1";
UNLOAD(0) <= "1101110100000100000100010000111111100001001100110110111010001110101010" &
             "1100111100111011011000010001001011110000000110110100110011101110001010" &
             "1110001100001101011000100001100100010001000010100111110101011110111100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3482800
wait for 0 ns;
PI <= "000001110011000100111111111001011000110";
wait for 100 ns; -- 3482900
XPCT <= "1100001100001011101100100000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3482940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3483000
wait for 0 ns; pulse_CK(PI);  -- 3483100

pattern := 162; -- 3483100
LOAD0 <= "0011100101110111101010111100011100100101010110100010101100111001101101" &
         "0110000111010001010010001101100110000001001111010001011111110101110100" &
         "0110011110010001000000000001011101001001111001011000000000110001000101" &
         "1";
UNLOAD(0) <= "1010110101001110100000110111010011111101011111001111111100000001000010" &
             "0101110100100110001000100110011101010011100001110100010011001111111011" &
             "0111100111011010110011010001010001010001010010100011101000100011101010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3504300
wait for 0 ns;
PI <= "011001010100110001000111001001100110010";
wait for 100 ns; -- 3504400
XPCT <= "0001100011000100001000111000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3504440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3504500
wait for 0 ns; pulse_CK(PI);  -- 3504600

pattern := 163; -- 3504600
LOAD0 <= "0001100110000100001101011001100001110010100001111011101010001000010000" &
         "0110001000000100000101111010010100101101000111110100011100110101000000" &
         "1001011001011011010101111001001111100011001100110010011111000100101110" &
         "1";
UNLOAD(0) <= "0100100101110111101000110001001110100101101100100100110111001010101100" &
             "1000000111011011110011010101110100000101011111011001111111110101010100" &
             "0111011110011001100100000101010101001001010001111001101101111011100101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3525800
wait for 0 ns;
PI <= "000001001001111101011011101110101111100";
wait for 100 ns; -- 3525900
XPCT <= "1111000111101101100010000100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3525940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3526000
wait for 0 ns; pulse_CK(PI);  -- 3526100

pattern := 164; -- 3526100
LOAD0 <= "0000111101101101100110101000001011010101010111100100101011110001110011" &
         "0000111111110110110110000111001000001010111011111111011000011001101010" &
         "1110001101110000101010000100110101011100100010101111000000011010000110" &
         "1";
UNLOAD(0) <= "0110100110000000001110110000100011110010111111111101100010101001011100" &
             "1101000000001110111001111000010100101101010111010000111001010101010000" &
             "0100111101010001011011001101010110010110001010100011010101001110001010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3547300
wait for 0 ns;
PI <= "011010000101010110000011111000101010100";
wait for 100 ns; -- 3547400
XPCT <= "0100110101001000010101011010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3547440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3547500
wait for 0 ns; pulse_CK(PI);  -- 3547600

pattern := 165; -- 3547600
LOAD0 <= "1001111001011010100101001110011111110001101001101110101000001000010101" &
         "1100110010000010110110001101111010001100011001111010011100010111000001" &
         "0111011111100111111011101101111100111010011101101111110101000000101010" &
         "0";
UNLOAD(0) <= "1100111100100101000100110001001011011100001100100110111010001111111010" &
             "1011111111100010100001010001001011101011001111110100100001010101001010" &
             "1110101101111000100110000001110101001001000000101111000101010011100010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3568800
wait for 0 ns;
PI <= "010011000001010111100101100100001001010";
wait for 100 ns; -- 3568900
XPCT <= "0100010101001110011111000110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3568940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3569000
wait for 0 ns; pulse_CK(PI);  -- 3569100

pattern := 166; -- 3569100
LOAD0 <= "1011001000010001001001110010010110110011101101001001011101011000111100" &
         "1010110101101100000010110101010000011010000001001110101011101000110001" &
         "1110110010111100000101000110101011100000001011000010110111110110011010" &
         "0";
UNLOAD(0) <= "1100111001111110100000110110001111110001100101101110101010001001011101" &
             "1001110010010010110000011001011001001100000001110100110101011111100010" &
             "0111011111100111111111000000110110001111011011111111011111000010001010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3590300
wait for 0 ns;
PI <= "000111101111000011000011001010011101000";
wait for 100 ns; -- 3590400
XPCT <= "1001111100010100010110011100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3590440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3590500
wait for 0 ns; pulse_CK(PI);  -- 3590600

pattern := 167; -- 3590600
LOAD0 <= "0101000101001111011001100111011011101010001101000111010111011010001010" &
         "1000010100011000010110111100000010011101111011000101111001101001011010" &
         "1100001010101110111010001101111101110100110011000101010110011101010101" &
         "1";
UNLOAD(0) <= "1011001001010101001111110010001110110011000111001101000101111111111100" &
             "0101111111101100001000101011110001011110101001011100100111101100110001" &
             "1110110111111110100011011001101011110100000001000011011100110000110010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3611800
wait for 0 ns;
PI <= "011110111111010011111001101001011100000";
wait for 100 ns; -- 3611900
XPCT <= "0001111101010111110111111110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3611940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3612000
wait for 0 ns; pulse_CK(PI);  -- 3612100

pattern := 168; -- 3612100
LOAD0 <= "1000101010000101001010111010100010000111010111110000001000100011101101" &
         "1001010001010001001000010000100100000111110001111000111011101111011000" &
         "0011100101100000010110100000001001000001110011110010101111010000111110" &
         "0";
UNLOAD(0) <= "1111000100100011111101010011000011001010011110000111011010110001101100" &
             "0111010000010101100100100010000011011100001010011100100001100101111011" &
             "1100011110101110111100011101101000101010010001010001111100011011110000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3633300
wait for 0 ns;
PI <= "011111100000000110110001000010001101110";
wait for 100 ns; -- 3633400
XPCT <= "1001010000011011010100000000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3633440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3633500
wait for 0 ns; pulse_CK(PI);  -- 3633600

pattern := 169; -- 3633600
LOAD0 <= "0010101110010010000010111110100100000111111010010010101000011001010101" &
         "1011100001101110011011000001110111001111111100011001111110101111001100" &
         "0100000011100000100101000010001101000110101001001011000110000110100010" &
         "1";
UNLOAD(0) <= "1110101010000000001100110010101010010011001101100100110010000101001010" &
             "1110011001011010011000010001110100000011101011110000111111100111110000" &
             "1111001101101110001010000101010001010001010010110001110111011010111110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3654800
wait for 0 ns;
PI <= "011011110000100010110001011110011100000";
wait for 100 ns; -- 3654900
XPCT <= "1001110010000011010100011000010101010100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3654940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3655000
wait for 0 ns; pulse_CK(PI);  -- 3655100

pattern := 170; -- 3655100
LOAD0 <= "1011001010110100110000011010111110011111000011000001001110111111000110" &
         "0001110100110110111001010001100101000111110111100111010010011101000011" &
         "1101001001111100000011100111100100110000100000000011000010100000001000" &
         "1";
UNLOAD(0) <= "0001101111110100000110110111101100110011000100010010111001011001010010" &
             "0100100001101110010011011000110101011011111101011000111110111111100111" &
             "0001100110101110100101000000001111000011000010001011010111001011011010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3676300
wait for 0 ns;
PI <= "001000101111110111000000110110010010010";
wait for 100 ns; -- 3676400
XPCT <= "0010001111001100010110000100000001010101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3676440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3676500
wait for 0 ns; pulse_CK(PI);  -- 3676600

pattern := 171; -- 3676600
LOAD0 <= "1101001001000101110001110000100010011111010011001001101111111000011111" &
         "0111000010010011111000110001010101101010000110010101000010001100011110" &
         "0001000001100000110100000001001000001101010000001101101101111110110010" &
         "0";
UNLOAD(0) <= "1010001010010110100100110111101100001011001111001011011101111000101110" &
             "1111110110101100111000110010110100000111111101110100010100010100101111" &
             "1100101101111010111111011100010100100000000001010011101010100001000000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3697800
wait for 0 ns;
PI <= "000000101011111100010010110111000110110";
wait for 100 ns; -- 3697900
XPCT <= "1011101111101001000110111100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3697940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3698000
wait for 0 ns; pulse_CK(PI);  -- 3698100

pattern := 172; -- 3698100
LOAD0 <= "0001001011101100110100011100100110010011010011010000001011000111011111" &
         "1001111010111011010111010001001101001111110101001000010001110010001011" &
         "1011000101101000100101100100101100110100111001101110101101010001100001" &
         "0";
UNLOAD(0) <= "1110001001000001110100010001101010011011000101111011101110001110111011" &
             "1011000001011111111000000000000111111010011110010001110101010110110010" &
             "1010001101110010001100010000010000001100010010101101100101111111001010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3719300
wait for 0 ns;
PI <= "011011000000111000111000110111100011100";
wait for 100 ns; -- 3719400
XPCT <= "1100010011100011100110110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3719440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3719500
wait for 0 ns; pulse_CK(PI);  -- 3719600

pattern := 173; -- 3719600
LOAD0 <= "1101110110000111110101100100011110110001110101000010100001000111000000" &
         "0001111110011110110000101001010000100111010001110011010001101011101000" &
         "1110001001000101110010011101000010100111010101111111101001011000010011" &
         "0";
UNLOAD(0) <= "0111001010001000110100110100110100110011001101010010110010100100111000" &
             "1000110000111010101011010010011100001011111101011100110101110110001000" &
             "1111001100111000001111001001100100000001010011111101100100011110001001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3740800
wait for 0 ns;
PI <= "010010100100110011000100110111001010000";
wait for 100 ns; -- 3740900
XPCT <= "0100110011000100011110111100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3740940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3741000
wait for 0 ns; pulse_CK(PI);  -- 3741100

pattern := 174; -- 3741100
LOAD0 <= "1000111111010111100100101101010000001100001110011111101010111111100110" &
         "0111011000000001011011010100011000101011101000011010111001011010000110" &
         "1011110000000110011011011101000010000101110110011011100010010001101110" &
         "1";
UNLOAD(0) <= "1101110110000111110000010101011100010001001111000010101010000001101100" &
             "1010110110000111101000101101000011100111010000111100110001100111101010" &
             "1110101100001111011110000101000010000111010001111111011111010011110011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3762300
wait for 0 ns;
PI <= "010111111000000100001110001000110100110";
wait for 100 ns; -- 3762400
XPCT <= "1101110000011000101011001110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3762440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3762500
wait for 0 ns; pulse_CK(PI);  -- 3762600

pattern := 175; -- 3762600
LOAD0 <= "0000000111000100000011011100000110100100111100101010000010001001111111" &
         "1101100101011100000111110111010110111100110001101010011010110011101111" &
         "0010011011100110111011111100110110101001110111001101011000011001010011" &
         "0";
UNLOAD(0) <= "0110011111111111100000110100010010001100000110111101111010010010001000" &
             "1110011010010111000001110000011001101011000001010100100101010110000110" &
             "1010000101000100111101000101010001000011110010001010011011010010101111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3783800
wait for 0 ns;
PI <= "001001011111101100001111111110111111010";
wait for 100 ns; -- 3783900
XPCT <= "1011001110101000101000010000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3783940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3784000
wait for 0 ns; pulse_CK(PI);  -- 3784100

pattern := 176; -- 3784100
LOAD0 <= "1100001100110111011010011100110110001011000110100010101111010110010000" &
         "1011000100001101101010011000111101010111010001110100101001100100011011" &
         "0001100000111010100001010000000001001001101111001110101001001110010000" &
         "1";
UNLOAD(0) <= "1111000110000100000001110100000110000100100100101110011010000001111011" &
             "0111100111001101001100011011000111111000010001100100010110110111001110" &
             "1110111110110100011001110101100110111011110001011100010000110100110010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3805300
wait for 0 ns;
PI <= "011000100010111011101010111001100011010";
wait for 100 ns; -- 3805400
XPCT <= "1000101011100110110100111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3805440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3805500
wait for 0 ns; pulse_CK(PI);  -- 3805600

pattern := 177; -- 3805600
LOAD0 <= "0110001101010011100001001100101110000010110111111010101111010110010010" &
         "0111010111001100011010101101101101111110100001001001100100010111000011" &
         "1000110001100100110001000001001101000101000110000100010000110011101010" &
         "1";
UNLOAD(0) <= "1111001100010111011100010100110100101111001110100110110110100000011110" &
             "1100001110001111111010110001101111010111010000111000101001100100011000" &
             "1100101100111000001011011001000000011000000001111101001101001100110100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3826800
wait for 0 ns;
PI <= "010100101110100010100010101001001111000";
wait for 100 ns; -- 3826900
XPCT <= "0001101010010010010110111100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3826940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3827000
wait for 0 ns; pulse_CK(PI);  -- 3827100

pattern := 178; -- 3827100
LOAD0 <= "1110101110011100100110001010110110000111111110001101001000011110101111" &
         "0001011001110010111111110001011100111111110001000000011100100000010111" &
         "0110010011111010010010010111101000010110110100001000111100000100011010" &
         "0";
UNLOAD(0) <= "0101001101010111100100010101111100000110101111011110100111000001011010" &
             "1010010111000110011010111110110101111010110000001001100001011111100000" &
             "0100111101100110111111010000000110000101000011100110010100111001101110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3848300
wait for 0 ns;
PI <= "001010111110000010001000101001111111010";
wait for 100 ns; -- 3848400
XPCT <= "1111111000000000110101101010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3848440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3848500
wait for 0 ns; pulse_CK(PI);  -- 3848600

pattern := 179; -- 3848600
LOAD0 <= "0100101100110111001110000010111110001011111010100110101000101110001000" &
         "0100010000100110100010100100111100100011011001010100000000100011011100" &
         "1010011101100100111101010110001100010000100111111001101000100011011001" &
         "1";
UNLOAD(0) <= "1010101111011100100100010010110110000011000100001001010001111101100010" &
             "1110010011110111001111011110011101111011100000011100011100100100010101" &
             "0110010111111000010110011101111010000011010001001011011110001000110010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3869800
wait for 0 ns;
PI <= "001000010100100111000100110001100010000";
wait for 100 ns; -- 3869900
XPCT <= "0110100010001100011001101010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3869940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3870000
wait for 0 ns; pulse_CK(PI);  -- 3870100

pattern := 180; -- 3870100
LOAD0 <= "1110001110100000010111000000100010011010100111011110001011000100100110" &
         "0101010000100010000011010101011101010110110010010100101100101011001001" &
         "0010001111101010011111000010001000100100110111010001100110110110010001" &
         "1";
UNLOAD(0) <= "0000101100110111001010010010101100001111101110000110111010001010001110" &
             "1110010010100010000001101000111101100111010000010100101001100111011111" &
             "1110111101100100111011000001010110010000100000111010001111101010010101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3891300
wait for 0 ns;
PI <= "011001000100111101011011111101111010110";
wait for 100 ns; -- 3891400
XPCT <= "1100100011101101100001101010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3891440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3891500
wait for 0 ns; pulse_CK(PI);  -- 3891600

pattern := 181; -- 3891600
LOAD0 <= "0110001000010011100101001010100000000010000111001001101111110011000010" &
         "1010000001110001110010110101001110111011011110011011111011001010010100" &
         "0011100111101100000101000110001000000101101011011111000000101100000100" &
         "0";
UNLOAD(0) <= "1010001111000100010101010000110000011110110111111100011001100001101110" &
             "1110010001110000101011101100011101010110110010010100111100101111001010" &
             "0011001110111000110011101000011011110001110001000010100101111110110001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3912800
wait for 0 ns;
PI <= "001111111100101110111101001110001011010";
wait for 100 ns; -- 3912900
XPCT <= "1110110010111011111110011100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3912940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3913000
wait for 0 ns; pulse_CK(PI);  -- 3913100

pattern := 182; -- 3913100
LOAD0 <= "0010111110011101010011011111100101101011111001001001010011000111001011" &
         "1011111000101111010011010100110101001011000101000100000100010000111111" &
         "1011000011000011001000010011000110010001101001111101110000001110110111" &
         "1";
UNLOAD(0) <= "0010001001110111100000010011100000100010010111001101111111100111101000" &
             "1100001001110011000000110001100111111011111110010100110011001110110110" &
             "1010001111101110101101001101010001000001000000111001010101100111100100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3934300
wait for 0 ns;
PI <= "010110000101000110111100001001010100110";
wait for 100 ns; -- 3934400
XPCT <= "1001110100011011111100111000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3934440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3934500
wait for 0 ns; pulse_CK(PI);  -- 3934600

pattern := 183; -- 3934600
LOAD0 <= "0001010010101010111011100000110000011010111000011010110010010100111100" &
         "0010010110110111100011110011010010011011001010000000101100100000011101" &
         "1001101011101010110000111011100000100011101110011000000110111110100010" &
         "1";
UNLOAD(0) <= "1011111110010001010001110110110101100011000100001101011011001110001010" &
             "0101111100101111001001011010000111101010001101010100000000010100111110" &
             "0110100111001011101110000000000110000001000011111101110000001010011110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3955800
wait for 0 ns;
PI <= "011110000101010011000011010100110110100";
wait for 100 ns; -- 3955900
XPCT <= "1001010101010100010100000000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3955940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3956000
wait for 0 ns; pulse_CK(PI);  -- 3956100

pattern := 184; -- 3956100
LOAD0 <= "1000010100001110010111111000101010110010111110011110010110111100010100" &
         "1000101111010110011101111100001110000100011110111111111010111101100111" &
         "0101101100110100110110110010101111101000110011100000100001010011001110" &
         "1";
UNLOAD(0) <= "1010110010100110001101110100111010110011000110010110110010111010110100" &
             "1001011110000111100001101011000011111110000111011100100100101100011100" &
             "0000101110101000110000001000110110110001010010001001101110011010001100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3977300
wait for 0 ns;
PI <= "001010000110111011100000111001010001010";
wait for 100 ns; -- 3977400
XPCT <= "0100011011100110010101110010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3977440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3977500
wait for 0 ns; pulse_CK(PI);  -- 3977600

pattern := 185; -- 3977600
LOAD0 <= "0011000111010101001001011101000000000001110110101100110001010001111001" &
         "0000110100000000110101011001001001011011011110001101111010011011110111" &
         "1001110110000001110000010000110110001101111011001110001111100001101000" &
         "1";
UNLOAD(0) <= "1010110100100110010101110001111010010011000110011010010010011000010110" &
             "0010101111001010110101111000011101100100011111111100110110110101100100" &
             "1000101101111110111100110000111111100001010001110001110011010111100110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 3998800
wait for 0 ns;
PI <= "000000000111011101010011110000001010000";
wait for 100 ns; -- 3998900
XPCT <= "1010101101101101000111011110011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 3998940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 3999000
wait for 0 ns; pulse_CK(PI);  -- 3999100

pattern := 186; -- 3999100
LOAD0 <= "1011111011110101111110101001101010011010001001110100100000010011101010" &
         "0010111011010100001101111101100101110001110100011101000001110011111001" &
         "0110001001000111010100110011000011000000101001011110110011010101101000" &
         "1";
UNLOAD(0) <= "1110100110110001001110110101001000100001000100101110110011001011011100" &
             "1101110100011010100000011011011001111110001111010100100011010111110100" &
             "1000001110011011111100010001110110000001010011101111001100001111101100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4020300
wait for 0 ns;
PI <= "000000000001110001010011101100001010000";
wait for 100 ns; -- 4020400
XPCT <= "0110000111000101000101000010011111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4020440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4020500
wait for 0 ns; pulse_CK(PI);  -- 4020600

pattern := 187; -- 4020600
LOAD0 <= "0001010001000011100111000101101101111100001010101110111010100111000111" &
         "1010110001010111000100111101101110111100010011100001011000110101111001" &
         "0100000111001111010111110100101110101010110111010101111011110001100111" &
         "0";
UNLOAD(0) <= "1010111011010001011100110001101000110011010110110110110011001011001100" &
             "1001110101000110101001110001010101110100011101011100110001110111111000" &
             "1010101101011111110010000000010100010001000011101111101101011011001000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4041800
wait for 0 ns;
PI <= "010110000010101000010001101001101011010";
wait for 100 ns; -- 4041900
XPCT <= "0100011010110001000101100010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4041940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4042000
wait for 0 ns; pulse_CK(PI);  -- 4042100

pattern := 188; -- 4042100
LOAD0 <= "0000000001100110110100001100000110101111101101010111010011101001110010" &
         "1000001101110100100110010001011111111010010001101010101001110110011000" &
         "1010001010010101101010011011001101000010011010110101110110010011111100" &
         "1";
UNLOAD(0) <= "1110110000000111000100110101111101010101010100101100111010101001001000" &
             "1110110101000010011001000011011101111000010111111100110101111101011010" &
             "1100101110001101010001011001110100010001010011110101110100011111001110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4063300
wait for 0 ns;
PI <= "000000000100001100010110000111011000010";
wait for 100 ns; -- 4063400
XPCT <= "1100100000101001001111111110011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4063440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4063500
wait for 0 ns; pulse_CK(PI);  -- 4063600

pattern := 189; -- 4063600
LOAD0 <= "0010101111111111111110100011001101110101000010011000011100111100010010" &
         "0100111110100011001011011001101011000110011011011000100000110010011000" &
         "1100101100101001000111111010101111101010000100010001100010111001011011" &
         "0";
UNLOAD(0) <= "1010100000010010000000110110001110100111010110110110001010001011110010" &
             "0100100101100101011101111011011101111010001101110100110001110110111010" &
             "1110101111011111101000000001011111010101010010110101101110010110111110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4084800
wait for 0 ns;
PI <= "001010000100000010100000111111111110000";
wait for 100 ns; -- 4084900
XPCT <= "0111010000000010010000100000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4084940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4085000
wait for 0 ns; pulse_CK(PI);  -- 4085100

pattern := 190; -- 4085100
LOAD0 <= "0100001011001000110100011001100111111011000111100111000110100011010101" &
         "0110001010111101011101010000111011100001010000111010011001100110001010" &
         "0010111111010100111001011111011111100011101101010101010011111000011001" &
         "0";
UNLOAD(0) <= "1010101111110111011100101010001111010101001110111110001011111001011010" &
             "1010111110110000000101100001001011100010000111011100100000110110011010" &
             "1100001001101001100001001011110101010101000000010000101111011010010010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4106300
wait for 0 ns;
PI <= "001000000111110011100101110100101100000";
wait for 100 ns; -- 4106400
XPCT <= "1101101111000110011011011110011001001100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4106440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4106500
wait for 0 ns; pulse_CK(PI);  -- 4106600

pattern := 191; -- 4106600
LOAD0 <= "1000111111111010111100110110110111101101101111000110100000110111100111" &
         "0101110001011001001001111110110100110010110010111111001100100101010110" &
         "1110001100100010010111010111011011000000110011110011011010111011001000" &
         "1";
UNLOAD(0) <= "1011101000010100000000000110101101110011001100100110111010001011011111" &
             "1001101110101011111001010000001011101100010100111100110101101010001010" &
             "1010101011010100110100110000000101000001111101100100111101010010110010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4127800
wait for 0 ns;
PI <= "000110000111010110111111011010001101100";
wait for 100 ns; -- 4127900
XPCT <= "1101111101011011111111001110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4127940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4128000
wait for 0 ns; pulse_CK(PI);  -- 4128100

pattern := 192; -- 4128100
LOAD0 <= "0010001000001101011100000110101110010000100100010110101011000111010001" &
         "0101100100110110010101010011011111101000011101011010011100110101010101" &
         "0000100000111011111011011001010011100111000111010011111011100011000000" &
         "1";
UNLOAD(0) <= "1011111110010110011000100011110111000101110100100100111010001011101011" &
             "1111110101011010111001001000000111110010001111110111110101101101110110" &
             "0010001101100010010011010000000111010001110001100011101111010011100000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4149300
wait for 0 ns;
PI <= "010110000001110011010010010110001010110";
wait for 100 ns; -- 4149400
XPCT <= "0100110111010101010111001110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4149440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4149500
wait for 0 ns; pulse_CK(PI);  -- 4149600

pattern := 193; -- 4149600
LOAD0 <= "1001010001010010011111110001100110100010001011110001011010000110000001" &
         "1101100111001111000110110110111101110001010100011111011100100111001010" &
         "0010100000011101011101011110100111000100010011110010010011000010110111" &
         "1";
UNLOAD(0) <= "1110101001100001011100101110111100010001111000010010101011101011011111" &
             "1111101100100111110000001001011101101100010101011100110001110001110110" &
             "0100101000111011010101101011010111000101000101100011110111000010100000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4170800
wait for 0 ns;
PI <= "010100000111011111111000000010001011100";
wait for 100 ns; -- 4170900
XPCT <= "1100101101111111110100001000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4170940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4171000
wait for 0 ns; pulse_CK(PI);  -- 4171100

pattern := 194; -- 4171100
LOAD0 <= "0001110000100011011110010011010110010101010100010001111010010011111100" &
         "1100110011111111101001110011000110010011010101110011010100000100000101" &
         "1010000110010110000110000011010110110000101111010001101101101110100001" &
         "0";
UNLOAD(0) <= "1011110010010110011100110001110110000011010000110101100010101111001101" &
             "1011101101001110111000000000011101110100001101010111110001101111101000" &
             "0010101000011111111011011000100101010101010111100010010111000111011110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4192300
wait for 0 ns;
PI <= "000010000101010111100000101000000101110";
wait for 100 ns; -- 4192400
XPCT <= "1101110101001110010100001000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4192440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4192500
wait for 0 ns; pulse_CK(PI);  -- 4192600

pattern := 195; -- 4192600
LOAD0 <= "1001011110011100010110011100101110000011010010100111011111100110111110" &
         "0001011010101011100100100110001011110011010111110101000110000101000111" &
         "0100000001011001110000010001001010110011101110010000100001101101010111" &
         "1";
UNLOAD(0) <= "1011110011000111011100110011001100110101001110110101111010001110011100" &
             "1001110111101011111001100001000111110110000101110101110101001100100110" &
             "0110101110010110001010000001000101010001101011110001011101000011101101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4213800
wait for 0 ns;
PI <= "011000000101000010110011110011001100000";
wait for 100 ns; -- 4213900
XPCT <= "0101100100000011010101111010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4213940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4214000
wait for 0 ns; pulse_CK(PI);  -- 4214100

pattern := 196; -- 4214100
LOAD0 <= "0010010001111000010101100101001101101111010010111010101001101100101001" &
         "0001111010111000000011100101110011011111011100000011101000010011100100" &
         "0110000101111111011101111100110000011001101011101111011000001011000101" &
         "0";
UNLOAD(0) <= "1101111110010000010100110101111100100011001110100111110010101011111010" &
             "1001011100111111011001110000001011110010000111111100100111000101100100" &
             "0100001101011011111010101000000100010001000000100001100111001011010011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4235300
wait for 0 ns;
PI <= "000100000110001111111000101110110011100";
wait for 100 ns; -- 4235400
XPCT <= "0110001000111111110110010100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4235440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4235500
wait for 0 ns; pulse_CK(PI);  -- 4235600

pattern := 197; -- 4235600
LOAD0 <= "1110000100101110001010000010100010000011110110010100110001111100011000" &
         "1110010101000010100111010010101001100010101001100010010101010011001111" &
         "1000110111001111110000000101101011110001101100111010110011011000011101" &
         "1";
UNLOAD(0) <= "1101110000110100010111110101010111100111001100111100111001101000100100" &
             "1000111100110000000001000011000011111110001101010100100000011111000110" &
             "1010000101111101011001011001100100010001000001101111010010000111000101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4256800
wait for 0 ns;
PI <= "010110000111010000010100001100101101000";
wait for 100 ns; -- 4256900
XPCT <= "1001111101010001001001001010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4256940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4257000
wait for 0 ns; pulse_CK(PI);  -- 4257100

pattern := 198; -- 4257100
LOAD0 <= "1111000001100101101010001110000010000011110000111000010010111100111101" &
         "0011111010010100100000001100100011111011001000010011111101100100110100" &
         "1100000011110000111111110000000001100011011011101011100110100111101110" &
         "0";
UNLOAD(0) <= "1110100100100010001010010010111000100011101110110110110011101111011000" &
             "1101010101010010100000101010001011100010000100101100100001010111001100" &
             "0100001111000101110000111000110111010001101000101011110110010010110101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4278300
wait for 0 ns;
PI <= "000010000110111111100100101001100101100";
wait for 100 ns; -- 4278400
XPCT <= "1001011011101110011100100000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4278440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4278500
wait for 0 ns; pulse_CK(PI);  -- 4278600

pattern := 199; -- 4278600
LOAD0 <= "0111110011001010111001000110110100001011111000001110100111000101010011" &
         "0001100000110111101110110100101011010100100101010011101101100101000010" &
         "1110101011110011110110011100100011001000010111011000111011000010101111" &
         "1";
UNLOAD(0) <= "1100100001100101001000010111011000100011000100011110101011001110011100" &
             "1000110110000110110001011000010001111110011100010100110101100100010110" &
             "0000101111111000110001010000010110010101010011111011100101000111001011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4299800
wait for 0 ns;
PI <= "000000000100011110110111000110110110000";
wait for 100 ns; -- 4299900
XPCT <= "1011100001101011011111011110000011100000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4299940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4300000
wait for 0 ns; pulse_CK(PI);  -- 4300100

pattern := 200; -- 4300100
LOAD0 <= "1001001001001110100001001010001110111011011111100010000010101011110111" &
         "1011100011011011110011100000110100001011011101010101110001110010010111" &
         "1010000111000111000010011101100101101101100001110001101101001110111111" &
         "0";
UNLOAD(0) <= "1110110011000110011001010111101100000011000100101110100001001000011000" &
             "1110101100100100111100001000011001110000000100010100100001101101000000" &
             "0110101111111001110000000001110111010101010011011001011011000111001111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4321300
wait for 0 ns;
PI <= "000100000100011011000100110000100011000";
wait for 100 ns; -- 4321400
XPCT <= "0010100001110100011110001100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4321440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4321500
wait for 0 ns; pulse_CK(PI);  -- 4321600

pattern := 201; -- 4321600
LOAD0 <= "0110011100001110110000101110001111001100010001100011110100110111110111" &
         "1011011101010001101110101100100101011110011100111000110010110000010100" &
         "1110000100110010101110111000000010101111011100010010111100100000011000" &
         "0";
UNLOAD(0) <= "1101101000100110000000110011001110010011000100100100111010001010111100" &
             "1010100111010011100000010000000111101110001101011100110101110110010110" &
             "1110001111001101000110000001100101000001000011110001110111001111111111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4342800
wait for 0 ns;
PI <= "011100000000100001001010001001111101110";
wait for 100 ns; -- 4342900
XPCT <= "0001000010010100100110100100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4342940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4343000
wait for 0 ns; pulse_CK(PI);  -- 4343100

pattern := 202; -- 4343100
LOAD0 <= "1001110101101010011000000010111100101000010010100111110000001010111001" &
         "1101000111111001110110110111110001110010010100011011000011110000010010" &
         "0010001011010111000000010011001110100110101011001100110110100101000101" &
         "1";
UNLOAD(0) <= "1100111101100110010100010110010101100101001100100111100001011001110110" &
             "0100010111010000000100010000010101111110010100111100110110110100010100" &
             "1010000101111000000010000000010100110101010000010011110111001010010001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4364300
wait for 0 ns;
PI <= "001100000011000100110000100000110110110";
wait for 100 ns; -- 4364400
XPCT <= "0011101100011011000011011110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4364440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4364500
wait for 0 ns; pulse_CK(PI);  -- 4364600

pattern := 203; -- 4364600
LOAD0 <= "0011001100111001001100010001011100001000011000000001101111100011101111" &
         "0101110011010000011010100011111000011001111111000010010100100000001101" &
         "0010101011000001100011010011001000101011001110110111001110101110001101" &
         "0";
UNLOAD(0) <= "1011110100000110011100110011101110100001101100100101110000001010111000" &
             "0001000101110101001101000001010001110010001101010101000011111100010000" &
             "1010001110011101100110010000001100100001000001001101001111000011000101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4385800
wait for 0 ns;
PI <= "011100000110101011100101100011011100100";
wait for 100 ns; -- 4385900
XPCT <= "0101101010110110011110111100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4385940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4386000
wait for 0 ns; pulse_CK(PI);  -- 4386100

pattern := 204; -- 4386100
LOAD0 <= "0010011000011110101000011011110100000100111101010011011100010000100001" &
         "0001101101111010111110000001101100011111111011100011111100100001111001" &
         "0110000010110101000010111000100111100000000000010101010011001110001011" &
         "1";
UNLOAD(0) <= "1000101111110101011000110100001100100001000100000011101011001111100101" &
             "1000111111011101000000000011001011111100010111001100010100101100101110" &
             "0110001111000011000111010001011100100101001000100111101100000110000101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4407300
wait for 0 ns;
PI <= "001010000010100000000100010010001010010";
wait for 100 ns; -- 4407400
XPCT <= "1010011010000000001110010100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4407440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4407500
wait for 0 ns; pulse_CK(PI);  -- 4407600

pattern := 205; -- 4407600
LOAD0 <= "0011101010100110101001101001101000001001100011010100001011110011001110" &
         "1011111101110111101001001011111010111100001000111100111011111011101011" &
         "1111001110001111111011111010100010101110000010000101111111000011111000" &
         "1";
UNLOAD(0) <= "1101111001110110011000110111101100000101000100010011101011001001101010" &
             "1110100111111111000001011011001111111010011111111100110001100101111010" &
             "0110001111111111100110010001100111000101000000100101111100000011100011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4428800
wait for 0 ns;
PI <= "000000000010101100001111110101010010110";
wait for 100 ns; -- 4428900
XPCT <= "0010001010101000101111110110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4428940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4429000
wait for 0 ns; pulse_CK(PI);  -- 4429100

pattern := 206; -- 4429100
LOAD0 <= "1110010110110000101001100101100111001111111101111110111101000001001101" &
         "0101101001010001011001011111101100110011001000111101110010111001110011" &
         "0101011001010011010101011110100000100111101111011011111110011111010101" &
         "1";
UNLOAD(0) <= "1000101011100110001001110000100000000001000110010110001011111100001000" &
             "0110110111100011000001111001011001111000011101110100100111110111101010" &
             "1010101111011111010001011000110110110101000010010001100101001110011000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4450300
wait for 0 ns;
PI <= "011110000111101101000110001101001111110";
wait for 100 ns; -- 4450400
XPCT <= "1001111110111100001111111110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4450440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4450500
wait for 0 ns; pulse_CK(PI);  -- 4450600

pattern := 207; -- 4450600
LOAD0 <= "0101111011101101100111000111100100011001110100101111010000011001001001" &
         "0111001000111100011011010001001111110101101101010000101101100110111111" &
         "0111111001100110100000010110000111101110111010010001001100010000100000" &
         "0";
UNLOAD(0) <= "1010110111110100001000010101101111100111100100111100111011001011001111" &
             "1101100111010110000001001001001111110110010100110101110111111101110010" &
             "1000001100010011010111110000110110000001101001111011100101011111110100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4471800
wait for 0 ns;
PI <= "011100000111011100010011111011001100100";
wait for 100 ns; -- 4471900
XPCT <= "1101101101111001000101111010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4471940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4472000
wait for 0 ns; pulse_CK(PI);  -- 4472100

pattern := 208; -- 4472100
LOAD0 <= "0101111111101011001000101011001111101011011100110010001101011000011001" &
         "1001011101010110111111100110110000111111000000001010001000110100001100" &
         "1000100101000111101100111100101001101001111100111100010001111100010000" &
         "0";
UNLOAD(0) <= "1011111010100001000110010110101110110001101100101111111010001001001001" &
             "1101001100100111110000001001011101110000001100010100100001100110111110" &
             "0110101100100110000100010001000111000001111010110001000101011110101000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4493300
wait for 0 ns;
PI <= "010100000011010101100010100111100110100";
wait for 100 ns; -- 4493400
XPCT <= "0001001101011110000110110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4493440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4493500
wait for 0 ns; pulse_CK(PI);  -- 4493600

pattern := 209; -- 4493600
LOAD0 <= "1001011110101101000011110100110110110111111001000001000111100110001000" &
         "1101001011011000001100100010111110011100101001010101100011100011010111" &
         "0010011010101110011000011011101101001110111011100100001111000000110110" &
         "0";
UNLOAD(0) <= "1100111110000111001100010010001101100011001100110110110010001000111100" &
             "1101011111000010111001010010000011111110000100010100100001111100001100" &
             "1000101100001101101110010000110100000001010000101101000100010010110001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4514800
wait for 0 ns;
PI <= "000100000110111100111100000001111001100";
wait for 100 ns; -- 4514900
XPCT <= "1000101011111011101000111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4514940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4515000
wait for 0 ns; pulse_CK(PI);  -- 4515100

pattern := 210; -- 4515100
LOAD0 <= "0110000100011100110010101001110010010010010101100001110111011101110101" &
         "1001101101101010111010001101110101000010100011100011101110010100100000" &
         "1111100001110111000010010110111010101100111100111010001001011000101001" &
         "1";
UNLOAD(0) <= "1001111110100001000001110001110110110111100110000101010010101101001000" &
             "0000010101011101100101101000011101111000011101010101100011100111010100" &
             "1110001110100100011000011001101111010001111011100101101111001111011111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4536300
wait for 0 ns;
PI <= "011000000110110001011000011001000101010";
wait for 100 ns; -- 4536400
XPCT <= "1001101011000101100100111000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4536440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4536500
wait for 0 ns; pulse_CK(PI);  -- 4536600

pattern := 211; -- 4536600
LOAD0 <= "0100100000111001110010111100011000101111110011011100010110000101011101" &
         "0001111111010111100011001101000110111000001101101101100100011100000111" &
         "1101110100010110111010110010110111100100101101110110100010000100100010" &
         "0";
UNLOAD(0) <= "1001100101010000000100010101110000110011001100101101110011001110011100" &
             "1100100101110110111000010011000111100110010110111100100111010100100000" &
             "0110001101111111001110110001100101000001010010101011111100010011101100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4557800
wait for 0 ns;
PI <= "011110000010010111111011010111011000000";
wait for 100 ns; -- 4557900
XPCT <= "0000011001011111110101100010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4557940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4558000
wait for 0 ns; pulse_CK(PI);  -- 4558100

pattern := 212; -- 4558100
LOAD0 <= "0100100110001111010010000010110011001101000100011011110111001111011101" &
         "0011101110101011100111000111010101111101111000100001011010100000010100" &
         "1100100011010001100100110000011101101000100111000011011100010101000010" &
         "1";
UNLOAD(0) <= "1000100001110101010100010101010010100111001100011110010010001111110100" &
             "1000110101001011110000011011010101111100000100110100100100011100100100" &
             "0100100100011110110010010001110111110001000011100111011010001011001110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4579300
wait for 0 ns;
PI <= "001110000101000001100000000100010110000";
wait for 100 ns; -- 4579400
XPCT <= "1011010100010110000100010000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4579440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4579500
wait for 0 ns; pulse_CK(PI);  -- 4579600

pattern := 213; -- 4579600
LOAD0 <= "1011111101100110111111111000100010001101111010111111000111010000111101" &
         "1101111110000000111110110011001010101011110001011011101000010111101011" &
         "0101110011000110100010010011001000000001101100101100100111101011100110" &
         "1";
UNLOAD(0) <= "1101100110100111000100010111101011000101000100110011111010001000110110" &
             "1011101110010110000101000011010101111100000100111100010110100100110110" &
             "1000000110011011101010100000001101110001000001001011111110011011100100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4600800
wait for 0 ns;
PI <= "011100000101001111000111010100110000000";
wait for 100 ns; -- 4600900
XPCT <= "1100100100111100011001011010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4600940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4601000
wait for 0 ns; pulse_CK(PI);  -- 4601100

pattern := 214; -- 4601100
LOAD0 <= "0000101100001001111011111111000011010000111011001011101000011011110111" &
         "0101111110011111010111010101110000011010101000100011011101000011100010" &
         "1001110100000100000000100100000101110111111011011100001110100000000001" &
         "0";
UNLOAD(0) <= "1010111101000110011001110001101000100101001100011111010011011010111100" &
             "0001111110011100011100011001001011101110000101000101100100010111001000" &
             "1100000111001100100110000000011110000001000010101101100101000111001110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4622300
wait for 0 ns;
PI <= "011100000000001101010001110111100000010";
wait for 100 ns; -- 4622400
XPCT <= "1000000000111101000000100000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4622440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4622500
wait for 0 ns; pulse_CK(PI);  -- 4622600

pattern := 215; -- 4622600
LOAD0 <= "0101101111011001000001011100111001111011110101100111110000110001010011" &
         "1001010010110100110011011110010101110000111011111001001110001100101101" &
         "0101001000110110000101001001000011100011111000000000001011000011000011" &
         "0";
UNLOAD(0) <= "1111101101100101011100110111001011110001000100101101110010001010111110" &
             "1000110100001010000000011011010001111110001101110100100101001111000000" &
             "0000101100001100001110000001000111000001010001101001010110000111000100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4643800
wait for 0 ns;
PI <= "011110000101000111111100100100001100010";
wait for 100 ns; -- 4643900
XPCT <= "0001110100011111111111001110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4643940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4644000
wait for 0 ns; pulse_CK(PI);  -- 4644100

pattern := 216; -- 4644100
LOAD0 <= "0101100000011100111110001111101011000010110010100010001010100110011101" &
         "0011100011111110001110111001010001110010011110011101101100011010100010" &
         "1101001100010010000100010001000000011011111011101011110001001111100101" &
         "1";
UNLOAD(0) <= "1110101111110101000010010001100011110011001100100101110010001011111110" &
             "1001010100101110010000011000010101110100001110110100110011001100101100" &
             "0100101100111110001101000000010110000001010000100001101101001011100010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4665300
wait for 0 ns;
PI <= "000100000000000011100111011101100000010";
wait for 100 ns; -- 4665400
XPCT <= "0100100000010110011100111000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4665440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4665500
wait for 0 ns; pulse_CK(PI);  -- 4665600

pattern := 217; -- 4665600
LOAD0 <= "1010100011001111001101010011010000100010110110110001100110110101011011" &
         "1111011011110010101011000010100110010001110001001011110011001001001110" &
         "1111000111110011010110001010001011011100111001100110110010001010110111" &
         "0";
UNLOAD(0) <= "1111100000110100000000010111101011100011000100100110111010001010111100" &
             "1000110111100010000000011001000011111110001110011100110101010110000010" &
             "0000101110011000101010000000000110010001010011100011111101001011001010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4686800
wait for 0 ns;
PI <= "011000000001111001010111010000100001010";
wait for 100 ns; -- 4686900
XPCT <= "1100100111100101001010001100011111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4686940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4687000
wait for 0 ns; pulse_CK(PI);  -- 4687100

pattern := 218; -- 4687100
LOAD0 <= "0101111010000100110100110000111011010111001101101010011111010100001100" &
         "1101111100011001110101000010100001111101100111010111101010100101000010" &
         "1000000011101011110000100001001111010010010111101100101101111111111000" &
         "1";
UNLOAD(0) <= "1000100010000011001000110011011000100011001100010101110011001110111110" &
             "1001011101111010101000001010000111110100011101011100110011000101001100" &
             "1110001111111001111010100001010111010001010011110111011110000111111010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4708300
wait for 0 ns;
PI <= "011000000110010001011010010100100101000";
wait for 100 ns; -- 4708400
XPCT <= "0101001001000101100010010100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4708440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4708500
wait for 0 ns; pulse_CK(PI);  -- 4708600

pattern := 219; -- 4708600
LOAD0 <= "0111110110100011110101000000100100110001010000010000001000001011011101" &
         "0101011011010100110100100100110001000110101100111100000010100100001101" &
         "0100111011011111001101111110001001100100101000110001001010100110100011" &
         "1";
UNLOAD(0) <= "1101111010000000010100010001110011010111011110101110100010101000001100" &
             "1110110101011111111001100000000011111100000110011101100111100101000000" &
             "1100001111110001011110111001000100000101010011111101011101010011111000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4729800
wait for 0 ns;
PI <= "001010000100101110000110010011101110000";
wait for 100 ns; -- 4729900
XPCT <= "1111010010101000011010100100010101110000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4729940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4730000
wait for 0 ns; pulse_CK(PI);  -- 4730100

pattern := 220; -- 4730100
LOAD0 <= "0001010100011101101101000010101110101000000011111011110000011010000100" &
         "0001000111010100010000010101010110101001111001010100101010110001101011" &
         "0110101111110011011100011111001011101001011001110001111100010100100111" &
         "0";
UNLOAD(0) <= "1000110111100111010000010000101110110001001100010110111011101001011001" &
             "1000011111000110010000000000010001100010011100110100100111101100001110" &
             "1000101110011101101111001000010101000001101010100000001101001110001011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4751300
wait for 0 ns;
PI <= "011000000110010011010000010110101001100";
wait for 100 ns; -- 4751400
XPCT <= "0100101001000101010110011100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4751440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4751500
wait for 0 ns; pulse_CK(PI);  -- 4751600

pattern := 221; -- 4751600
LOAD0 <= "0000011101100011011011101010000110111010011001100101010111010110100100" &
         "1111010001110001100011110011001111000011010010111000000000100011000110" &
         "1010010011100110110011011111001100100010111100000001000100110010010110" &
         "0";
UNLOAD(0) <= "1010110100110001001110101010101100100001011010111101101010001011001100" &
             "1000001101000010100000100001010101101100001101011110100111110001001010" &
             "1110101010111001010100110001010101000101010111100001110111011010001110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4772800
wait for 0 ns;
PI <= "000110000110000000010110010100100100000";
wait for 100 ns; -- 4772900
XPCT <= "1001111000010001001001001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4772940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4773000
wait for 0 ns; pulse_CK(PI);  -- 4773100

pattern := 222; -- 4773100
LOAD0 <= "0110100010000101100010101100010010000011110100100001110110000111000111" &
         "1010111110010001000101101110001110000011011100101010000011110011010110" &
         "0100001011001011111100010110101011100110111110000010010000001001100101" &
         "1";
UNLOAD(0) <= "1010111000010111000000110110001100110011001110100110111010001010111010" &
             "1100110101110111001000110001011101101010000111111100100101101111000110" &
             "1010001110100100111000010000010100010001111000110000101111011010010011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4794300
wait for 0 ns;
PI <= "010100000001110001001101110011001001100";
wait for 100 ns; -- 4794400
XPCT <= "1000100111010100101100101000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4794440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4794500
wait for 0 ns; pulse_CK(PI);  -- 4794600

pattern := 223; -- 4794600
LOAD0 <= "0011110011101100111111111101000011011010001111001010000111000111111010" &
         "1100110111110101001110111101000100111101000101001001010010110101101010" &
         "1000010010000000000001011111101010100101001110111101111111000011110100" &
         "0";
UNLOAD(0) <= "1000100011100101000000010000010000100011000100000111110011101111101110" &
             "1001110110010110100001011010001111100110010100111100110111110111110100" &
             "1000001110001011111000001000110111010001010010110011111100000010101001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4815800
wait for 0 ns;
PI <= "001010000110101100000011011001001000100";
wait for 100 ns; -- 4815900
XPCT <= "1100111010101000000100111000011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4815940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4816000
wait for 0 ns; pulse_CK(PI);  -- 4816100

pattern := 224; -- 4816100
LOAD0 <= "0101000000100000101110111101101001000111101011100101101010001101110111" &
         "1000100110111101011000000101110111001000011111111000101000100010101001" &
         "0110000000111110111001010101101111100000010101110000010010101010110010" &
         "0";
UNLOAD(0) <= "1010110011000100011100110101011001110011001110101100101011001001111000" &
             "1000110111101111011001110011010101111000010101000101100011110101101010" &
             "1100101110000010000011010001110100010101001010101001100110001111111000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4837300
wait for 0 ns;
PI <= "001100000010101111101001111000001001000";
wait for 100 ns; -- 4837400
XPCT <= "0100101010111110110101011010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4837440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4837500
wait for 0 ns; pulse_CK(PI);  -- 4837600

pattern := 225; -- 4837600
LOAD0 <= "1001101100000111101101000101101101110001110100001100101100111001001001" &
         "0011101110010101111000000000000111001010111111011010010110001001011101" &
         "0010101111110000110001001001010101011100101001100100001101100110111010" &
         "0";
UNLOAD(0) <= "1101100010100100001100010100110011000111001000000111100010101111111100" &
             "1010100110101111000000011001000111101100010110110100100101101010101000" &
             "1110101100111110110101011011100110000101010011110001000111001110011010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4858800
wait for 0 ns;
PI <= "000010000110010111100100010010011000000";
wait for 100 ns; -- 4858900
XPCT <= "0100111001001110011111011110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4858940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4859000
wait for 0 ns; pulse_CK(PI);  -- 4859100

pattern := 226; -- 4859100
LOAD0 <= "0110000111001010111110101010100100000011101011101100001111111111101111" &
         "0001110010111011001010001100011001101101011001011100000101100111010010" &
         "0110101001110001010011101000101101110101001001010010000110011001001100" &
         "0";
UNLOAD(0) <= "1100101000110111000001110110101111110001001100000010110000011011010100" &
             "1000101110100001100001001000010101101110001111010100010010000101111100" &
             "0110101111111010110100010000010111000001010011110101101101000010111010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4880300
wait for 0 ns;
PI <= "011000000011001110100010001000101000110";
wait for 100 ns; -- 4880400
XPCT <= "1100001100101010010101010010010111010000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4880440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4880500
wait for 0 ns; pulse_CK(PI);  -- 4880600

pattern := 227; -- 4880600
LOAD0 <= "1110011011111011011110100010111000100101100111011001110101100110001000" &
         "0100101111011000001010000000110011100110010001101010001110100011111111" &
         "0110101100101010011011000010001010101111010101010011110011010011001001" &
         "1";
UNLOAD(0) <= "1101100111100110011100001010111100100011000100101100100011001101101010" &
             "1001111110110111010001011000001011101000001100010110100101101011010000" &
             "0110001001111001110011010011100111010101000101100011010101011110000100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4901800
wait for 0 ns;
PI <= "001100000010001011101000111001011111010";
wait for 100 ns; -- 4901900
XPCT <= "0111101000110110110100111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4901940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4902000
wait for 0 ns; pulse_CK(PI);  -- 4902100

pattern := 228; -- 4902100
LOAD0 <= "1111001000100110010101100111000101110111001010010100011101100110111001" &
         "0010100110111100011000110111111101000011010101111010101110100010110101" &
         "0110011100010110001101011101101110011100100010111101111011111000100011" &
         "1";
UNLOAD(0) <= "1001111011010111011100001010110000000101101110011101101001101101000110" &
             "1010101111010001001001101010010001100110000100101100000010101011111110" &
             "0110001001101010110001111011001111110101010001010011001000010110100100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4923300
wait for 0 ns;
PI <= "010000000011011110100111011110101000100";
wait for 100 ns; -- 4923400
XPCT <= "1100101101101010011111011110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4923440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4923500
wait for 0 ns; pulse_CK(PI);  -- 4923600

pattern := 229; -- 4923600
LOAD0 <= "0001000011010111111100111011011011001001000111000111010010001110100101" &
         "1100000011110111001101110001100111001001111000111100111001100010110100" &
         "0110100111101000001010000000000001110010100000110011011010111011010100" &
         "1";
UNLOAD(0) <= "1111101011000110010000011110011101010111000000010100111011001111111000" &
             "1011110110100010101001000001001111100010001100110110100011100110010110" &
             "0110101100011100001111010011100100000001000010101101100101010110001010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4944800
wait for 0 ns;
PI <= "001100000101101111101011011010011100000";
wait for 100 ns; -- 4944900
XPCT <= "0101100110111110110111011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4944940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4945000
wait for 0 ns; pulse_CK(PI);  -- 4945100

pattern := 230; -- 4945100
LOAD0 <= "0001000110100011100100001100000101001101100110011110010110001010100010" &
         "1010111100111110010101100101100110000011111111101110101100100001110001" &
         "1010000100010010111000000110001011000001100110000101100111011010101111" &
         "1";
UNLOAD(0) <= "1110100000110111000100110110000011000001000000000010011010101011110101" &
             "0011101111101011000101010001000111101100011101110100100101100010110110" &
             "1010100010101010101000001000010100110001110100100011111001011110110110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4966300
wait for 0 ns;
PI <= "011110000000001011011010010000101000000";
wait for 100 ns; -- 4966400
XPCT <= "1100110000110101110111001110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4966440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4966500
wait for 0 ns; pulse_CK(PI);  -- 4966600

pattern := 231; -- 4966600
LOAD0 <= "0100100100101010010100100101101110010001010001011000001111001011110001" &
         "1110000000101000100001011110000101100001010111000100010110010011110010" &
         "0110001111100011001111100001011001111100110000000100011000100100101101" &
         "0";
UNLOAD(0) <= "1001100110100111000110110100000111000101011110111110111010001011101100" &
             "1110110100100011000000111011000111100110000111111100110001101001010010" &
             "0110101101011000111100000011000111000001000010100101100100010110101110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 4987800
wait for 0 ns;
PI <= "010110000111101001011010100101110011110";
wait for 100 ns; -- 4987900
XPCT <= "0100011110110101100010110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 4987940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 4988000
wait for 0 ns; pulse_CK(PI);  -- 4988100

pattern := 232; -- 4988100
LOAD0 <= "0000011101100110110111010000100111110001111000011010001110000101111111" &
         "0111010110001010011011110101000110101000101110001011011000010011011110" &
         "0010100100110110001001110011110011010110110001100000100110010110011111" &
         "1";
UNLOAD(0) <= "1111100100000110010100010100100100010001001100111100010010001110110100" &
             "0111000100110000001001000010010101100100011110001100010010011111010000" &
             "0110001111101001000011010000001101110001111010010001010010001110001101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5009300
wait for 0 ns;
PI <= "001100000111100111111001111001101111000";
wait for 100 ns; -- 5009400
XPCT <= "1111001110011111110000100000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5009440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5009500
wait for 0 ns; pulse_CK(PI);  -- 5009600

pattern := 233; -- 5009600
LOAD0 <= "1100001000110111110011111011110010100011011100111010101111100110110001" &
         "1001100001111111001000011000111000110100001110011011000000111111001010" &
         "1001000000001001011101000000011111100000110110101101011101000100001110" &
         "1";
UNLOAD(0) <= "1011111101100010010100110001110111010001100100011000110010001011111110" &
             "1011010100011010000000001011010101101100011111000101110101010111011100" &
             "1010001100111100101111010000100111000001111001100001100110010011010111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5030800
wait for 0 ns;
PI <= "011010110101010101110000011000111101000";
wait for 100 ns; -- 5030900
XPCT <= "1001110101001111000100011000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5030940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5031000
wait for 0 ns; pulse_CK(PI);  -- 5031100

pattern := 234; -- 5031100
LOAD0 <= "1111111010011001001110010110110011000010110101010011101111001011100101" &
         "0101001101101110111111011110000110001011100011110110111001001000110111" &
         "1010111000011011011011011110101001001001110010011111010010010111101110" &
         "0";
UNLOAD(0) <= "1111001100100011100101010111111010000011000100110101111110100001000110" &
             "0111000001001110110000010000111000110100000110010000010000110111001011" &
             "1000100101001001010011001100001101110001010000101101101111000011100000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5052300
wait for 0 ns;
PI <= "000001100000100011111110011011110110100";
wait for 100 ns; -- 5052400
XPCT <= "1111100010000111111000111000011000110101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5052440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5052500
wait for 0 ns; pulse_CK(PI);  -- 5052600

pattern := 235; -- 5052600
LOAD0 <= "0010111010100100011000100111000110100010000000001111101010101100000101" &
         "1001001000111010100011100101001000010110101011001100011010101111101100" &
         "0100101001000101000000000101001100110011111100000101111111001110111100" &
         "0";
UNLOAD(0) <= "1011111001011101001000010010100001000010101101010101111101101010001101" &
             "1110001101101100001101001000010101001111011010111100100101001100010110" &
             "1111111100011001111111101001101010001010110010001010101011010000101111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5073800
wait for 0 ns;
PI <= "011100111000111100100001000100010101000";
wait for 100 ns; -- 5073900
XPCT <= "1001100011111010000111011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5073940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5074000
wait for 0 ns; pulse_CK(PI);  -- 5074100

pattern := 236; -- 5074100
LOAD0 <= "1000110011100100100110100000111100110111110001001100010011111110001111" &
         "0010000110101000111011110110000100101001100011000111111010000000110010" &
         "1101111000010111111000000100000001110101001010111100001100010110110010" &
         "0";
UNLOAD(0) <= "0101111011100100011110110110011100100010001100101101111011001000000010" &
             "0100001010110111110001000011001011010010010011010100010110100111101110" &
             "1100001101001111001010100001001100110000010010000001100110001110011001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5095300
wait for 0 ns;
PI <= "010000011011000010111111011101001101010";
wait for 100 ns; -- 5095400
XPCT <= "0101101100000011111101111010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5095440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5095500
wait for 0 ns; pulse_CK(PI);  -- 5095600

pattern := 237; -- 5095600
LOAD0 <= "0110101110000101101001000101000000001110001010010101110111111100110010" &
         "1110011001000111011111111100010110110001111111100100101010111111111100" &
         "0100111000100110100100011110011100101110101010000000111000100101000100" &
         "1";
UNLOAD(0) <= "1111110010000000110000110101110110110111001101101110100010001111001010" &
             "1001010100110110001001001010010101101001001011011100110111000100110000" &
             "1100011100011111011110110001000011000110000010111001101100010011011011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5116800
wait for 0 ns;
PI <= "000011011010011100000111000100110001110";
wait for 100 ns; -- 5116900
XPCT <= "1000111001101000001011011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5116940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5117000
wait for 0 ns; pulse_CK(PI);  -- 5117100

pattern := 238; -- 5117100
LOAD0 <= "0100101100001000000110001100101010010111111010110001011101100001010010" &
         "0110010001100010000010110000010111110111011001000001011100001000010001" &
         "0100001000111000111101100001010000101110000111100101001110111100110010" &
         "1";
UNLOAD(0) <= "0010101111101101101001010100011000101110001110010111110111011110110011" &
             "0100011011000110110101100010010101110001001110100100110010110111011101" &
             "1100111100111100001100010101011101101000101000000001110000101110000101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5138300
wait for 0 ns;
PI <= "011000000010100011111111101010100010100";
wait for 100 ns; -- 5138400
XPCT <= "0100001010000111111000010000010110000000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5138440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5138500
wait for 0 ns; pulse_CK(PI);  -- 5138600

pattern := 239; -- 5138600
LOAD0 <= "1110111001101010101110111000100001000000010010111111100100001111000001" &
         "0110011011100011010111101001011000001100011011011101110010100111101001" &
         "1011100101111100001001010001111000111100010011001100101010001111101101" &
         "0";
UNLOAD(0) <= "1110101110100100000010010101100010010111101110010111101010101100111110" &
             "1110010101110110000001111010000111110110010100001101110001001100010010" &
             "0100001100111000011001011000010111010101000011100100000100011011011010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5159800
wait for 0 ns;
PI <= "010000011010000101011101000100111100110";
wait for 100 ns; -- 5159900
XPCT <= "1101101000001101101001001010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5159940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5160000
wait for 0 ns; pulse_CK(PI);  -- 5160100

pattern := 240; -- 5160100
LOAD0 <= "0001111010000010011111000101101011000010001110010010000100001101010101" &
         "0000110001100100000111010111100110100111000000110100100010100010001011" &
         "1100111001110111011111010101110000100100110001110100010110110101100010" &
         "1";
UNLOAD(0) <= "1100111001101110101000010001110001000000001100111101000111101001001111" &
             "1010011001111001010010010001001010001100001010010001100010101111001001" &
             "1110001101110100000111111001110001001100010011001101100101001001001101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5181300
wait for 0 ns;
PI <= "000101101001001000100000100110111010010";
wait for 100 ns; -- 5181400
XPCT <= "0110100100110010000100001000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5181440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5181500
wait for 0 ns; pulse_CK(PI);  -- 5181600

pattern := 241; -- 5181600
LOAD0 <= "1010011001000000110111011101110101101011101001010111101111010110111100" &
         "1101100011100100000000010100110011001100000011100011110000010111110110" &
         "0101000100111000011111110100111000001000100010111011110110000110110001" &
         "0";
UNLOAD(0) <= "0110111010000110011101110100001010000000000100010110010100001001111000" &
             "1111111011100110001100000001110001100001001001111100111110101110001001" &
             "1000111100111101111001000100110000110000010011110101011111111100101110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5202800
wait for 0 ns;
PI <= "001111110011110100101000110110101000110";
wait for 100 ns; -- 5202900
XPCT <= "1100011111011010100001010010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5202940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5203000
wait for 0 ns; pulse_CK(PI);  -- 5203100

pattern := 242; -- 5203100
LOAD0 <= "1011101000001000011110010110001111010111000011111010010111101100110111" &
         "1111101001010110000101111010100101110001000000010100111001000010101010" &
         "0110110101111111001111111011111000000001111100111000001010100101100000" &
         "0";
UNLOAD(0) <= "1110011000000100110100110101110001001011100111010001111111100001111000" &
             "1011100011101010111000111110110000001000011011000101110101111111010111" &
             "1101101100111000111011111001110010011001100010111010011100000011011001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5224300
wait for 0 ns;
PI <= "000100100100010100001000011110111000110";
wait for 100 ns; -- 5224400
XPCT <= "0100000001011000100000010000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5224440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5224500
wait for 0 ns; pulse_CK(PI);  -- 5224600

pattern := 243; -- 5224600
LOAD0 <= "0100110011011100110111011001011110010000110010101111001110000101011111" &
         "0011111101101100110110000000100011101011010100001010001101011000011110" &
         "1110101010011010010011000110001110001110111001010001001000010110000011" &
         "0";
UNLOAD(0) <= "1010101000001100011100110110110100110101001101111100010111101011110011" &
             "0100101011001010101101000000110001110011000001010000111101001110001000" &
             "1010110101110101000011001100111000010000111010101001000011101010001000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5245800
wait for 0 ns;
PI <= "010101000000010011100001000001101111100";
wait for 100 ns; -- 5245900
XPCT <= "0101100001010110010101101010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5245940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5246000
wait for 0 ns; pulse_CK(PI);  -- 5246100

pattern := 244; -- 5246100
LOAD0 <= "1000110001010110110000100000010101101000101101011011110011101111010011" &
         "0010100111111111100101110101010000001101100110100111010100000010001111" &
         "0011100000011001101010110001111101011011111100010101010010001000001110" &
         "1";
UNLOAD(0) <= "0001110010011100100100010110011100110000001100000101111110100011111110" &
             "1100111111101110101010011010110000101111001100011100101101010100011110" &
             "0011101110011000011111001001000110001011010001100001101110010010000101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5267300
wait for 0 ns;
PI <= "011000110110111100011001110100011001000";
wait for 100 ns; -- 5267400
XPCT <= "1000001011101001100110010100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5267440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5267500
wait for 0 ns; pulse_CK(PI);  -- 5267600

pattern := 245; -- 5267600
LOAD0 <= "1011010010010111100011000110001101000010110011010010011001101010100111" &
         "0010100010110010110110111001000001111111010001010011010010011110110000" &
         "1110111101010110100100010001001111111000011100100011010110100000000110" &
         "0";
UNLOAD(0) <= "1111110001010010101100110101010101101000010101010011111000101001001000" &
             "1000101101100101101100001111000010001001110111110000010000000110101110" &
             "0010100111011011101001111101101111011010010000010101111010000101100100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5288800
wait for 0 ns;
PI <= "010010000100111011111011010000000111100";
wait for 100 ns; -- 5288900
XPCT <= "0001110011100111110100011000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5288940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5289000
wait for 0 ns; pulse_CK(PI);  -- 5289100

pattern := 246; -- 5289100
LOAD0 <= "0100011011101110001010111100001100011100010011111010000100011000111000" &
         "1111111001001011010010001100000000010010111101111111001101100101101000" &
         "1011011010111111000000101101000110101000100101111010110010101011011001" &
         "0";
UNLOAD(0) <= "1110110010010011000100110111000111100011001100010010101011001000101110" &
             "1000110100110010111001001001010001111110010101011100110111010110110010" &
             "1110001101011110100110000000010111000101010000100011010101000111000110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5310300
wait for 0 ns;
PI <= "001011011111001011100000011010110001010";
wait for 100 ns; -- 5310400
XPCT <= "0000011100100110010000000000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5310440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5310500
wait for 0 ns; pulse_CK(PI);  -- 5310600

pattern := 247; -- 5310600
LOAD0 <= "1010011001101101110110111000011001011110011011101001010000011010011100" &
         "0000100011010101001010110101010001001011101110011100101101111101010001" &
         "0001000010111101100011011000000111000001001101000111011010101110101001" &
         "0";
UNLOAD(0) <= "1101011010100110001100010101001100011100001111111100010000111010111110" &
             "0111110011011111010000110000000011010110000100111101000001100101001001" &
             "0110011111110101101110011001000100101000100001111011100001000111010000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5331800
wait for 0 ns;
PI <= "011001110101111001101010111000011101110";
wait for 100 ns; -- 5331900
XPCT <= "0101100111100110100100011000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5331940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5332000
wait for 0 ns; pulse_CK(PI);  -- 5332100

pattern := 248; -- 5332100
LOAD0 <= "0111000101110101010001011100010110011110001000000101010111110010001000" &
         "1100000101001101000010111010110101101000010111001111100110100110011010" &
         "1001111110100100011100000100010110101111100110010111001001100010001011" &
         "1";
UNLOAD(0) <= "1110011011111101101100110100000001111110000111100110001001111111000110" &
             "1001100011101101110010110101000011000111110111011000101101110101110010" &
             "0001100111111111000011001000010101010100000011001111101001101100001011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5353300
wait for 0 ns;
PI <= "000101110111001101011100110010001100100";
wait for 100 ns; -- 5353400
XPCT <= "1001101100111101101111011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5353440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5353500
wait for 0 ns; pulse_CK(PI);  -- 5353600

pattern := 249; -- 5353600
LOAD0 <= "1000001001110001100001010010011110010101101000000101001001011000011000" &
         "1001110011101011000100010101000001011000010010101011000100000001101010" &
         "1111111100010011111101001101001010011100100100011100111100000000101111" &
         "1";
UNLOAD(0) <= "0111000101010001010000010001000110011110010110100101111111000111001100" &
             "1111001101001010011010110010110100101100000110000101110011100110111010" &
             "0101111111100110011010010001000100011010100000100111101100100111000011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5374800
wait for 0 ns;
PI <= "011101100100011011001001110100110100010";
wait for 100 ns; -- 5374900
XPCT <= "0001100001110100110111011110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5374940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5375000
wait for 0 ns; pulse_CK(PI);  -- 5375100

pattern := 250; -- 5375100
LOAD0 <= "1110011000001100000001101100110110000100110101101001110010110001000000" &
         "1011100110011001101010001000000101111011010010011101011001101111111011" &
         "0111001010100101100110011100110111001010111101100110111000000111011110" &
         "0";
UNLOAD(0) <= "1111001001010101100101110011000110010101000110100111010000011110011100" &
             "0010110011111011101100101111010000011100000011111100010000001101001001" &
             "0011011100011001011001000100001010011001000010001101011110000111001111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5396300
wait for 0 ns;
PI <= "010000110010001101000100001000100000010";
wait for 100 ns; -- 5396400
XPCT <= "1000101000101100001110011100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5396440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5396500
wait for 0 ns; pulse_CK(PI);  -- 5396600

pattern := 251; -- 5396600
LOAD0 <= "1100010011001000111110000010000110011100001110110010101011001000100100" &
         "0001010000001110000000100010011011111001000100010000111101100111111111" &
         "0100101101000001011101001000011100010100000101100011111111110101011011" &
         "1";
UNLOAD(0) <= "1101011011001100000000010101101100100100001111101111110011000110001110" &
             "1000100110010110011010111000010100111111000010010100111001100111011001" &
             "1010001111111101001010110000100111011010010001100111011101001101110010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5417800
wait for 0 ns;
PI <= "000100000111011111010110011000011100000";
wait for 100 ns; -- 5417900
XPCT <= "1101101101111101011100011000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5417940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5418000
wait for 0 ns; pulse_CK(PI);  -- 5418100

pattern := 252; -- 5418100
LOAD0 <= "0011000010000100001110010110100100101011100010000100101011010111100001" &
         "0001110001001011000110110101100111001101100100100101101010100001101101" &
         "0110011010100110010001001100000001010100111000000010100111000100010010" &
         "0";
UNLOAD(0) <= "1101110010010100000010000110001110010101010110110110101000001011111110" &
             "1111111100100000111001100000011001111100000100010100110101101111111110" &
             "0000101011001011111000010000001100010101010101100011111111011110110010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5439300
wait for 0 ns;
PI <= "001110101000000010011011001110001000000";
wait for 100 ns; -- 5439400
XPCT <= "1100110000010001110101011010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5439440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5439500
wait for 0 ns; pulse_CK(PI);  -- 5439600

pattern := 253; -- 5439600
LOAD0 <= "1011000111011011010111011101000101011111110001001111011111011011101001" &
         "1000010010110111011001010011001000001011110101101011010000110101001011" &
         "1111101011100000011100100000011101001001100110010000110010010100110011" &
         "1";
UNLOAD(0) <= "0111000001010000000100111111100110101011011000100110110011000001111000" &
             "1100110001111111001010001111110100001001101101111100111011100001101101" &
             "1010011110101110110000000100000011010000010100110011111110001001010010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5460800
wait for 0 ns;
PI <= "001000010100111111011000001101010000010";
wait for 100 ns; -- 5460900
XPCT <= "1100000011101101110101110010000011000101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5460940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5461000
wait for 0 ns; pulse_CK(PI);  -- 5461100

pattern := 254; -- 5461100
LOAD0 <= "0010000000001100000100000110001000001100110010010101110010001100110110" &
         "1111011010110100000011011100101111011011010001100111001011110100000111" &
         "1010101011010111110011010111010010101000101101010001100011010101110010" &
         "0";
UNLOAD(0) <= "1110000001011111000101110111000111011111001101000010010111011010111100" &
             "0010111000101110111001011011011000001111110101110000010000111101101000" &
             "1110101110111010111110000101011111001001010010010001111000010101011001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5482300
wait for 0 ns;
PI <= "000010001011010001011011100101001000110";
wait for 100 ns; -- 5482400
XPCT <= "0100111101000101100111101110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5482440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5482500
wait for 0 ns; pulse_CK(PI);  -- 5482600

pattern := 255; -- 5482600
LOAD0 <= "0011100001100100101001111000011101011100001011110100000000111111001111" &
         "1100011111101111100010101100000000110101100011110001001010011000001001" &
         "1100011010110100011100100101101110010001111111001000110000010010111100" &
         "0";
UNLOAD(0) <= "0010001001001000000100110111010001101100101110010111111011001111111110" &
             "1001011000100111111011101110111100011111000001101101101111110100100111" &
             "1110101110110110111001110101010011011000101011100001110100010001011110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5503800
wait for 0 ns;
PI <= "010110101000010011010001111011011010100";
wait for 100 ns; -- 5503900
XPCT <= "0000010001010101010111100110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5503940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5504000
wait for 0 ns; pulse_CK(PI);  -- 5504100

pattern := 256; -- 5504100
LOAD0 <= "0111100011011110001011110001101010100100100000110100101110000111101101" &
         "0011011110110111001011001000001110000010001110010010101000111110101100" &
         "1001101111101011101100100101100000011101111000010101101100010100110110" &
         "1";
UNLOAD(0) <= "1101100001001000101101110001011101111100011101010100010001010101001111" &
             "0000011101101110101000010000010001110101000011111101000110010100101000" &
             "1100111110110110111010000000101100010011111011011000011011011001011101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5525300
wait for 0 ns;
PI <= "001100011011111010110110110001100100010";
wait for 100 ns; -- 5525400
XPCT <= "0001001111110011011101100010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5525440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5525500
wait for 0 ns; pulse_CK(PI);  -- 5525600

pattern := 257; -- 5525600
LOAD0 <= "0011100000001000000100100111000011011110001111100011110110100000110011" &
         "1001100110010101111101011111000100110101111000101000010000000010010100" &
         "1011110010000111100001010110100000011011100001100010100110010000100011" &
         "1";
UNLOAD(0) <= "0100100001111010000000010110101000100100010100010110111111100010111000" &
             "1001111100101010110011001100011101001010011110011100111101110110001110" &
             "1000101110101001101000111100110010011001010010100101111111010110011110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5546800
wait for 0 ns;
PI <= "000000010011001010010111100110101100010";
wait for 100 ns; -- 5546900
XPCT <= "1101101100100001011110001100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5546940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5547000
wait for 0 ns; pulse_CK(PI);  -- 5547100

pattern := 258; -- 5547100
LOAD0 <= "1010111001011100111111111011011000111110001001010001010010100111100101" &
         "0111101010010101000100010001110000101001110010110110101010000011010010" &
         "0100100111000101101001101100101110011100010001111111010110100111101011" &
         "0";
UNLOAD(0) <= "0010100001111100000000110110001001011110010101100110110111000001111000" &
             "1011101100100111000011000011010101111001101001111100100001001110010100" &
             "1010111110001101101100010101110000001011010011100011111110011110101111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5568300
wait for 0 ns;
PI <= "001101111010000100110100000111011000010";
wait for 100 ns; -- 5568400
XPCT <= "0100001000011011001100110000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5568440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5568500
wait for 0 ns; pulse_CK(PI);  -- 5568600

pattern := 259; -- 5568600
LOAD0 <= "0100000010101111000101111100101101111001011100010001101011111011110011" &
         "0011000101011110110110100001000100110111000101000110100101111100000011" &
         "1101011110000110100100000111000101000001001101100000000001101011011100" &
         "1";
UNLOAD(0) <= "1110111010011000100001110110001000011110010101110110001011000011011001" &
             "1010101000101011001100010101110001101001101011110100101110000111110011" &
             "1000100111000111101000010001111101011100010011100111111111100010001111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5589800
wait for 0 ns;
PI <= "011000000101000101100101100100110001110";
wait for 100 ns; -- 5589900
XPCT <= "0100100100001110001110011100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5589940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5590000
wait for 0 ns; pulse_CK(PI);  -- 5590100

pattern := 260; -- 5590100
LOAD0 <= "1001010011101110000101101000110100101000000100111110110011011011101100" &
         "1011010111010101100111000110010101110011001110100001010101110111000000" &
         "1100100001011101111100011100100001000110111011100011101001100000001001" &
         "0";
UNLOAD(0) <= "1001100010000111000001010100101101110001000100110111100000011100111110" &
             "1101010111001000011101010011000111110110000100010100110001110100000000" &
             "0100101111011100100110000001000101000101000001100001000000000010110100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5611300
wait for 0 ns;
PI <= "001000000000011110011000011000010100110";
wait for 100 ns; -- 5611400
XPCT <= "1101100001101001110111011110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5611440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5611500
wait for 0 ns; pulse_CK(PI);  -- 5611600

pattern := 261; -- 5611600
LOAD0 <= "0100111011110111011100111101111100110110011111000110101110001000010011" &
         "0001101100111101111000000000000001011100101000110000100010110010001110" &
         "1010101000001101101110110101101100101101111010101000111110000011001100" &
         "0";
UNLOAD(0) <= "1100110010100010000101110001100110100001011110111110111010111010101000" &
             "0000011101000100110101110010010101110010001111110100010101110111100010" &
             "0000100101011111011010001000110101010001010001110011001000001111100000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5632800
wait for 0 ns;
PI <= "011100000110010000001010111001000001110";
wait for 100 ns; -- 5632900
XPCT <= "0100001001010000100111100110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5632940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5633000
wait for 0 ns; pulse_CK(PI);  -- 5633100

pattern := 262; -- 5633100
LOAD0 <= "1101101100001110011100110100101110011101011111001111101111101001000110" &
         "1111101001110110110111110110011010010111010011000110010000110001101110" &
         "1100010001011111011110110000100011101110101000111110110100100101100010" &
         "0";
UNLOAD(0) <= "1101111010110111011100010100100100110111000100100110110010101000011010" &
             "1100101110101110100000010000010001111000001100111100110011110110101100" &
             "1010101101001111001110011000100100000001010000111001001101001010100101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5654300
wait for 0 ns;
PI <= "011100000110001110101011001111110100100";
wait for 100 ns; -- 5654400
XPCT <= "0101001000111010110011110110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5654440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5654500
wait for 0 ns; pulse_CK(PI);  -- 5654600

pattern := 263; -- 5654600
LOAD0 <= "1001001110101110011001101011101001000010100101011110100011010100101100" &
         "0101010001001010110000110111100110000100110111000110011111100001101001" &
         "1100111001011100111001110000011001000001111001011111111101010110101100" &
         "1";
UNLOAD(0) <= "1110101100000110011100010100100110110101000110101101110010101000000000" &
             "0100100111101110001101100010011001110010001110000100010100110101001100" &
             "1100100100010101111100011001110101100001101010111011110100000110101011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5675800
wait for 0 ns;
PI <= "001010000101100111101010000011100011000";
wait for 100 ns; -- 5675900
XPCT <= "0010010110001110110011110110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5675940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5676000
wait for 0 ns; pulse_CK(PI);  -- 5676100

pattern := 264; -- 5676100
LOAD0 <= "1111000011100011110000011010100101101111111100110001101010011011011001" &
         "0011011001011100010110101000011011001011100101110010100110110010101011" &
         "1100010011100110110000010010101110000011110111001111100010010000101011" &
         "0";
UNLOAD(0) <= "1111101110000110011110110010110011100011101110011110111010101000001100" &
             "1101011111010111001001111011010101100100011111000100100111100101001010" &
             "0100001101011100010101001001000110000001111011111010100110010010101100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5697300
wait for 0 ns;
PI <= "011100000100101011100011000011100101110";
wait for 100 ns; -- 5697400
XPCT <= "1001100010110110010110101100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5697440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5697500
wait for 0 ns; pulse_CK(PI);  -- 5697600

pattern := 265; -- 5697600
LOAD0 <= "0011101010110100100100100100001011100010100010100011011011001110111111" &
         "1000111010101100101100010000011101101010011110111111000111000011101011" &
         "1110000110010101011101100010101010000110001000110010011011011101011101" &
         "0";
UNLOAD(0) <= "1001100011000111010100010010101101000111001100010111111011001110011100" &
             "1110010111001111001000011000011001101110010100111100100011111110001010" &
             "0100101111101100111100000001100110000001010011101111100101010110101111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5718800
wait for 0 ns;
PI <= "001010000100110110101000101000011010110";
wait for 100 ns; -- 5718900
XPCT <= "0110010011001010110110010100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5718940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5719000
wait for 0 ns; pulse_CK(PI);  -- 5719100

pattern := 266; -- 5719100
LOAD0 <= "1001001100110110110001010001001111101111101000101000011000000100111101" &
         "1110001110100001111001100010010010011100110110011110111011000000110111" &
         "0010111011101101100101110000000010001110010101010001101001110011011000" &
         "0";
UNLOAD(0) <= "1011101011110100000100111101010001100011000100100101000011001011011010" &
             "0000111110100000100101001000001111101010011111110110010111000111101000" &
             "0010100110011111010011000001101110010101000000110011000001010011010000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5740300
wait for 0 ns;
PI <= "010000000111000111101001001001101101010";
wait for 100 ns; -- 5740400
XPCT <= "0001001100001110110010100100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5740440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5740500
wait for 0 ns; pulse_CK(PI);  -- 5740600

pattern := 267; -- 5740600
LOAD0 <= "0011010000101100010101000010110011111101001011110010011111111100000001" &
         "1010101000011100000010101111010001001010011000100010000010000000000111" &
         "1110000101011000110111101110010011001000111011100011001101001010001101" &
         "1";
UNLOAD(0) <= "1100101111010110010100110000010111000111100100101110101010101101111101" &
             "1011000110111111001000001000010001111100000111010100110111000100010110" &
             "1010001111111101000101011001010110000101010001110000110101010010010000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5761800
wait for 0 ns;
PI <= "011000000001110000000101011010010010000";
wait for 100 ns; -- 5761900
XPCT <= "1100000111000000001110010100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5761940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5762000
wait for 0 ns; pulse_CK(PI);  -- 5762100

pattern := 268; -- 5762100
LOAD0 <= "0100110010101101101110011101100000111110101001011000011110010001011111" &
         "1000110101111110110001011000110010101000000100111010010011000000000010" &
         "0110100000110001001111001011101100101000111011000110110010110001100110" &
         "0";
UNLOAD(0) <= "1001110001100100000001110110111001110101000100111110011011111010000000" &
             "0101100110000000100001000011000011101010011101111100010010000100100110" &
             "1010100101011010010011001001000100010001010001110011111100000010000000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5783300
wait for 0 ns;
PI <= "010000000011011001010110101011011011100";
wait for 100 ns; -- 5783400
XPCT <= "1100101101100101001100101000011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5783440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5783500
wait for 0 ns; pulse_CK(PI);  -- 5783600

pattern := 269; -- 5783600
LOAD0 <= "1110101101001010011010010010010100111000011100111010111100110111101001" &
         "1000111100001000111111101010111110101011011001001010001111000001100011" &
         "0010111110001001100101000100010011111110111101110111000111101010101101" &
         "1";
UNLOAD(0) <= "1011110010000001001000010100101010110111010100011000010010011111111110" &
             "0101110101101110101001011000010001101100001100111100010111000100100000" &
             "1010100100111011100111010000101111100001010011000111110011010110001110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5804800
wait for 0 ns;
PI <= "001010000011110111000101101011000010000";
wait for 100 ns; -- 5804900
XPCT <= "1010111111001100011100101000001010101101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5804940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5805000
wait for 0 ns; pulse_CK(PI);  -- 5805100

pattern := 270; -- 5805100
LOAD0 <= "0000010101101000000101000100101001011000000000010000101010001110111011" &
         "0101110001000001011000110110001000011001011011011010111101110000010110" &
         "0110101100000010001011010100000001100110101000111010001010110010011000" &
         "0";
UNLOAD(0) <= "1101101100110110001000010110001100110001000100110110111011101010101100" &
             "1101111110011010100001000010001111101110010100010100100011001101100010" &
             "0110001110001011100111111001000101000001000011110111101110000010101101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5826300
wait for 0 ns;
PI <= "010000000101001111000000010000101001010";
wait for 100 ns; -- 5826400
XPCT <= "0100100100101100010010001100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5826440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5826500
wait for 0 ns; pulse_CK(PI);  -- 5826600

pattern := 271; -- 5826600
LOAD0 <= "1001110000001001001011110111011001101001100110111011110001001101100000" &
         "0000111011101000001110000100011011000000101101001100010010010001100011" &
         "0110011111100110100010011100000000111111110110101010100010100100111111" &
         "0";
UNLOAD(0) <= "1110110100100100000100100100111011110001101100110100110010001111011110" &
             "1101111111010011000001000000011001111100001111010110100001111000010100" &
             "0110001001011000000111000011010101000001000000101011000101010110010100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5847800
wait for 0 ns;
PI <= "010000000001111001110101110111101000110";
wait for 100 ns; -- 5847900
XPCT <= "0000100111100111001100111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5847940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5848000
wait for 0 ns; pulse_CK(PI);  -- 5848100

pattern := 272; -- 5848100
LOAD0 <= "0101111110010011011000110100010100110101001010111110110111000000000010" &
         "1101010000101010100100000000011001101100111100101000001010000111000010" &
         "0010001011010101101100111001010110010110001100000111101101111011110000" &
         "0";
UNLOAD(0) <= "1101110001100101001000110110011011000001011110011111110010001011001100" &
             "1011110101111010100001101010011001100100010101011100100011011101000000" &
             "1110001111111100101010000001000110010001010010101011011100001110111010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5869300
wait for 0 ns;
PI <= "011010000110111111000011000101101101100";
wait for 100 ns; -- 5869400
XPCT <= "1001011011101100010011110110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5869440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5869500
wait for 0 ns; pulse_CK(PI);  -- 5869600

pattern := 273; -- 5869600
LOAD0 <= "1101100100000010011111010001001011000100110010100011000100000010001100" &
         "1111110100101110010010110001111101010110100101111111110110100100101110" &
         "0011100001100000010110110000111011110001101001110000001010000010100110" &
         "1";
UNLOAD(0) <= "1101111110110111011110010100001100110101000110111110101010001001001110" &
             "1100010110111110110000100010001011101100010100100100100011001111000010" &
             "1010001111010101001000010000000100010101001010110110001110011110011000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5890800
wait for 0 ns;
PI <= "000000100010111111101010101100010100000";
wait for 100 ns; -- 5890900
XPCT <= "0101001011101110110100000000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5890940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5891000
wait for 0 ns; pulse_CK(PI);  -- 5891100

pattern := 274; -- 5891100
LOAD0 <= "0101001100011101010001010000111010010010100010111110001001001111000011" &
         "0100000010101000010101101101100100001010101000011000100010110100011100" &
         "0011101110101110100000000001111000001000011110100110000001000100010000" &
         "1";
UNLOAD(0) <= "1111100010010110000101010111000011100100101110100110010100000000111100" &
             "0100111110101110111010101001111101011110111100110001110110101100101100" &
             "0110100110100010111110010001101010100000111011110000111011000111001100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5912300
wait for 0 ns;
PI <= "010001101100001001110111101110110001000";
wait for 100 ns; -- 5912400
XPCT <= "0000100000100111001011011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5912440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5912500
wait for 0 ns; pulse_CK(PI);  -- 5912600

pattern := 275; -- 5912600
LOAD0 <= "1111010001000000001100111101001001101000011101110100101100111010010000" &
         "0100101010010010000111001101111101110000111001010111101010000101101100" &
         "0000010001110011000000110011000000101110100000111111000010010110011100" &
         "1";
UNLOAD(0) <= "0101001100111011000001010100111010110110110100110110000000101010101101" &
             "1000011000111011010101001101110100001110100000011000100010100100011001" &
             "1010001110110100111110001100001010001101011001100111111001001110000110" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5933800
wait for 0 ns;
PI <= "000100001011100111010111000000011100110";
wait for 100 ns; -- 5933900
XPCT <= "0101001110011101011111010110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5933940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5934000
wait for 0 ns; pulse_CK(PI);  -- 5934100

pattern := 276; -- 5934100
LOAD0 <= "0010111001101101110100000010100110001011100111010101101010110001110110" &
         "1110101010110110001111111101111101001111111010000010111111101011010000" &
         "0100011001010000010101110001011011111111001010000101111010010000001000" &
         "0";
UNLOAD(0) <= "1000010001100100001000010101001001001000001111110100111111011111011100" &
             "1011111000011100010111110101111101110100111000010001101010001101101111" &
             "1100010101110011101010110000011000011010100000101111000101010011110000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5955300
wait for 0 ns;
PI <= "011111111100110011000000110011110011000";
wait for 100 ns; -- 5955400
XPCT <= "1100010011010100010011110110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5955440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5955500
wait for 0 ns; pulse_CK(PI);  -- 5955600

pattern := 277; -- 5955600
LOAD0 <= "0011101100111000000100001111110001010110001010010101100010100110101101" &
         "1010110001101010110001100111111010111111110001010111010110000010100011" &
         "0011101010110110010110001011100001100011000111001100000100101100100011" &
         "1";
UNLOAD(0) <= "0110111001101101110110110010101100101011101111010001101011010100110110" &
             "0000100010100110100111101111111101001111111011001000111111100111010010" &
             "0000111101010000011011000100011010111111001000000100100000010010100100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5976800
wait for 0 ns;
PI <= "011001001000010111011101110001011100000";
wait for 100 ns; -- 5976900
XPCT <= "1101100001001101111111101110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5976940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5977000
wait for 0 ns; pulse_CK(PI);  -- 5977100

pattern := 278; -- 5977100
LOAD0 <= "1110101000110011010110010110010111101101101100011100100011000010100110" &
         "1110101101100011000000111111101001011010101001010001101100010111010000" &
         "0001010010010100100011111110101101111001001000011011000110110011110001" &
         "0";
UNLOAD(0) <= "0001101100011100000000111011110001010110011100010101100011000101101100" &
             "0110110001110110101001010101101010111111100001010000010110001010100000" &
             "0110001010111110110110100100100000100110000111001001101111100001001111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 5998300
wait for 0 ns;
PI <= "010000100111001110011110010101001101010";
wait for 100 ns; -- 5998400
XPCT <= "1101001100101001111101100010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 5998440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 5998500
wait for 0 ns; pulse_CK(PI);  -- 5998600

pattern := 279; -- 5998600
LOAD0 <= "1101001110111100111101011111011010001010000000011000110111011011001111" &
         "0010101010000011111111010100011110000011101011111100010010000001111110" &
         "0111010110011100100100010101010101111101011100010110010111010010100011" &
         "0";
UNLOAD(0) <= "1010101001110111010000010011000111101101110110111110101011000111101000" &
             "1101101101111111010000101101111000011010101000010101111101011111110010" &
             "0100011111010110100001110001110111011101001010101011111101111111111001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6019800
wait for 0 ns;
PI <= "000111111110010010111011010010001010100";
wait for 100 ns; -- 6019900
XPCT <= "0110111001010011110110011100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6019940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6020000
wait for 0 ns; pulse_CK(PI);  -- 6020100

pattern := 280; -- 6020100
LOAD0 <= "0000110001011010000110111111110100101110001100001100010111111011111111" &
         "0011110011011001010010110000110001101001101110001000111010000011100110" &
         "1110111010011000001000110110101101011001110110011101010010111100011100" &
         "1";
UNLOAD(0) <= "1110001100111000111100010010000010101010011100011110100110101111101010" &
             "1000101000011011100001010000011101000011100010111100111111000101111100" &
             "1110011110011110100100011000010100001100010010100011111111011010001011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6041300
wait for 0 ns;
PI <= "001010001100011010001110100111001001000";
wait for 100 ns; -- 6041400
XPCT <= "1100010001100000111101110010001100000100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6041440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6041500
wait for 0 ns; pulse_CK(PI);  -- 6041600

pattern := 281; -- 6041600
LOAD0 <= "0010010101100001110101100101101010101111111010110000111101101100101100" &
         "0000101100100001011111000000100101010101101000100100010010100110100110" &
         "0010111011101101100110010011110001100100010111110011010001100111110111" &
         "0";
UNLOAD(0) <= "0011110000111110000000100010100100001110000100001000111110101111111010" &
             "1010110011011111100010010010100010101001100111011110111111001011100110" &
             "1010011010011010101100001101100101001001010100111101111110111110110100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6062800
wait for 0 ns;
PI <= "001010010001100111111100111001111110110";
wait for 100 ns; -- 6062900
XPCT <= "0111110110001111111110101100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6062940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6063000
wait for 0 ns; pulse_CK(PI);  -- 6063100

pattern := 282; -- 6063100
LOAD0 <= "1011001011100000011010101101111010101110001101010001011110110100100011" &
         "1000100110010111001011001010000011111101110100000110110011000111111101" &
         "0011011110011101010110010111100100100010001010010101011111110100101011" &
         "0";
UNLOAD(0) <= "0000010101100101110001110100110000001111000110110110101101101101100110" &
             "1111101100110100010111101010110101010101110001110000010110101110000111" &
             "1010011110111101100110001000110011100100010011110011000000101010011111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6084300
wait for 0 ns;
PI <= "001101111100011010001001101110011000100";
wait for 100 ns; -- 6084400
XPCT <= "0000100001110000110100011000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6084440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6084500
wait for 0 ns; pulse_CK(PI);  -- 6084600

pattern := 283; -- 6084600
LOAD0 <= "0111100000011100101110011001000000011100001100111000000000000000111110" &
         "0101011000011011110101000011111001010010101000010101011100010101101011" &
         "1110010100001001100010000010000100000011110001001101101100001100001110" &
         "0";
UNLOAD(0) <= "1000001011000100011100110000110000101110000101010001001111110101000010" &
             "0000100110000011111010010010010000111001101101011100110011001111111111" &
             "1010111110011111010010001100110100110110000010000101111100110100101011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6105800
wait for 0 ns;
PI <= "001000000010001110000011111001101011000";
wait for 100 ns; -- 6105900
XPCT <= "1110101000101000010000101000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6105940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6106000
wait for 0 ns; pulse_CK(PI);  -- 6106100

pattern := 284; -- 6106100
LOAD0 <= "0101010100110001101101011101111011111010101100000010000011110111010000" &
         "0010100100011111101110011110100110101000011010010101010101010100001101" &
         "0111011000110010001010111011001000101000001011000111011100011011100100" &
         "0";
UNLOAD(0) <= "1001100001110100001100010001001000010101000110111110111011101111011010" &
             "1110010110011011010001110001001011110010001100010101100101010101001010" &
             "0010001100001001001110111001000100000001110001101100110111001111100010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6127300
wait for 0 ns;
PI <= "010010000111010111011000101111011111000";
wait for 100 ns; -- 6127400
XPCT <= "0101011101001101110110110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6127440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6127500
wait for 0 ns; pulse_CK(PI);  -- 6127600

pattern := 285; -- 6127600
LOAD0 <= "1001011100110111101101100001110101011001100000111110100000101011001010" &
         "0001000000011011011110111110011010100001100001000110101001100100010011" &
         "0011101010000101000110100111000110100101111110000001001001100010100010" &
         "1";
UNLOAD(0) <= "1011110101110101001101010001110011110011010110000100001000011011111100" &
             "1101100100001101110101111000000111101100001110010100000001011100101110" &
             "0010101100111010000010110001001110110101000011010011111101011011101000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6148800
wait for 0 ns;
PI <= "011011101010110010101010001101110000110";
wait for 100 ns; -- 6148900
XPCT <= "1100011011000010110111100110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6148940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6149000
wait for 0 ns; pulse_CK(PI);  -- 6149100

pattern := 286; -- 6149100
LOAD0 <= "1001100111110000110000010001011101101010110101010111001001001011101111" &
         "0110001101111100010110010100011100111010101101100001011100110101010110" &
         "0110001001011111001010100111001001101100111011101010000101010000101100" &
         "0";
UNLOAD(0) <= "0011111100011111111101110100100111111001001110111100111000000010000000" &
             "1100001010010110111100101010011001100001010001011100100001100100010010" &
             "1110001110011101000100110001000110100010010010000001101000100000001011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6170300
wait for 0 ns;
PI <= "010011101001101111011100100110101001000";
wait for 100 ns; -- 6170400
XPCT <= "0000010110101101111011010110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6170440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6170500
wait for 0 ns; pulse_CK(PI);  -- 6170600

pattern := 287; -- 6170600
LOAD0 <= "0110011001110111001110111011000000100010010100101101011110101100010111" &
         "0111011100011000001011111101001110000000101000110011001010001001010010" &
         "0000111010000101100001101111111010001010101000111111011010100011011010" &
         "1";
UNLOAD(0) <= "1011100110110100100000110101000111101010101101111101110010101011101101" &
             "1101000101101111010000001010011101111110011101100101110101111101010101" &
             "0110101101010101101110001101000011001001111011101011101110011111101101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6191800
wait for 0 ns;
PI <= "010111011011100111011100100011011101100";
wait for 100 ns; -- 6191900
XPCT <= "1101011110011101111101100010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6191940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6192000
wait for 0 ns; pulse_CK(PI);  -- 6192100

pattern := 288; -- 6192100
LOAD0 <= "0001011010101000110101110101111110001111111110100101001110100100100100" &
         "0101111100101001101110001111001000110100110111100001011100011100110100" &
         "1011011000011101000110110110111011111011100111101110111101101100011010" &
         "0";
UNLOAD(0) <= "0011011001111011001000010011010000100010000100001111011111001111011111" &
             "1101011100011110000001010001011101000100011000110101000110000101110011" &
             "1000011110000111000011010000101001011001101000111111010001100011110111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6213300
wait for 0 ns;
PI <= "001101011010000010001101000100000110000";
wait for 100 ns; -- 6213400
XPCT <= "0111001000010000111111000110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6213440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6213500
wait for 0 ns; pulse_CK(PI);  -- 6213600

pattern := 289; -- 6213600
LOAD0 <= "0101000111110101010110100110010000001101100011100110011110000000111001" &
         "0111101011110000011010110111010010001011100111101000111110110010110100" &
         "0100110110001101111100010100000011101111000100101111110100110100110110" &
         "0";
UNLOAD(0) <= "1001111011000100110000110101100110001111100110100111110110101000101000" &
             "1110111110111111011000101011001011010000000111101101110101011100110100" &
             "0110001100011111100010011101100011011001100001111110001100101011110011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6234800
wait for 0 ns;
PI <= "010111011000010101111101011100101111100";
wait for 100 ns; -- 6234900
XPCT <= "1101110001011111101001011010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6234940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6235000
wait for 0 ns; pulse_CK(PI);  -- 6235100

pattern := 290; -- 6235100
LOAD0 <= "0010000011001100100111001010000100001011100011010001111110100001110000" &
         "1100100111101101010110010110011110001110101010001011111110111101011111" &
         "1100111010010111001111100111100111000001011110010110100001101001000100" &
         "1";
UNLOAD(0) <= "0110000110011001010010010110000010001101111101000110101110100011111101" &
             "1010101001110010101000001011010001001111000110100100110011110110010110" &
             "0100011110001101110100001101010010001101000010101110001110111010011111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6256300
wait for 0 ns;
PI <= "011011011000110011110111010111111010010";
wait for 100 ns; -- 6256400
XPCT <= "1100010011000111011000110000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6256440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6256500
wait for 0 ns; pulse_CK(PI);  -- 6256600

pattern := 291; -- 6256600
LOAD0 <= "0011000011111101101011011011100001100100111010110110100111101011100110" &
         "0010111001110001101010111111000000000001110011000010001011111001100110" &
         "1110010000111101111000100101110010100011001001110010010111100110101110" &
         "1";
UNLOAD(0) <= "0011000011101000100001110011001110101011111111110101100111000101110111" &
             "0000101101100100110100111010001111001110010011001101110010110101011100" &
             "0000111110011101101101100100100111000111011000010011110000100001000101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6277800
wait for 0 ns;
PI <= "010101011010110000011110011100110110010";
wait for 100 ns; -- 6277900
XPCT <= "1001001011010001101101010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6277940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6278000
wait for 0 ns; pulse_CK(PI);  -- 6278100

pattern := 292; -- 6278100
LOAD0 <= "0000010110001111111001110001100000111101001110000011001011110110101111" &
         "0010111010001001111111011111001110000011110110110001011101010010011111" &
         "1011111111111001010110111110111110011011111001101101111110100111100010" &
         "1";
UNLOAD(0) <= "0110000011010001101001110010100001100100001110110110100111100010001000" &
             "1100110001111111101000111011010001000001011011011100000111110101000100" &
             "1110010101111101110010011001110010110101000011110011000110100010001011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6299300
wait for 0 ns;
PI <= "000000010011110011110011101111101011010";
wait for 100 ns; -- 6299400
XPCT <= "1010001111000111010110110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6299440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6299500
wait for 0 ns; pulse_CK(PI);  -- 6299600

pattern := 293; -- 6299600
LOAD0 <= "1110111100110011110101100111010000011011101101110000100000001110001000" &
         "0110011111110001001110010110001010001011101100110010101011100011111000" &
         "0000100010000110100000011110110001111101001000110010101100010011011110" &
         "1";
UNLOAD(0) <= "1011110111000011111100110001111010111101010100000101111110101011101100" &
             "1001110000011011101001000001011101100111011111111100110101010110011110" &
             "0010001110111001011110011001100101001001010011101001110111101001101111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6320800
wait for 0 ns;
PI <= "010010101100010110101100010100010111000";
wait for 100 ns; -- 6320900
XPCT <= "1101110001001010111110001100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6320940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6321000
wait for 0 ns; pulse_CK(PI);  -- 6321100

pattern := 294; -- 6321100
LOAD0 <= "1000100011011000111011110000100110101011011100111110101011000110000110" &
         "1010111101101000110010011110010000111101110101011110111011100101101100" &
         "0100000110110010010110000111100001100111000100000101101010010101101110" &
         "1";
UNLOAD(0) <= "1010011101111111010001010110010000111011100111010110100101001110000010" &
             "1000011111110101100100101000011001101011001000110100100011101111111000" &
             "1000010111000110000000000000110011111111001000110010001111110010110111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6342300
wait for 0 ns;
PI <= "000101101111010110001100000110110000010";
wait for 100 ns; -- 6342400
XPCT <= "1000101101011000111101011010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6342440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6342500
wait for 0 ns; pulse_CK(PI);  -- 6342600

pattern := 295; -- 6342600
LOAD0 <= "0100101101110100100111100011101100010111011010101000111011001101010110" &
         "0100111111100011100110101111000010101101101101010111011111010001100100" &
         "1000000100110110011101000100111111001000000000111000101000010000110100" &
         "0";
UNLOAD(0) <= "1011000000010100100001110110100110001011000110110110101010000000010010" &
             "0111110111111000111000100000010001011001000101010100110111101101001110" &
             "1100010111111000110110010101100001100100010010010101111011010010101111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6363800
wait for 0 ns;
PI <= "000101101111110110110010010001110010110";
wait for 100 ns; -- 6363900
XPCT <= "0110101111011011010000101000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6363940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6364000
wait for 0 ns; pulse_CK(PI);  -- 6364100

pattern := 296; -- 6364100
LOAD0 <= "1001101111111000110100111110100000110010000010001100101000111100010100" &
         "0111010111011010010110100111011100101001111100111110101101110101010101" &
         "1010000001000111001111110111010000101001100011101101010001010110111100" &
         "1";
UNLOAD(0) <= "0100001100110000100101010011111100010111000110101100100000001100011011" &
             "1011111101110001100100100001010001101001011100010101010111010101000101" &
             "0100010100111100011001010101111101011110000010101001100001110011011101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6385300
wait for 0 ns;
PI <= "001011101100101100000101111100010110000";
wait for 100 ns; -- 6385400
XPCT <= "1111010010101000001111000110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6385440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6385500
wait for 0 ns; pulse_CK(PI);  -- 6385600

pattern := 297; -- 6385600
LOAD0 <= "1101110000100100010101110001110000011001001111011000101010100010010011" &
         "0011100000110101101010011100001100101011110111101101101111110101010000" &
         "0010100001100111100110100101110101100101000111101001001001000110011000" &
         "1";
UNLOAD(0) <= "0001001110111100110000110110101010010010000110101110111010011010011000" &
             "1010010111011100010100110001011101001001011101110100110101111101110110" &
             "0010010101010111100111000000001000001010100011111101001101110100011001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6406800
wait for 0 ns;
PI <= "010101101110101010011101101110111111000";
wait for 100 ns; -- 6406900
XPCT <= "1101001010110001111110000100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6406940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6407000
wait for 0 ns; pulse_CK(PI);  -- 6407100

pattern := 298; -- 6407100
LOAD0 <= "1001110101101000100110110101000101100000010110101010010111011110100010" &
         "0111011011110100100110110110001011101010010011000101111010001001111110" &
         "0100001101001100110100000001011000100011000001110010101111100000110000" &
         "0";
UNLOAD(0) <= "1110110000011000000001010101100010011001011101110110101110000111011000" &
             "1110101000001110011000000010011101101011010110111100110011110101010010" &
             "0110110101101101000010010001110100110100000001101001101010001111110111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6428300
wait for 0 ns;
PI <= "000010110000101101111111110101101111100";
wait for 100 ns; -- 6428400
XPCT <= "1111110010101111101000111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6428440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6428500
wait for 0 ns; pulse_CK(PI);  -- 6428600

pattern := 299; -- 6428600
LOAD0 <= "1010111000000001011101111100100100010110100010011011001101111010010011" &
         "1101000010110100001111010111000111100100000001000010011010111101010001" &
         "0101010000000101110010010111001001100010100000011101110010010101100100" &
         "0";
UNLOAD(0) <= "1110110101001100100000110101010111000000001110101110100110101011101110" &
             "1010011001101010001010100110011001101110011011000001111011001101011100" &
             "1100101101010100010010001100010000010110000011110011100100101111111000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6449800
wait for 0 ns;
PI <= "010000101001010100111011100100001010000";
wait for 100 ns; -- 6449900
XPCT <= "1100100101001011100110011100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6449940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6450000
wait for 0 ns; pulse_CK(PI);  -- 6450100

pattern := 300; -- 6450100
LOAD0 <= "0001011110001001100110101010111111110110001111110111010000000001110101" &
         "0111101100110101001011010011011011000010000011110000000001000110011010" &
         "0000001110110100011101010101010010101011110000010101100010110110111001" &
         "1";
UNLOAD(0) <= "1010111001000101011100110100100110010110111100011011111111001001011011" &
             "1011000000101111111011011111010100100000001001000100111011111101110011" &
             "1100111100010111110000000101010011010011100010111101110100010000001100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6471300
wait for 0 ns;
PI <= "000000100101000100101101100011101110100";
wait for 100 ns; -- 6471400
XPCT <= "0111100100001010101001111010011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6471440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6471500
wait for 0 ns; pulse_CK(PI);  -- 6471600

pattern := 301; -- 6471600
LOAD0 <= "1000010000011111100100001000000110010011110001011011100100011011100001" &
         "0010010111000101001100010101111101011000110111110011101101010001011111" &
         "0011010011101010101111111000010000100110010000011010011010100100100000" &
         "0";
UNLOAD(0) <= "0110011100001101100000110010100011010110000101110101111010000011111001" &
             "1111101110100011011011010001011000000010001011010100100101001110011010" &
             "1100101110110100111001100000010000011011110010100100001111111010111001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6492800
wait for 0 ns;
PI <= "000001001011110100000111110110101010010";
wait for 100 ns; -- 6492900
XPCT <= "1110001111001000001110000100011111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6492940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6493000
wait for 0 ns; pulse_CK(PI);  -- 6493100

pattern := 302; -- 6493100
LOAD0 <= "0010011011001110001100011000001001000111010100000011001001001110001001" &
         "0000011111110110001001110011001110101000010101100010110111001101100001" &
         "0010111001110101011100111000101001101000011011011010011111000110100001" &
         "1";
UNLOAD(0) <= "1110010001011111100000110001001000010011001101011111100110101011101000" &
             "1011011111000111101000011101111101011000111111010000101001010101011101" &
             "0110111111111000100001011101010010010111010010101011011101100001001000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6514300
wait for 0 ns;
PI <= "001000100000001000001110100100111100010";
wait for 100 ns; -- 6514400
XPCT <= "0101000000100000101110000100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6514440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6514500
wait for 0 ns; pulse_CK(PI);  -- 6514600

pattern := 303; -- 6514600
LOAD0 <= "0010001000000110100110011101101101101110000101011100000100100001010111" &
         "1000100111110101101011010010000000011110010110010111001110111000100110" &
         "0101001101011111010110011101111001010111111100111011011111110011101010" &
         "0";
UNLOAD(0) <= "0110011000011110000000110110000001100111001100000010000001001011110000" &
             "1000111111101110011000010011011100101000001101111000110011000101000001" &
             "0110111111111101111010000001111001111101010011010011111100000100101111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6535800
wait for 0 ns;
PI <= "001111001101001100010100000000111001100";
wait for 100 ns; -- 6535900
XPCT <= "0100110100111001001101011010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6535940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6536000
wait for 0 ns; pulse_CK(PI);  -- 6536100

pattern := 304; -- 6536100
LOAD0 <= "1010111111000010001100010111011000101010110111100100110111100111000011" &
         "1000110101010111000101111101000000100100000001010001111100100001111111" &
         "0101011010101000101110010010110011011011010001010010101010100110110001" &
         "1";
UNLOAD(0) <= "0110001001000010100000110101101111101110011101011100011101100101010010" &
             "0001100101101000001011010100010001011010000111010100001110110100000110" &
             "0000101101011101010010001000111001010010010010101011010101110111101010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6557300
wait for 0 ns;
PI <= "011001110110100000011110000010011101100";
wait for 100 ns; -- 6557400
XPCT <= "0101101010000001101111011110011111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6557440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6557500
wait for 0 ns; pulse_CK(PI);  -- 6557600

pattern := 305; -- 6557600
LOAD0 <= "0011101101101100111011010010111000011111001111011001110100110101110001" &
         "0111111011111101100101101111101111001100111011101001111011001010010110" &
         "1110010000010110001101100001010100100111011000001010001111101000010010" &
         "0";
UNLOAD(0) <= "1010111111000110001000110111010000001010001101100110100111100101100010" &
             "0110110101001110001101001101010000100000011001011000111000101101111100" &
             "0101111110101010001010011001110011011111010011010011011011101001111001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6578800
wait for 0 ns;
PI <= "010000010010101000110100100100100000000";
wait for 100 ns; -- 6578900
XPCT <= "0000001010100011001000000000011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6578940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6579000
wait for 0 ns; pulse_CK(PI);  -- 6579100

pattern := 306; -- 6579100
LOAD0 <= "1111011110101100011100000011011011001111011100111011010001001011100110" &
         "0010101101001100000111000010111100101100000100101101110100001110100010" &
         "0010000101011101010101100011100000101011111010011000011110110000100110" &
         "0";
UNLOAD(0) <= "0101101111111000101000110111111000111111011101010101100111000100111000" &
             "1000011001001111000001000111101111001000111011101001111011000110010100" &
             "1110111100011100000001010100000100010111100000100011101100101111110000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6600300
wait for 0 ns;
PI <= "010100101010101011110100000101101100100";
wait for 100 ns; -- 6600400
XPCT <= "0101001010110111011110100100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6600440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6600500
wait for 0 ns; pulse_CK(PI);  -- 6600600

pattern := 307; -- 6600600
LOAD0 <= "0010101001010111111010011011110111101010001011011001110111001001110011" &
         "1100101010110010011101000111011101101110100110101100001110100011000011" &
         "0111010001111000100001010010110010001100111010100000011100111101010111" &
         "1";
UNLOAD(0) <= "1001011010011000001000010111001001101111000110110101110011101001101110" &
             "1100011101100010011011100010111100101100011100111000110101000110000000" &
             "0010101101011101010011111100100000011010010010101001111110111111101000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6621800
wait for 0 ns;
PI <= "001100100101101100011010100001000100010";
wait for 100 ns; -- 6621900
XPCT <= "1001100110111001100100111000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6621940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6622000
wait for 0 ns; pulse_CK(PI);  -- 6622100

pattern := 308; -- 6622100
LOAD0 <= "0010100111000000010110110001110001010111001001011110110111110110100111" &
         "0100000001001011011011100001001111010110111011110110111000010111100010" &
         "1111011001111111100101001100000100000001001001001010010011111110011111" &
         "0";
UNLOAD(0) <= "0000101001010011101110110110100111101010010101010111110111101000111011" &
             "1001100000111111001001010111001111100010111111100000101011100111100001" &
             "0010011110111010100111001100110000001000111000110000111110111100010111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6643300
wait for 0 ns;
PI <= "010000001110000101110011000000100100110";
wait for 100 ns; -- 6643400
XPCT <= "1101101000001111000001011010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6643440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6643500
wait for 0 ns; pulse_CK(PI);  -- 6643600

pattern := 309; -- 6643600
LOAD0 <= "1111110100100100010111101001110100110100010110101100011000101000111001" &
         "0111000011001011110000001011010011111001110001010110011110001100111100" &
         "0101100110100000010110110111010000011100000010110000010010111110001010" &
         "0";
UNLOAD(0) <= "0101100110100100000100110100111001110111011101010110100111100000001111" &
             "1100000001011111010011000001001110010110101011110100111101011111000000" &
             "1110011101110101101111011001000101000100001001111011111111110010010001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6664800
wait for 0 ns;
PI <= "010000001100010000010001110011111110110";
wait for 100 ns; -- 6664900
XPCT <= "1101000001000001000001110010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6664940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6665000
wait for 0 ns; pulse_CK(PI);  -- 6665100

pattern := 310; -- 6665100
LOAD0 <= "0010101001001010110000000000111101011000101111001000001110001111011110" &
         "1010000101001001111010011110100000011100100111000101010010001110110110" &
         "1110100010100101001110011100101101110011001011011101001111001001101010" &
         "0";
UNLOAD(0) <= "1001110010010000000101010100101110010100001100100100000001001111110000" &
             "1010100001110011111000010001000010111001101000011100011010000100011101" &
             "0100000110101000110110000000000000001100001000101001111011110010100000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6686300
wait for 0 ns;
PI <= "010100000011100000101011011011000110110";
wait for 100 ns; -- 6686400
XPCT <= "0001101110010010100110111100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6686440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6686500
wait for 0 ns; pulse_CK(PI);  -- 6686600

pattern := 311; -- 6686600
LOAD0 <= "1001111111001110011110011010010000111110111110011000100110000010001011" &
         "0011000011110100000001011000010000100110111111000111001101010110110001" &
         "0000100011100100101101111010101111100011101111101100011111100000010111" &
         "0";
UNLOAD(0) <= "1111101111010110000100110101110101110001000110100100101011001100011000" &
             "1101001111110111011001101010000011111000011111011100110111001110110110" &
             "1110001111101111001100110001100111000101000011101001111100001011101000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6707800
wait for 0 ns;
PI <= "010010010111011001011010101110111101000";
wait for 100 ns; -- 6707900
XPCT <= "1101011101100101100100010000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6707940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6708000
wait for 0 ns; pulse_CK(PI);  -- 6708100

pattern := 312; -- 6708100
LOAD0 <= "0100011001011100111111110100101000000111100010010010101110101101100011" &
         "0011000101111001001110011001111101110111101011001100100000111110000110" &
         "1010111110110110001011010010011101100001101010110011010101001111100010" &
         "0";
UNLOAD(0) <= "1010111110111010001100110111000010111110001100110110110110000101100110" &
             "1001010001001100110001011010010000100110100111011000011001010110010000" &
             "0100100111111100001011010101111110110010000001111101111100100101110101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6729300
wait for 0 ns;
PI <= "010010100000001110001010101001011101110";
wait for 100 ns; -- 6729400
XPCT <= "0101110000101000110100101000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6729440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6729500
wait for 0 ns; pulse_CK(PI);  -- 6729600

pattern := 313; -- 6729600
LOAD0 <= "1010101000011001000110100100101100010111000110010010001011001001100100" &
         "1010010110001000100110010101000100000011111110111111100111000100011111" &
         "1110110011001000111100010010001001000101100110100100111000010110101110" &
         "0";
UNLOAD(0) <= "0011011000111100111101010100110010100111001100110100111110001001101010" &
             "1100001111111011010110001011101111110011101010010000100000110110100110" &
             "1110011110111110101011000001001111110000000010100011010100001110001110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6750800
wait for 0 ns;
PI <= "010001000001110010100100011001100111010";
wait for 100 ns; -- 6750900
XPCT <= "0101100111000010011100111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6750940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6751000
wait for 0 ns; pulse_CK(PI);  -- 6751100

pattern := 314; -- 6751100
LOAD0 <= "0011001110010110100000101000100100001010010111011111001111001011111001" &
         "0110001110001001011001010101110100111010010001011001010001111010011011" &
         "1110010000100010111011110001001111100100010010101101011100100101111101" &
         "1";
UNLOAD(0) <= "1011101001111101000000110101101110010111001110010110110011101010101000" &
             "1011010110010110110010100101010100000011110111111100100111001100011100" &
             "0011011111011000011010001001000001010001000010110101100101010011101110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6772300
wait for 0 ns;
PI <= "010001000110011101011011010110010110100";
wait for 100 ns; -- 6772400
XPCT <= "1001001001101101100111010110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6772440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6772500
wait for 0 ns; pulse_CK(PI);  -- 6772600

pattern := 315; -- 6772600
LOAD0 <= "0001001001110001001000000010100000001011110111010001101001101111100101" &
         "1000001010100110000111100001001101110101011010101100010000101000010100" &
         "1000011110101110011100100100111101110011001110000110110111011111011110" &
         "1";
UNLOAD(0) <= "0111001111010010100100110001100110001010001101011011001111001010110101" &
             "1010000100010101101001010101110100111110001001010101010001110110111010" &
             "1111010101100010011111010001001101100101010010101101010111101111111101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6793800
wait for 0 ns;
PI <= "010101011010100001000010100100101011100";
wait for 100 ns; -- 6793900
XPCT <= "1000001010010100000110010100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6793940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6794000
wait for 0 ns; pulse_CK(PI);  -- 6794100

pattern := 316; -- 6794100
LOAD0 <= "0001001010111011000110000101101101100110110101010011110110100001011110" &
         "1110111111000000011110010111000010010000111000010100101000010011010011" &
         "1110111111010100101110111100011010111011010010001010111101111011111110" &
         "1";
UNLOAD(0) <= "0100001010110101001100110010111010101011000101110001100010101101001100" &
             "1000010010100010000011001011001110110101010011111100110101101100010100" &
             "1000111111101100110010011000110110010110000000110111100100011010110010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6815300
wait for 0 ns;
PI <= "011110001101111001101111101011010111010";
wait for 100 ns; -- 6815400
XPCT <= "0101010111110110101100100000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6815440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6815500
wait for 0 ns; pulse_CK(PI);  -- 6815600

pattern := 317; -- 6815600
LOAD0 <= "0001010010011100101101010100011011101000001100101100111100011100110010" &
         "0101010001100001100011101100011000101011100110001110101000111000100110" &
         "0001111111010110001001000111111011101111010000101100110111111110111011" &
         "1";
UNLOAD(0) <= "1110001011111111100000110100100111001110101111110111100010001010011110" &
             "0011111111010000100100101001000011110100011101011100110100011111110000" &
             "1010011111010110001110000001011110101100010010001010100101011100111111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6836800
wait for 0 ns;
PI <= "001101001000010100010100000111101111100";
wait for 100 ns; -- 6836900
XPCT <= "0111100001011001001011101110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6836940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6837000
wait for 0 ns; pulse_CK(PI);  -- 6837100

pattern := 318; -- 6837100
LOAD0 <= "1000000101110001111001100001010110011110001100001100111111010101010110" &
         "0101110001111100000110101001001000001111010011011000101010101110010100" &
         "1101111011101101100111010000101000001010000101110111011011010100010110" &
         "0";
UNLOAD(0) <= "0000010010010000101000110100011011001000010110101100100110000111011001" &
             "1110011001111011101001100010001011101011001111000100100001110100000100" &
             "1000011111011100101011000000110000011100010010111101011110110010111111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6858300
wait for 0 ns;
PI <= "011110000111010111010110010101110001100";
wait for 100 ns; -- 6858400
XPCT <= "1000111101011101011011111110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6858440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6858500
wait for 0 ns; pulse_CK(PI);  -- 6858600

pattern := 319; -- 6858600
LOAD0 <= "1011010110100111110011111101000101011111101101010101010001100101010001" &
         "0101100000111101101001001100010100110100110111000111010000101011101110" &
         "0011111011101100011000110110001000101111011011001011010100011010010011" &
         "0";
UNLOAD(0) <= "1101100110000101000001110100011110010111010110100110101010111100011110" &
             "1111111101000110111100100001011001100110000111010100110110101110010110" &
             "1100101110101101000011111001101100010101010001110110101001011010110100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6879800
wait for 0 ns;
PI <= "011000000101111100101001101100000001110";
wait for 100 ns; -- 6879900
XPCT <= "1000000111101010100101000010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6879940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6880000
wait for 0 ns; pulse_CK(PI);  -- 6880100

pattern := 320; -- 6880100
LOAD0 <= "0010000110101011000010001111000011011101010011001110000000110001010111" &
         "0110010000101111110001000100101101010001011111000101110010001101001110" &
         "1011101101010000000010011010101110000000101111101000111111011011111001" &
         "0";
UNLOAD(0) <= "1001110111000111010100110101010101110111100100110101101011101100011001" &
             "1101101111101111101000011010000111110000011111000101110001100111101110" &
             "1110101110101110111010101001000110010101011001111011000110010111110010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6901300
wait for 0 ns;
PI <= "000000001111001100000010001101101100000";
wait for 100 ns; -- 6901400
XPCT <= "1001101100101000000001101010011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6901440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6901500
wait for 0 ns; pulse_CK(PI);  -- 6901600

pattern := 321; -- 6901600
LOAD0 <= "0111011001111011000111101000011011101011101010010110110101010101011100" &
         "1101110100010000010000100011001000100001100111110001101110000001100110" &
         "0000111001100110100010011001011010101011111110010011011011101111010100" &
         "0";
UNLOAD(0) <= "0001000001111111000100110111001001111101101101100010110011000011011010" &
             "1101110010100011010001010110101111011001000111000001100111001101001101" &
             "1110101111011000100110110001100101000000010011110001101110011111011111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6922800
wait for 0 ns;
PI <= "010100000011101010010001111110110101100";
wait for 100 ns; -- 6922900
XPCT <= "0101101110110001010001001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6922940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6923000
wait for 0 ns; pulse_CK(PI);  -- 6923100

pattern := 322; -- 6923100
LOAD0 <= "1001110100110110011111011011110100101101000000011100011100110010111110" &
         "0111111111110010000101110110000100010010001001110000011001100001101010" &
         "0010000100101110011011110100000011001001001110101000100011001101110110" &
         "1";
UNLOAD(0) <= "1100111001010111010101010101011001100011111110110110111001011010111000" &
             "0101110100010100001001111001001011100000010110111101100110001101000110" &
             "0100001101100100000110010000011110100001111000000010111011001111010100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6944300
wait for 0 ns;
PI <= "011110000000010110101101001110001100110";
wait for 100 ns; -- 6944400
XPCT <= "1101010001011010111101000010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6944440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6944500
wait for 0 ns; pulse_CK(PI);  -- 6944600

pattern := 323; -- 6944600
LOAD0 <= "0101101100000101010100101001110111111101000101010010111101011101110011" &
         "1111010110111110011000011110100000000111010010010001011001100000101000" &
         "1110010010111100110101111000101111000010101001110101101101000001100011" &
         "1";
UNLOAD(0) <= "1110110100110110011000100010100110100101001110111100100010101111111000" &
             "1000110111111011100001110000000111110010000101110100110101100101101000" &
             "1110001100101110111011101011010101010101001010101000001111001010011110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6965800
wait for 0 ns;
PI <= "010010000110010001011011010011011110010";
wait for 100 ns; -- 6965900
XPCT <= "1101011001000101100110110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6965940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6966000
wait for 0 ns; pulse_CK(PI);  -- 6966100

pattern := 324; -- 6966100
LOAD0 <= "0000000011000000100011011101011110011000010100110110100011111111100101" &
         "0011100101101011010000111000001010001110010100010111110111100000001001" &
         "0010001010110100110100111001110100001010101101100111000010101110001111" &
         "1";
UNLOAD(0) <= "1111101100000001010110010001110101110101011100110110111000111001110101" &
             "0000010101100110101000010000010001100110001110011101010001100100101010" &
             "1010100110111110011111011000101100000001101011100001011101001011101110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 6987300
wait for 0 ns;
PI <= "011100000001011000000101010000110100010";
wait for 100 ns; -- 6987400
XPCT <= "0001000101110000001101010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 6987440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 6987500
wait for 0 ns; pulse_CK(PI);  -- 6987600

pattern := 325; -- 6987600
LOAD0 <= "1000101100000100101011111000101110011010100110001110101111001110010000" &
         "0001001100001000110001110001011111100011111101110010101010010100000100" &
         "0000101010111100100110010001110000001010101100001100101011001000101010" &
         "0";
UNLOAD(0) <= "1111100010000100000001110001011100110001001100110110111000011000101010" &
             "1101100111111100101001010000001011101010000101011100110111101100001010" &
             "0010001111111100111100000000100100000001000001110111111001000111100011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7008800
wait for 0 ns;
PI <= "010110011001011000101000101101111101100";
wait for 100 ns; -- 7008900
XPCT <= "0001110101110010100101111010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7008940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7009000
wait for 0 ns; pulse_CK(PI);  -- 7009100

pattern := 326; -- 7009100
LOAD0 <= "0011101000100101101110110000111111100111000011111000001001000001110101" &
         "1010001101110111001001110110110101001001110101011000100001101101101001" &
         "0000100010000011111100010100000101100100111010010010001011000001100100" &
         "0";
UNLOAD(0) <= "1111101100100100101101110000110100111110001110001110110110101011111000" &
             "1101001110011110110001111000001111100011100101111000101010010100000101" &
             "1100001110111100001110001100100010001011000011001111100001000110101010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7030300
wait for 0 ns;
PI <= "000000000101111001110101011111101000000";
wait for 100 ns; -- 7030400
XPCT <= "0100100111100111001100101000011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7030440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7030500
wait for 0 ns; pulse_CK(PI);  -- 7030600

pattern := 327; -- 7030600
LOAD0 <= "0001110101011100000111011100010100110001110010101111101111101010110010" &
         "1110010001110101001001110001111100010110110010111001101100110000011100" &
         "0000110010011000101011110011100100101110001111111100001111110000101000" &
         "1";
UNLOAD(0) <= "1110101001010001000000110110101101100111011100110110110011001011111100" &
             "1101101101101110111001000000010101101100011101011100100101100101001000" &
             "1100101110001001110010100001010101010001010010100011101111001110001110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7051800
wait for 0 ns;
PI <= "001100000110110001110001010010111110000";
wait for 100 ns; -- 7051900
XPCT <= "1111001011010111000001010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7051940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7052000
wait for 0 ns; pulse_CK(PI);  -- 7052100

pattern := 328; -- 7052100
LOAD0 <= "1111110001000010110010100101101101110000000100011100010001000001111000" &
         "0110110011010011001001011101100010000001011010101111111010110001110000" &
         "0100010111011100011000011111100101000000110000001011110000111001001001" &
         "1";
UNLOAD(0) <= "1010110100010000000101110001001110110001101110101111100010101001110100" &
             "0100011101101101101001111001011101110110010111111101100000110100011100" &
             "0000100111010000101011011000110110110101001011101101111101011011001001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7073300
wait for 0 ns;
PI <= "000010000001011111110111001011011010110";
wait for 100 ns; -- 7073400
XPCT <= "0010110101101111011101111010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7073440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7073500
wait for 0 ns; pulse_CK(PI);  -- 7073600

pattern := 329; -- 7073600
LOAD0 <= "1110101011101101010001001000011010111100111100011011110101100101010011" &
         "0101011010010111001110110011011110111000010011111011100011000110010111" &
         "1010100111110011101110101100010011100011010011011010011111111110000100" &
         "1";
UNLOAD(0) <= "1010110001100110010000010101101111000001011110001000011001101111110100" &
             "1011110101010011100001100010000011100100001110100101110000111100110110" &
             "1000000111011110111000001000010101010001110001001011110010010111100000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7094800
wait for 0 ns;
PI <= "010000000001001110010000010111100101000";
wait for 100 ns; -- 7094900
XPCT <= "0001000100101001010010100100001011011001";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7094940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7095000
wait for 0 ns; pulse_CK(PI);  -- 7095100

pattern := 330; -- 7095100
LOAD0 <= "1111101001101011011000010000111111001000101100100001101011010100110011" &
         "0000010110010101010111111110110100011011111001011000101100010110011111" &
         "1000010111111010110010000000100010100011011011001011011000100010110011" &
         "0";
UNLOAD(0) <= "1110101010000001000100010101011000010101101100010111100011001010111010" &
             "1011011100000011011001011001001111111000001110110101110011000110010100" &
             "1110101111111001000010100001010111010101011001111011111111010111100111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7116300
wait for 0 ns;
PI <= "000110000000000010011110100101111100000";
wait for 100 ns; -- 7116400
XPCT <= "0001110000010001111110101100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7116440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7116500
wait for 0 ns; pulse_CK(PI);  -- 7116600

pattern := 331; -- 7116600
LOAD0 <= "0011110001101101010010010011111001100010101010101110000100000101101011" &
         "1010111100001110010111110101010100010011100110101010101110100111001101" &
         "0100111010101010100010100100011110001011000001101010001001111101110110" &
         "1";
UNLOAD(0) <= "1110101000110111000000010110100101100001011100100110101011111011111010" &
             "1000110100101011010100001000010101111010001100011100100000011110011110" &
             "0100100111111000111110001001110110100101010011000011111011001010111010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7137800
wait for 0 ns;
PI <= "000101011001111010001011100010011001100";
wait for 100 ns; -- 7137900
XPCT <= "0000000111110000110101000010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7137940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7138000
wait for 0 ns; pulse_CK(PI);  -- 7138100

pattern := 332; -- 7138100
LOAD0 <= "1011001110011011111001000010011111100001011100101000101100010011010010" &
         "0101011111010000001111100110001000011101110100010001001011001101000011" &
         "1011111110010100110100011110110110001011001110000111111100100101000000" &
         "1";
UNLOAD(0) <= "1111010001000101000100110110110001000010000100100110000101101011101000" &
             "0111111110101111111101001011000111010011011111111100100010100111101100" &
             "0000111110101010000110001100001110001101000011111011101010110100011101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7159300
wait for 0 ns;
PI <= "000111011001101011100010100111100000100";
wait for 100 ns; -- 7159400
XPCT <= "0000110110110110010010101100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7159440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7159500
wait for 0 ns; pulse_CK(PI);  -- 7159600

pattern := 333; -- 7159600
LOAD0 <= "0011001000111011100101000011111101111100111111111010011111110110101111" &
         "1001110110101110010110101110000100000011110101010100101000110000000101" &
         "0101101010000000110101001110101101010010101101011111000001111111101010" &
         "1";
UNLOAD(0) <= "0000001101010111111100110011001101100001001110001110101111001100011110" &
             "1001011111010010011000100000011001011101010101011101100011001101000010" &
             "1010011110010100011010000101110100011101001000110110001101101101100101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7180800
wait for 0 ns;
PI <= "010001011001111001001100001101010111110";
wait for 100 ns; -- 7180900
XPCT <= "0101100111100100101110111100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7180940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7181000
wait for 0 ns; pulse_CK(PI);  -- 7181100

pattern := 334; -- 7181100
LOAD0 <= "0101101001011010000110101011101001001110111110010101101111011000101101" &
         "0110010111111001010100111001001001000011010011111100101100100011011001" &
         "0110010110000001011111111100100100000011010000001110011011110001101001" &
         "1";
UNLOAD(0) <= "1001101001010111110011110110110101111100000101111110011111011010101100" &
             "0001111110100110101100001000000111000111010101011100100100111100100111" &
             "1100111111001010110111000001101111000000000011011111101011111100101011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7202300
wait for 0 ns;
PI <= "000010000011000010110011001001011111100";
wait for 100 ns; -- 7202400
XPCT <= "0111011100000011010101110010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7202440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7202500
wait for 0 ns; pulse_CK(PI);  -- 7202600

pattern := 335; -- 7202600
LOAD0 <= "1001011001110100110100010010000100110010001001110001010100001010000101" &
         "0110100010011011011110100011000100100111110010101110001011110110011001" &
         "0110010010111010011101110010101000001101111010101001000100011010000001" &
         "0";
UNLOAD(0) <= "1111101000010110000100010010101011000111101100110101100010011111000001" &
             "1011010101110000001101011001011001100010001110111100110100101111111000" &
             "0110000111010011011111010001100110000101010010011110010001011010101001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7223800
wait for 0 ns;
PI <= "011000000100010011010010001011101010100";
wait for 100 ns; -- 7223900
XPCT <= "1100000001000101010010110100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7223940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7224000
wait for 0 ns; pulse_CK(PI);  -- 7224100

pattern := 336; -- 7224100
LOAD0 <= "0001010010011000010100011111000000011101000010000100100011101111010011" &
         "1110100011001110100100110100101011101001100111010111001001110100001111" &
         "0010111000100100010100101001001111100001110001111001011111100101100111" &
         "0";
UNLOAD(0) <= "1001111000010000010100110010001100110011010100110101111010101101001101" &
             "1000100100011110111001000011000111100110001111101100100111110110011010" &
             "1010001110111000111111001000100100000001111000101000000110010010000000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7245300
wait for 0 ns;
PI <= "011011010100011011011100111100001110110";
wait for 100 ns; -- 7245400
XPCT <= "1101010001100101111111000110010011010100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7245440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7245500
wait for 0 ns; pulse_CK(PI);  -- 7245600

pattern := 337; -- 7245600
LOAD0 <= "0101101100011001000001101001000000001011111110000010010000100001000111" &
         "0110101111100110110100111111001100000001111010101100111111110111110101" &
         "0011010011101111110000100111101001101110110111001100010011101010010100" &
         "0";
UNLOAD(0) <= "0111010010011100010010110111010010011101011100000100111010001111111101" &
             "1010101001001110111001010100111001101101101111011001111001111100101110" &
             "1111111100110110011000000101000100010000110011101001010101100101001111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7266800
wait for 0 ns;
PI <= "010100011000110011101010110111111010010";
wait for 100 ns; -- 7266900
XPCT <= "1000000011010110110010110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7266940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7267000
wait for 0 ns; pulse_CK(PI);  -- 7267100

pattern := 338; -- 7267100
LOAD0 <= "0110101111101000001001101110001100100001111010101111001000100001110010" &
         "0000001001001010011101101111000011100000100001010100010100111111011010" &
         "1011010100001111010101110111011010110000110001010011001010010110010101" &
         "0";
UNLOAD(0) <= "0010101100111101000110010000000010001011100100100010110010100011101101" &
             "1010100111100101110010011011001111000101110010101100001111111111010101" &
             "0010111110100101111110001000110010001010110001011101010110101000110000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7288300
wait for 0 ns;
PI <= "011010101100000001011001111001010000010";
wait for 100 ns; -- 7288400
XPCT <= "0000010000000101100111100110011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7288440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7288500
wait for 0 ns; pulse_CK(PI);  -- 7288600

pattern := 339; -- 7288600
LOAD0 <= "0100001100000010010100000010001010001110001010111110100100111100111110" &
         "0101001111101001011111110011000110101111111110101011001100010110010110" &
         "1111011010101001001001000101100011001011010011011110101010011101011011" &
         "1";
UNLOAD(0) <= "0001101111001100001110010110000100000001000110101101111011100010111110" &
             "1110000001010000011001111101010000100100101000011100110001111111111011" &
             "0110011100001111010101101001000010000000010001000011000111011010010101" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7309800
wait for 0 ns;
PI <= "010001000001000111101000101010001011010";
wait for 100 ns; -- 7309900
XPCT <= "0100100100001110110111011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7309940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7310000
wait for 0 ns; pulse_CK(PI);  -- 7310100

pattern := 340; -- 7310100
LOAD0 <= "0001000101001011010111010111010000110101110011000111111110000001011011" &
         "1011110001111111111110100111011100000001101001100100011110110001111010" &
         "1011010010110001110000011110011110010111011001110000101101100100101100" &
         "0";
UNLOAD(0) <= "0111001100100110010100000011010010001110000110011100100110101001011110" &
             "1011001111110111010011100111000111101111101110100101101101011010110100" &
             "0011011110111011001101001000100001001111010101101110100100010011010011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7331300
wait for 0 ns;
PI <= "010101101011111110000110111011101001000";
wait for 100 ns; -- 7331400
XPCT <= "1100101111111000011101101010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7331440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7331500
wait for 0 ns; pulse_CK(PI);  -- 7331600

pattern := 341; -- 7331600
LOAD0 <= "0110011001000110011111001100000101010011101010000000100110100010101000" &
         "0001101110110001010101000110001111000100111111110110110101001000000111" &
         "1011101010100101011111010111011101101111000000010011100100110110111000" &
         "1";
UNLOAD(0) <= "0001000100101111010000110110001010110101001101100011100110000011011000" &
             "1101110011101111100000001011011101000001011001110100100011111101011000" &
             "0110111111111001011110010101000110000100010011100001011110101110001001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7352800
wait for 0 ns;
PI <= "001101001011110001000100010110111111100";
wait for 100 ns; -- 7352900
XPCT <= "1111101111010100001100001000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7352940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7353000
wait for 0 ns; pulse_CK(PI);  -- 7353100

pattern := 342; -- 7353100
LOAD0 <= "0000100111000000101000001010101001110111101110101111000000000111100010" &
         "0111010011000110000011011101000010110011000011010000000010100110010101" &
         "0100101010011011110100010001010000001001111100111101100011100100101001" &
         "1";
UNLOAD(0) <= "0000011001100110011001010100001101010011000110100100101111000101100100" &
             "1011100110110101100101111100011100000100111110111100110001000100000110" &
             "0110001110101101111111010001011111101110000010010011110101110000011000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7374300
wait for 0 ns;
PI <= "000010101011000101011001101010101001010";
wait for 100 ns; -- 7374400
XPCT <= "0000111100001101100011001110011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7374440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7374500
wait for 0 ns; pulse_CK(PI);  -- 7374600

pattern := 343; -- 7374600
LOAD0 <= "1001000011001100110011000001010000111000110010101001100101011010001101" &
         "1000100101101010111110011010100111111010101011011110100011110001001010" &
         "0010100001000000011011111001010111000010011100111001010000111101001010" &
         "0";
UNLOAD(0) <= "0110100110000100101110110010110011110111111110001111111010100011001110" &
             "1001011001000110011010111101010000110111000011010000110011101110010110" &
             "1100101111011001111000011101010011011001111010101100110101101000101101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7395800
wait for 0 ns;
PI <= "010010001001110111111010101110001110110";
wait for 100 ns; -- 7395900
XPCT <= "1001010111001111110100000000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7395940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7396000
wait for 0 ns; pulse_CK(PI);  -- 7396100

pattern := 344; -- 7396100
LOAD0 <= "0111000000101011110001011000000111100111110000011001010100010011011011" &
         "1111110100100110100110101110001010010000100011100000011101010011101011" &
         "0110010000111110001100011111101110010010011001110111100100111110101000" &
         "1";
UNLOAD(0) <= "1111000010101000100100110100000010111000001100000101101110001111001100" &
             "1101101101010111100010001000100111111110110011010000100111110101101011" &
             "1110001101001010111101000101000110000110010000101001111111110010000100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7417300
wait for 0 ns;
PI <= "010111011101110000000001111011001010010";
wait for 100 ns; -- 7417400
XPCT <= "1000110111010000000110101100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7417440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7417500
wait for 0 ns; pulse_CK(PI);  -- 7417600

pattern := 345; -- 7417600
LOAD0 <= "0001010010011100011101001001110010100010110010001101011111111000110101" &
         "1001010001000100010001011011001011010100101101010011011000100110100000" &
         "1100101100010001011100000010110000001000011000110010010100000010110111" &
         "0";
UNLOAD(0) <= "0000000000001111110110010000001101100111101100011001101111100111011011" &
             "1101110110101110101000011010001011010000011010101100110001011111101011" &
             "0110111100111110100000101000110110010111011011110111100110111000001001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7438800
wait for 0 ns;
PI <= "010101100110100001101110000010110001100";
wait for 100 ns; -- 7438900
XPCT <= "1100101010010110101111011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7438940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7439000
wait for 0 ns; pulse_CK(PI);  -- 7439100

pattern := 346; -- 7439100
LOAD0 <= "0011100001110111011001000110010110100101001001100110101111000000101010" &
         "0110001011111000111010000111110000001000111100001101000011000110010010" &
         "0000001001011111101101000000111111001001011011010000101110010111110000" &
         "0";
UNLOAD(0) <= "0010010010111100001011110101100010100010001100000101000110011100110100" &
             "0100011011100000010001011001011001010100111101011000011100100110000001" &
             "1101101100011001111100110001110010001101010010110011111111000011011101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7460300
wait for 0 ns;
PI <= "001101110100101010010100110111001111000";
wait for 100 ns; -- 7460400
XPCT <= "1011100010110001011111101110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7460440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7460500
wait for 0 ns; pulse_CK(PI);  -- 7460600

pattern := 347; -- 7460600
LOAD0 <= "0111010000011011011101001101111011000000101011110000011010110010010100" &
         "1110001010001110101010000111011111111100001010101101000010110010111010" &
         "0100011101111010110010101100000011111011111111001101111010100110101010" &
         "1";
UNLOAD(0) <= "0101100000110011011010110111001110100101010111100110100111100011101010" &
             "1000001001110110010010100111110000001000111101001001100011000110110000" &
             "1001001101011111001101101001100101001100011011110000001100011111011000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7481800
wait for 0 ns;
PI <= "000010011110111011010101001101100110000";
wait for 100 ns; -- 7481900
XPCT <= "0111011011100101011010110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7481940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7482000
wait for 0 ns; pulse_CK(PI);  -- 7482100

pattern := 348; -- 7482100
LOAD0 <= "0101010101010011110101101011001001010100000010101011001100011111100001" &
         "1011110101010001001000111000100001110100111110011011001110011001100010" &
         "1100111010001100100000010100000000111001111000110101001011111101110101" &
         "1";
UNLOAD(0) <= "0101010001111111011000010101101001100000110111010110111011100000011100" &
             "1000000000000011100010111111011100111100010010101101100111111110011010" &
             "1000111101111000111000011000000010011010111011111100011100101111001010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7503300
wait for 0 ns;
PI <= "010100101100110110111100100011111001110";
wait for 100 ns; -- 7503400
XPCT <= "0100100011011011111110101100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7503440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7503500
wait for 0 ns; pulse_CK(PI);  -- 7503600

pattern := 349; -- 7503600
LOAD0 <= "1000100011110111110011001011110111011110101000001010100100100110110111" &
         "0111101010110001010011010000001011100010000001010001110001110100110110" &
         "0101000100110101010100000010111100010000010001010001011111101000011100" &
         "1";
UNLOAD(0) <= "0110010100110111110001010011010011110100010100101111011100111001100000" &
             "0100110101010101100000010000100010110000111110010100001010011101000010" &
             "0000011110001100001010001101010000111001010010100101000001110011011101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7524800
wait for 0 ns;
PI <= "011101110100100110011000111011000011110";
wait for 100 ns; -- 7524900
XPCT <= "1000100010011001110100111000111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7524940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7525000
wait for 0 ns; pulse_CK(PI);  -- 7525100

pattern := 350; -- 7525100
LOAD0 <= "1101001010000010001011101001100110101100011000011101000010001010011011" &
         "1101101100011000101101000010001110100001010001101010101011100100100000" &
         "1000100001110001000111010100000011001111011101100111000100001011111001" &
         "0";
UNLOAD(0) <= "1010100110010011100100110111110111011110110100000000101110000010111011" &
             "1010000000010010011011011000001011100010011001010001110101110100110111" &
             "1101001101110111010100000101110110000101010001100001101111101011010110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7546300
wait for 0 ns;
PI <= "010010000000010001100000110101010100100";
wait for 100 ns; -- 7546400
XPCT <= "1001110001000110000101111010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7546440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7546500
wait for 0 ns; pulse_CK(PI);  -- 7546600

pattern := 351; -- 7546600
LOAD0 <= "1011111101000101000111110101101010111101010110011111000001001111010011" &
         "0011100111001111111110010110000100110101101110001110001010000000101101" &
         "0011101011110100001010111111110010101100110110111000101011001111111100" &
         "1";
UNLOAD(0) <= "1101101010000110001101010000101110100101000100111101001010001110011101" &
             "0100101110010100111100010010001111100100000100101100100011101100100010" &
             "1100000101110011100001000001000101010101011011100111010100000010011001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7567800
wait for 0 ns;
PI <= "011111011000111111010110010001101100100";
wait for 100 ns; -- 7567900
XPCT <= "0101010011111101011101100010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7567940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7568000
wait for 0 ns; pulse_CK(PI);  -- 7568100

pattern := 352; -- 7568100
LOAD0 <= "1000110111000110100111110001011111110101100000101101101100111111001100" &
         "1001110110110010100110000101011000110000101101010110011110000101101001" &
         "0111100110110010110100100101111111000000101011110101100000001100101110" &
         "0";
UNLOAD(0) <= "1011111101100001000000110100111000011101000100111101110011001001011100" &
             "1010100101001111100000000010000111110101010111010100100011000100001101" &
             "1010101110111100001110000001100000001010010010111001110110000100111101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7589300
wait for 0 ns;
PI <= "001010101110011000110001100110010110010";
wait for 100 ns; -- 7589400
XPCT <= "0111011001100011000101000010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7589440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7589500
wait for 0 ns; pulse_CK(PI);  -- 7589600

pattern := 353; -- 7589600
LOAD0 <= "1001101100010111110111111000111010001110001010100101101001010001111100" &
         "1001010110111111001001010000111100010111001111011111110001010100010100" &
         "1001111101101000101101100110110101111010100100100100000011011111010101" &
         "1";
UNLOAD(0) <= "1100010111100010000101110000001101111101011110101111111100011010001000" &
             "0000110000111010110100101001001011110001001101011100010110000101101011" &
             "0110000110111010111010010100111111010010000011100101001001000100001011" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7610800
wait for 0 ns;
PI <= "001110010010011110100010100110011010110";
wait for 100 ns; -- 7610900
XPCT <= "0110011001111010010101010010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7610940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7611000
wait for 0 ns; pulse_CK(PI);  -- 7611100

pattern := 354; -- 7611100
LOAD0 <= "0101101110110100101110000000101110000011110010011101101001100101110000" &
         "0000100100111111011010100001110101110011000101100101110101111110010001" &
         "0011000001111100100110100010000000100100000101000111001111110101001000" &
         "0";
UNLOAD(0) <= "1011101101110111100101110101101010001010001010101111110000110101111000" &
             "0010010110101011110001110101101111010011000111010110110101010100110101" &
             "1100111000101010101001111011100100111010000100110101111001010111010101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7632300
wait for 0 ns;
PI <= "001110100011101110110000000100100011100";
wait for 100 ns; -- 7632400
XPCT <= "0110011110111011010101010010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7632440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7632500
wait for 0 ns; pulse_CK(PI);  -- 7632600

pattern := 355; -- 7632600
LOAD0 <= "0100001010010001011001100110111100000011001110100000101010000010000100" &
         "1110000010111110101001000101110111001011110100100011111010110101011100" &
         "1111001111110110100011100110001100011010000100011111000111001010001001" &
         "1";
UNLOAD(0) <= "0001101110010000101100010001111100000011001110011011101010100110011000" &
             "1111100100100110011010101010110101110011010100110000110001110110010011" &
             "0110101101111100001110011101000011000100000001110101000100111101000100" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7653800
wait for 0 ns;
PI <= "000110001110010010100001111000000010000";
wait for 100 ns; -- 7653900
XPCT <= "0010011001010010010110010100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7653940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7654000
wait for 0 ns; pulse_CK(PI);  -- 7654100

pattern := 356; -- 7654100
LOAD0 <= "1011001101001000111110010110011001001110100011010110000110101010000110" &
         "1111110110111110010111001111000010000001010010110110001011000000101111" &
         "1110110010111111111000101011011001010111001101110101000011001100100001" &
         "0";
UNLOAD(0) <= "0001001010010100011100010011101100010011000110110110101010000010001010" &
             "1010000010100011111001100111100110011011100100101101111111101101111011" &
             "1000101111110010110001010000000100011111000000101101111100000011100001" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7675300
wait for 0 ns;
PI <= "001011100011010011100011000101011100010";
wait for 100 ns; -- 7675400
XPCT <= "0101011101000110010101100010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7675440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7675500
wait for 0 ns; pulse_CK(PI);  -- 7675600

pattern := 357; -- 7675600
LOAD0 <= "1011011010001011110110011100011000111001100100101111101101011010011011" &
         "0101100000110000001100110101100001010100110000000100100101000101001011" &
         "0101100011110001110010000111011101011110000101111001001010100100000001" &
         "1";
UNLOAD(0) <= "1001001001011100100110111110001001101110100011010110001111101011110110" &
             "0001110110101110101111101101000010001101000011111000001111001000101110" &
             "1011110010111111111100011100001010000110011111100101101001000000001111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7696800
wait for 0 ns;
PI <= "001111111111100011100101011010111100010";
wait for 100 ns; -- 7696900
XPCT <= "0101111110010110011001011010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7696940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7697000
wait for 0 ns; pulse_CK(PI);  -- 7697100

pattern := 358; -- 7697100
LOAD0 <= "0011110101110110010111011111000111111111001011000000101111011010110100" &
         "1000111110111010010111100001100011100111010110110001011000000100001111" &
         "1101010010010010001100101110000111110110010100100101110111100101011000" &
         "1";
UNLOAD(0) <= "1010011000011111100000111110001000011001100000100110101101011001110111" &
             "1111100010111100011100011111110000011100110001001110100001001001001011" &
             "0000000011110001111010110100011110011110010101100000101000101000100111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7718300
wait for 0 ns;
PI <= "001001100100001011100001011001111000010";
wait for 100 ns; -- 7718400
XPCT <= "1100000000100110010100110000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7718440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7718500
wait for 0 ns; pulse_CK(PI);  -- 7718600

pattern := 359; -- 7718600
LOAD0 <= "0101101111000010111101010011001110010110000011000001100100000010100001" &
         "1101100001000110001010111101110101001011000000110110001101010010001000" &
         "0111001000011011001010101000001110011101010001100001001111010100101110" &
         "1";
UNLOAD(0) <= "0001110000010110000101111111001111011111000111100110101111011001110100" &
             "0010111110111110011111110001110000101111000111111100011100000100001111" &
             "1001010110011000101110100101000101100111010000110001111101101101010010" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7739800
wait for 0 ns;
PI <= "000010110010011111111011001110011000000";
wait for 100 ns; -- 7739900
XPCT <= "0100011001101111110110010100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7739940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7740000
wait for 0 ns; pulse_CK(PI);  -- 7740100

pattern := 360; -- 7740100
LOAD0 <= "0101001101001010100010010000110101101000001000011110011101100111000111" &
         "0011100011110101101001100000110101000001110010001100011010111010010000" &
         "1111011010011100010110110111100100000111011010010001110000100101101000" &
         "0";
UNLOAD(0) <= "0110101000010110100101010110000100010110011101000110101100100011110101" &
             "0110100001101110101010000101110101001111001000110010001001011010101010" &
             "0010101110011011100010011101011100011100010111100001101111010110001110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7761300
wait for 0 ns;
PI <= "011100000100011010100010101011101100010";
wait for 100 ns; -- 7761400
XPCT <= "1001000001110010010101110010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7761440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7761500
wait for 0 ns; pulse_CK(PI);  -- 7761600

pattern := 361; -- 7761600
LOAD0 <= "0010101001100000110011010001010111100111101000010001111100111110101011" &
         "1101011110011111110111111110010011101001001000100111101001101001001011" &
         "0111010010000101001010110011100111100010110010100110110100100011111001" &
         "0";
UNLOAD(0) <= "1000101100000110000100010000111101100001000100111100101010101011001000" &
             "1000100111101110101000000010010101100000001110011100110111111110010010" &
             "1010101111011100110010101000110100010101010010100001011110001110001000" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7782800
wait for 0 ns;
PI <= "000000000100001000110001010100101011010";
wait for 100 ns; -- 7782900
XPCT <= "1010000000100011000000000000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7782940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7783000
wait for 0 ns; pulse_CK(PI);  -- 7783100

pattern := 362; -- 7783100
LOAD0 <= "0010101010011001111100011010011111110100101001110000111111100101100101" &
         "1011011010011001011100111000001001000100110010001101001010111011101111" &
         "0011010101101101110111110110000110001101100110011001000110100111010010" &
         "1";
UNLOAD(0) <= "1011101001100100010100110001011111000111110100010101110011001111101010" &
             "1010010100001111000001001010010001101000001101101101100001101101001000" &
             "1010101111011101101100000000100111000001111010110111001100000111011000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7804300
wait for 0 ns;
PI <= "011010000110000000001110010101110001000";
wait for 100 ns; -- 7804400
XPCT <= "0100011000000000101110100100011111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7804440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7804500
wait for 0 ns; pulse_CK(PI);  -- 7804600

pattern := 363; -- 7804600
LOAD0 <= "1100111111001001011100101011001011111001000100101011101000110000100011" &
         "1101010101111100011111111111100001101110010111100011111110100000000100" &
         "1101101100111001110111001111001111011010100011111011101110110111001110" &
         "0";
UNLOAD(0) <= "1011101011010101001000110111010111010101000100111110111011101100100010" &
             "0010010110011000001100011010011001100000000111011100000110111111001110" &
             "1010000100111101110111011000000110000001000000011001111100001011010010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7825800
wait for 0 ns;
PI <= "001010111100010010111101110111111100010";
wait for 100 ns; -- 7825900
XPCT <= "0101110001000011111010101100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7825940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7826000
wait for 0 ns; pulse_CK(PI);  -- 7826100

pattern := 364; -- 7826100
LOAD0 <= "1111011001110011000100010111011001100100110001001111100101000101111110" &
         "0001000011011100101100101010001001101101101011101001110100100000100101" &
         "1101101001000110001101101100000101100001101100100000101100110111010111" &
         "0";
UNLOAD(0) <= "1011111000011101000000000111000011011001011100100110111000110001010011" &
             "0110111101100000101111010111110000101010001110101111111010101100000111" &
             "0100101011111001111110001011001101001011110101110010111100110011100110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7847300
wait for 0 ns;
PI <= "000110111000110111101010000111000100000";
wait for 100 ns; -- 7847400
XPCT <= "0101010011011110110111110110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7847440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7847500
wait for 0 ns; pulse_CK(PI);  -- 7847600

pattern := 365; -- 7847600
LOAD0 <= "0011010100000011101011101111111101111010110101000100010010100011101010" &
         "0101001111100011011010010010000100100001011111101100111101110100101010" &
         "1010010101010100001000101100000001101001100111000010011010010101101100" &
         "1";
UNLOAD(0) <= "1101011001110111000110010111000001100100001111100010110111000000111100" &
             "1000101011101110100000101010011000101101110010110100110101101100100100" &
             "0100101110001110100010000001000110010001010000100001101100111001010111" &
             "1";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7868800
wait for 0 ns;
PI <= "001010110011010011000010001101001100010";
wait for 100 ns; -- 7868900
XPCT <= "0001011101000100010101100010001111001000";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7868940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7869000
wait for 0 ns; pulse_CK(PI);  -- 7869100

pattern := 366; -- 7869100
LOAD0 <= "0010010111001000000010110101101001000000110110011110011011011000111101" &
         "1100001011001001010100010101001000101101101000110101010111110011110110" &
         "1000011011100001111111101101011011000110101000101000000100000110010100" &
         "0";
UNLOAD(0) <= "0110010011110111100100110110101111011010101111000010110011000011111100" &
             "1011100111110011110010111110010101101101000111101100111001111100101000" &
             "0110011111010110101110010101010011001000110011110010111100011010101100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7890300
wait for 0 ns;
PI <= "001101011001101001111110111000010100000";
wait for 100 ns; -- 7890400
XPCT <= "0001000110110111101101000010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7890440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7890500
wait for 0 ns; pulse_CK(PI);  -- 7890600

pattern := 367; -- 7890600
LOAD0 <= "0011000111001101101010110010110000010010111110011000000101110101100011" &
         "1101011010010011101111111110000010000000100000100001101010111000010010" &
         "0000110011010010001010001110011000100011111101011111011110100000110100" &
         "1";
UNLOAD(0) <= "0111010001111100000000110111100001100000100100110010010011011000111111" &
             "0001100001111100000110001001011001101101111001111101010111111111110101" &
             "0000011110100011111110100000001011000010111000100000111101001111110000" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7911800
wait for 0 ns;
PI <= "010100100100110011000111010000110000010";
wait for 100 ns; -- 7911900
XPCT <= "1000100011010100011000011000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7911940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7912000
wait for 0 ns; pulse_CK(PI);  -- 7912100

pattern := 368; -- 7912100
LOAD0 <= "0110011011001101010000010001110101100101101101100010101101110001011011" &
         "1110000001111100100011110111000000010101110000001010101101011110010000" &
         "1111010110101011000101000100011010000011001011001110011011110101101111" &
         "1";
UNLOAD(0) <= "1010100111000101111000110111111000110010100101011100011001011110100101" &
             "0000011010011111101101001010010001100101010101101101100010110100010010" &
             "1000000110010000001000000100011110110001111011001110111100001011111101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7933300
wait for 0 ns;
PI <= "011001011000110001111011111110101101010";
wait for 100 ns; -- 7933400
XPCT <= "1001100011000111100010011100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7933440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7933500
wait for 0 ns; pulse_CK(PI);  -- 7933600

pattern := 369; -- 7933600
LOAD0 <= "0110101111000001011111111000111010101011101100110011011110000100100101" &
         "0010001100001100001100111100000011100100000111100011100101110111001001" &
         "1010000101001101000101001110010101100010010001011011101111100000001101" &
         "1";
UNLOAD(0) <= "1111111010000001000100010100100101100101111101001100100011101001011111" &
             "1100010001101010111001001011010001110101011000001100100001010110010000" &
             "0010101110110001001011001101000010010101001011111111111100010010101110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7954800
wait for 0 ns;
PI <= "011101011001110011111110111011011010110";
wait for 100 ns; -- 7954900
XPCT <= "0100100111010111111100101000111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7954940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7955000
wait for 0 ns; pulse_CK(PI);  -- 7955100

pattern := 370; -- 7955100
LOAD0 <= "0110111110111000101001101010100001001011001111110110001101110110100100" &
         "0100001100110111111111011011100010001010001111101010000011010011000111" &
         "1000100100000010010100010101111110111101100101110111100010110100000001" &
         "1";
UNLOAD(0) <= "0011101111000101011001010001110000001011011100010101001111100001001110" &
             "1111010100001010111100011110010000100100011110111100110101111111101011" &
             "0110100101001111001001101101000111110111010001011011011110100001100001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7976300
wait for 0 ns;
PI <= "011011001110001100001010100000110100110";
wait for 100 ns; -- 7976400
XPCT <= "1001111000101000100011011110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7976440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7976500
wait for 0 ns; pulse_CK(PI);  -- 7976600

pattern := 371; -- 7976600
LOAD0 <= "1011001111101000000101100001111111110000010101110100010000000110100110" &
         "0111011011001010001110110101101100100011110010100000110110110001001100" &
         "1110110100001001001111011111001100100001000010111010010011111000100011" &
         "1";
UNLOAD(0) <= "0110111110111100101100010010110001001011001111010100111111000010101000" &
             "1110001110100001000010110111110001001010000110100100110111011111000110" &
             "1100101100010000110110110100110101001001100001110110100100110100100101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 7997800
wait for 0 ns;
PI <= "000111010100100010101110101111011101110";
wait for 100 ns; -- 7997900
XPCT <= "0101110010010010111111101110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 7997940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 7998000
wait for 0 ns; pulse_CK(PI);  -- 7998100

pattern := 372; -- 7998100
LOAD0 <= "1111100101101111011100101001111011000000011010000011001000000110110110" &
         "0000110101010010110100110010100011100111010001101011011101100100010011" &
         "1001010011011100001001100000111101100010011001101111110011110000100101" &
         "0";
UNLOAD(0) <= "1011001111001100010000110100110101010000001111110100100011100111101000" &
             "1010011011010000001001100011101111100011111011101100011110111101101100" &
             "0011011100001011100011001100000100010101000010111010101110111010101011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8019300
wait for 0 ns;
PI <= "001000111100001111010111101000111001100";
wait for 100 ns; -- 8019400
XPCT <= "0100000000101101011110000100111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8019440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8019500
wait for 0 ns; pulse_CK(PI);  -- 8019600

pattern := 373; -- 8019600
LOAD0 <= "0111000011101000111101111111010010100101010000011010000010001001110100" &
         "1111011000011001000010010111010111000000010110011101100001110001110011" &
         "1111111000110001010111010110001100100000111000001110010111001001001010" &
         "1";
UNLOAD(0) <= "1110100101001011011001010001111001100000001110000001101011100001111100" &
             "1100110101010101011000110010110001100111001000110000001101100100010011" &
             "0100011110011100100101001101110100000111010011111111001110110101001001" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8040800
wait for 0 ns;
PI <= "001100000010010011001011101100110100010";
wait for 100 ns; -- 8040900
XPCT <= "1101101001010100110010001100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8040940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8041000
wait for 0 ns; pulse_CK(PI);  -- 8041100

pattern := 374; -- 8041100
LOAD0 <= "0100110000101000000100110001100011001011010011101101100111000010010111" &
         "0011000100001000110000010110010001101001001110100111110000010100100011" &
         "0000000011100010001111111111001011010111110011110110101101010001110101" &
         "0";
UNLOAD(0) <= "1011100001010100000101010111000000100101000110010110010011001010010101" &
             "0100111110111100101001110001000111101100001110011101110101111101010000" &
             "1010001111111001110000010000001100110001111000010111101111001011000110" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8062300
wait for 0 ns;
PI <= "001101100010110010110100011100101000010";
wait for 100 ns; -- 8062400
XPCT <= "1100001011010011011111010110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8062440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8062500
wait for 0 ns; pulse_CK(PI);  -- 8062600

pattern := 375; -- 8062600
LOAD0 <= "1010111101010110110110000001101101010101110111001100111001011111000011" &
         "0110011101010001100010011101010110000010110011011010000100000101101011" &
         "1111101110100011001101111010000001010110001101010100010011011010000101" &
         "0";
UNLOAD(0) <= "0011110000111100000000010111101011001011000101100110110110000011111010" &
             "1110100100111110110000000110010000101001011110111100110101011100000000" &
             "1001001111101000100110010100000001000010010011100111101110010001011011" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8083800
wait for 0 ns;
PI <= "000101001111101000101101111110100100010";
wait for 100 ns; -- 8083900
XPCT <= "0101001110110010101001010010111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8083940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8084000
wait for 0 ns; pulse_CK(PI);  -- 8084100

pattern := 376; -- 8084100
LOAD0 <= "0110011111101001101011100001000101101100110110101111000111100001111111" &
         "0100100101111101010110111101010010011001100000101010111110110110101111" &
         "1001001010100110100100111101011100001010010011111000110110110110111011" &
         "1";
UNLOAD(0) <= "1010111010010110100000110110100111110101101101100110100011001010011010" &
             "1101111111110010011010001101000110001010110011011000100001000101001001" &
             "0110001110101001101010010001010011010111110001100101111101010100100101" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8105300
wait for 0 ns;
PI <= "001100101011110000001011111000100000010";
wait for 100 ns; -- 8105400
XPCT <= "1000001111010000100001000010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8105440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8105500
wait for 0 ns; pulse_CK(PI);  -- 8105600

pattern := 377; -- 8105600
LOAD0 <= "1011001101100001111100010010110000110001100111111100000110100001110100" &
         "1101000001011011010010010000010101011110011000011001011010000000101110" &
         "0111101111010110110101001010110010101100001010111111010000011011101010" &
         "0";
UNLOAD(0) <= "0111011001011101100100010110000111001100101100100110100111000010111010" &
             "1111100111100110111000001011010001011001011000101100110111111110001101" &
             "0000101111101100100100010000000110001111011011110001101100110000111010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8126800
wait for 0 ns;
PI <= "001010111111001110100111101110110111010";
wait for 100 ns; -- 8126900
XPCT <= "1111111100101010011011011110111111111101";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8126940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8127000
wait for 0 ns; pulse_CK(PI);  -- 8127100

pattern := 378; -- 8127100
LOAD0 <= "0101011110000001111100100100110100111101000100001010100000001000100010" &
         "1100100000011110000011010100010010010000110101011110101111001001001011" &
         "0110001010100111110100110100100111110110010011001101101000010000001111" &
         "0";
UNLOAD(0) <= "1011001000110101101000110111101000110001100111110110001111000100010000" &
             "0101100011111010000010101000000111011010001001010001011110001100001111" &
             "1010001111010100110111010001100010101101011010100110111001011111101100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8148300
wait for 0 ns;
PI <= "011010001000100011100100110011100011010";
wait for 100 ns; -- 8148400
XPCT <= "1100010010000110011010110100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8148440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8148500
wait for 0 ns; pulse_CK(PI);  -- 8148600

pattern := 379; -- 8148600
LOAD0 <= "0110010001101110100100011101101100110111010101100101111100100000011100" &
         "1011111110111010000110010100010110011001110100110011101100110111110101" &
         "1111010010110101001110101111100100001110001010000101000101111110100110" &
         "1";
UNLOAD(0) <= "0111111111001101111000010100101110011101001110101110101010001010101100" &
             "1110111010000110001000100000010001010100011100011100110011001101001011" &
             "0110101110110101010010000101100101010110010001101100011101010000100111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8169800
wait for 0 ns;
PI <= "011100010000010100110011001000101110110";
wait for 100 ns; -- 8169900
XPCT <= "0101000001011011000111000110111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8169940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8170000
wait for 0 ns; pulse_CK(PI);  -- 8170100

pattern := 380; -- 8170100
LOAD0 <= "0111010010001001111111100011001001010110001110110100110100111110001011" &
         "0011110110110011010010011100000011010000110011100001111110111100101100" &
         "0111010111010001000001010010001111101100001011011101001101000101110010" &
         "0";
UNLOAD(0) <= "1011110011000010100100010101101100110111001111000101101011001111011010" &
             "1000110100111110111001110000000111111001001100110100100101110111010111" &
             "0010001110111101101000000000100100011101000010100101000101010001101111" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8191300
wait for 0 ns;
PI <= "001010101011100111001100011000111100000";
wait for 100 ns; -- 8191400
XPCT <= "0101111110001100111101001010111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8191440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8191500
wait for 0 ns; pulse_CK(PI);  -- 8191600

pattern := 381; -- 8191600
LOAD0 <= "0000101011100110000100101110100000111000101101111001110100100010110100" &
         "0111111101100000001010110101100111001111110011010001010110111011010010" &
         "1001110111000001000101011101110011001110011110010111100110001110111100" &
         "0";
UNLOAD(0) <= "0010010001011101100001011111000001110110001000010110101101011011110100" &
             "1001110110110011011010000110010001011100111010110010101010111000001111" &
             "0110010010011001101100010111011100101101010011000101111100001011111010" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8212800
wait for 0 ns;
PI <= "011011111011001110111101101101001111000";
wait for 100 ns; -- 8212900
XPCT <= "1101111100101011111110101100111111111100";
MASK <= "1111111111111111111111111111111111111111";
wait for 40 ns; -- 8212940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 8213000
wait for 0 ns; pulse_CK(PI);  -- 8213100

LOAD0 <= "0000000000000000000000000000000000000000000000000000000000000000000000" &
         "0000000000000000000000000000000000000000000000000000000000000000000000" &
         "0000000000000000000000000000000000000000000000000000000000000000000000" &
         "0";
UNLOAD(0) <= "0110101010000010000010110111100010111000111111011101101110000101011010" &
             "1101111101110010001010111101100110001011100011010101110111110111110011" &
             "0100011111000011100001110001110011011111011010100111100111001111111100" &
             "0";
UNLMSK(0) <= "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1111111111111111111111111111111111111111111111111111111111111111111111" &
             "1";
wait for 0 ns; load_unload(PI, UNLOAD, UNLMSK, SCANOUT, nofails, CHAINnames); -- 8234300

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
      DEALLOCATE(POnames(7));
      DEALLOCATE(POnames(8));
      DEALLOCATE(POnames(9));
      DEALLOCATE(POnames(10));
      DEALLOCATE(POnames(11));
      DEALLOCATE(POnames(12));
      DEALLOCATE(POnames(13));
      DEALLOCATE(POnames(14));
      DEALLOCATE(POnames(15));
      DEALLOCATE(POnames(16));
      DEALLOCATE(POnames(17));
      DEALLOCATE(POnames(18));
      DEALLOCATE(POnames(19));
      DEALLOCATE(POnames(20));
      DEALLOCATE(POnames(21));
      DEALLOCATE(POnames(22));
      DEALLOCATE(POnames(23));
      DEALLOCATE(POnames(24));
      DEALLOCATE(POnames(25));
      DEALLOCATE(POnames(26));
      DEALLOCATE(POnames(27));
      DEALLOCATE(POnames(28));
      DEALLOCATE(POnames(29));
      DEALLOCATE(POnames(30));
      DEALLOCATE(POnames(31));
      DEALLOCATE(POnames(32));
      DEALLOCATE(POnames(33));
      DEALLOCATE(POnames(34));
      DEALLOCATE(POnames(35));
      DEALLOCATE(POnames(36));
      DEALLOCATE(POnames(37));
      DEALLOCATE(POnames(38));
      DEALLOCATE(POnames(39));
      DEALLOCATE(CHAINnames(0));
   END PROCESS;
END testbench;

CONFIGURATION s9234_ctl OF s9234_test IS
   FOR testbench
      FOR dut: s9234 USE ENTITY WORK.s9234;
      END FOR;
   END FOR;
END s9234_ctl;
