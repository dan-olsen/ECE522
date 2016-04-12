-- VHDL pattern output written by  TetraMAX (TM)  E-2010.12-SP5-i110710_172605 
-- Date: Tue Apr 12 11:53:37 2016
-- Module tested: RipAdder4

--     Uncollapsed Stuck Fault Summary Report
-- -----------------------------------------------
-- fault class                     code   #faults
-- ------------------------------  ----  ---------
-- Detected                         DT        228
-- Possibly detected                PT          0
-- Undetectable                     UD          0
-- ATPG untestable                  AU          0
-- Not detected                     ND          0
-- -----------------------------------------------
-- total faults                               228
-- test coverage                           100.00%
-- -----------------------------------------------
-- 
--            Pattern Summary Report
-- -----------------------------------------------
-- #internal patterns                          12
--     #full_sequential patterns               12
-- -----------------------------------------------
-- 
-- There are no rule fails
-- There are no clocks
-- There are no constraint ports
-- There are no equivalent pins
-- There are no net connections

LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.Std_Logic_TextIO.all;
USE Std.TextIO.all;
USE Std.Standard.all;

ENTITY RipAdder4_test IS
END RipAdder4_test;

ARCHITECTURE testbench OF RipAdder4_test IS

   constant NINPUTS: INTEGER := 9;
   constant NOUTPUTS: INTEGER := 5;
   SUBTYPE InVector IS std_logic_vector (0 TO NINPUTS-1);
   SUBTYPE OutVector IS std_logic_vector (0 TO NOUTPUTS-1);
   TYPE POString IS ARRAY (0 TO NOUTPUTS-1) OF LINE;
   SIGNAL PO, ALLPOS, XPCT, MASK: OutVector;
   SIGNAL PI, ALLPIS: InVector;

   -- *** Signal Declarations ***
   SIGNAL CIN, COUT: std_logic;
   SIGNAL A: std_logic_vector(3 DOWNTO 0);
   SIGNAL B: std_logic_vector(3 DOWNTO 0);
   SIGNAL SUM: std_logic_vector(3 DOWNTO 0);

   -- *** Component Declaration ***
   COMPONENT RipAdder4 PORT (
      CIN: IN std_logic;
      A: IN std_logic_vector(3 DOWNTO 0);
      B: IN std_logic_vector(3 DOWNTO 0);
      SUM: OUT std_logic_vector(3 DOWNTO 0);
      COUT: OUT std_logic);
   END COMPONENT;

   -- *** Procedures ***


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
      wait for 200 ns;
   END test_setup;
   BEGIN -------------------------------- testbench body --------------------------------
   -- *** Map inputs and bidis ***
   CIN <= PI(0);
   A <= PI(1 TO 4);
   B <= PI(5 TO 8);

   -- *** Map outputs and bidis ***
   PO(0 TO 3) <= SUM;
   PO(4) <= COUT;

   -- *** Instantiation of Component ***
   dut: RipAdder4 port map (
      CIN => CIN,
      A => A,
      B => B,
      SUM => SUM,
      COUT => COUT);

   -- *** Main Process ***
   PROCESS
   variable nofails, pattern: INTEGER;
   variable POnames: POString;
   variable L : Line;
   BEGIN
      POnames(0) := new STRING'("\SUM[3]\ ");
      POnames(1) := new STRING'("\SUM[2]\ ");
      POnames(2) := new STRING'("\SUM[1]\ ");
      POnames(3) := new STRING'("\SUM[0]\ ");
      POnames(4) := new STRING'("COUT");
      nofails := 0; pattern := -1;
      -- *** test setup procedure ***
      test_setup(PI); -- 200

      -- *** Non-scan test ***
pattern := 0; -- 200
wait for 0 ns;
PI <= "011100100";
wait for 0 ns;
XPCT <= "00101";
MASK <= "11111";
wait for 40 ns; -- 240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 300

pattern := 1; -- 300
wait for 0 ns;
PI <= "010001110";
wait for 0 ns;
XPCT <= "01101";
MASK <= "11111";
wait for 40 ns; -- 340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 400

pattern := 2; -- 400
wait for 0 ns;
PI <= "001001010";
wait for 0 ns;
XPCT <= "11100";
MASK <= "11111";
wait for 40 ns; -- 440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 500

pattern := 3; -- 500
wait for 0 ns;
PI <= "010011011";
wait for 0 ns;
XPCT <= "01001";
MASK <= "11111";
wait for 40 ns; -- 540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 600

pattern := 4; -- 600
wait for 0 ns;
PI <= "001001111";
wait for 0 ns;
XPCT <= "00111";
MASK <= "11111";
wait for 40 ns; -- 640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 700

pattern := 5; -- 700
wait for 0 ns;
PI <= "100110011";
wait for 0 ns;
XPCT <= "01110";
MASK <= "11111";
wait for 40 ns; -- 740
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 800

pattern := 6; -- 800
wait for 0 ns;
PI <= "101001110";
wait for 0 ns;
XPCT <= "00111";
MASK <= "11111";
wait for 40 ns; -- 840
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 900

pattern := 7; -- 900
wait for 0 ns;
PI <= "101100111";
wait for 0 ns;
XPCT <= "11100";
MASK <= "11111";
wait for 40 ns; -- 940
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1000

pattern := 8; -- 1000
wait for 0 ns;
PI <= "000010110";
wait for 0 ns;
XPCT <= "01110";
MASK <= "11111";
wait for 40 ns; -- 1040
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1100

pattern := 9; -- 1100
wait for 0 ns;
PI <= "000011101";
wait for 0 ns;
XPCT <= "11100";
MASK <= "11111";
wait for 40 ns; -- 1140
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1200

pattern := 10; -- 1200
wait for 0 ns;
PI <= "100101111";
wait for 0 ns;
XPCT <= "00101";
MASK <= "11111";
wait for 40 ns; -- 1240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1300

pattern := 11; -- 1300
wait for 0 ns;
PI <= "010010110";
wait for 0 ns;
XPCT <= "11110";
MASK <= "11111";
wait for 40 ns; -- 1340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 1400


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
   END PROCESS;
END testbench;

CONFIGURATION RipAdder4_ctl OF RipAdder4_test IS
   FOR testbench
      FOR dut: RipAdder4 USE ENTITY WORK.RipAdder4;
      END FOR;
   END FOR;
END RipAdder4_ctl;
