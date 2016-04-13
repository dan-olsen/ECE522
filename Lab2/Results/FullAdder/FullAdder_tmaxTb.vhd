-- VHDL pattern output written by  TetraMAX (TM)  E-2010.12-SP5-i110710_172605 
-- Date: Tue Apr 12 19:06:02 2016
-- Module tested: FullAdder

--     Uncollapsed Stuck Fault Summary Report
-- -----------------------------------------------
-- fault class                     code   #faults
-- ------------------------------  ----  ---------
-- Detected                         DT         56
-- Possibly detected                PT          0
-- Undetectable                     UD          0
-- ATPG untestable                  AU          0
-- Not detected                     ND          0
-- -----------------------------------------------
-- total faults                                56
-- test coverage                           100.00%
-- -----------------------------------------------
-- 
--            Pattern Summary Report
-- -----------------------------------------------
-- #internal patterns                           6
--     #full_sequential patterns                6
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

ENTITY FullAdder_test IS
END FullAdder_test;

ARCHITECTURE testbench OF FullAdder_test IS

   constant NINPUTS: INTEGER := 3;
   constant NOUTPUTS: INTEGER := 2;
   SUBTYPE InVector IS std_logic_vector (0 TO NINPUTS-1);
   SUBTYPE OutVector IS std_logic_vector (0 TO NOUTPUTS-1);
   TYPE POString IS ARRAY (0 TO NOUTPUTS-1) OF LINE;
   SIGNAL PO, ALLPOS, XPCT, MASK: OutVector;
   SIGNAL PI, ALLPIS: InVector;

   -- *** Signal Declarations ***
   SIGNAL A, B, Cin, Cout, S: std_logic;

   -- *** Component Declaration ***
   COMPONENT FullAdder PORT (
      A: IN std_logic;
      B: IN std_logic;
      Cin: IN std_logic;
      Cout: OUT std_logic;
      S: OUT std_logic);
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
   A <= PI(0);
   B <= PI(1);
   Cin <= PI(2);

   -- *** Map outputs and bidis ***
   PO(0) <= Cout;
   PO(1) <= S;

   -- *** Instantiation of Component ***
   dut: FullAdder port map (
      A => A,
      B => B,
      Cin => Cin,
      Cout => Cout,
      S => S);

   -- *** Main Process ***
   PROCESS
   variable nofails, pattern: INTEGER;
   variable POnames: POString;
   variable L : Line;
   BEGIN
      POnames(0) := new STRING'("Cout");
      POnames(1) := new STRING'("S");
      nofails := 0; pattern := -1;
      -- *** test setup procedure ***
      test_setup(PI); -- 200

      -- *** Non-scan test ***
pattern := 0; -- 200
wait for 0 ns;
PI <= "011";
wait for 0 ns;
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 240
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 300

pattern := 1; -- 300
wait for 0 ns;
PI <= "010";
wait for 0 ns;
XPCT <= "01";
MASK <= "11";
wait for 40 ns; -- 340
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 400

pattern := 2; -- 400
wait for 0 ns;
PI <= "101";
wait for 0 ns;
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 440
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 500

pattern := 3; -- 500
wait for 0 ns;
PI <= "001";
wait for 0 ns;
XPCT <= "01";
MASK <= "11";
wait for 40 ns; -- 540
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 600

pattern := 4; -- 600
wait for 0 ns;
PI <= "110";
wait for 0 ns;
XPCT <= "10";
MASK <= "11";
wait for 40 ns; -- 640
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 700

pattern := 5; -- 700
wait for 0 ns;
PI <= "100";
wait for 0 ns;
XPCT <= "01";
MASK <= "11";
wait for 40 ns; -- 740
measurePO_default_WFT(ALLPOS, PO, XPCT, MASK, nofails, pattern, POnames);
wait for 60 ns; -- 800


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
   END PROCESS;
END testbench;

CONFIGURATION FullAdder_ctl OF FullAdder_test IS
   FOR testbench
      FOR dut: FullAdder USE ENTITY WORK.FullAdder;
      END FOR;
   END FOR;
END FullAdder_ctl;
