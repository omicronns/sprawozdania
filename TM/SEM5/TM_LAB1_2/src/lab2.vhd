----------------------------------------------------------------------------------
--
--      Kod napisany na potrzeby laboratorium Techniki Mikroprocesorowej
--      Data:       28.10.2014
--      Autorzy:    Konrad Adasiewicz
--                  Michał Maciejewski
-- 
--      Info:       Kod zawiera kilka bloków 'architecture' odnoszących 
--                  się do jednego entity, w celu użycia kodu, niechciane
--                  bloki architecture należy wykomentować
--
----------------------------------------------------------------------------------

-- Used libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter is
    Port (      CLK         : in            STD_LOGIC;
                LED         : inout         STD_LOGIC;
                SWITCH      : in            STD_LOGIC_VECTOR (3 downto 0));
end counter;

-- Dioda LED mrugająca z częstotliwością ok
-- 2Hz (z dokładnością do możliwości osiągnięcia
-- rządanej częstotliwości z preskalowanego licznika)
architecture arch_counter of counter is
signal DATA : STD_LOGIC_VECTOR (24 downto 0);
begin
   process(CLK)
   begin
       if rising_edge(CLK) then
            -- Inkrementuj licznik przy narastającym zboczu zegara
            DATA <= DATA + 1;
       end if;
   end process;
   -- Połącz 24 bit licznika z wyjściem diody
   LED <= DATA(24);
end arch_counter;

-- Dioda LED mrugająca z częstotliwością dokładnie
-- 2Hz (2Hz*12500000*2 = 50MHz)
architecture arch_counter of counter is
begin
   process(CLK)
   variable DATA : integer range 0 to 12500000;
   begin
       if rising_edge(CLK) then
            -- Inkrementuj licznik przy narastającym zboczu zegara
            DATA := DATA + 1;
            if DATA = 0 then
                -- Przy przepełnieniu licznika zaneguj stan diody
                LED <= not LED;
           end if;
       end if;
   end process;
end arch_counter;

-- Dioda LED modulowana sygnałem PWM o współczynniku
-- wypełnienia zadawanym przez switche
architecture arch_counter of counter is
begin
    process(CLK, SWITCH)
    variable DATA : STD_LOGIC_VECTOR (15 downto 0);
    begin
        if rising_edge(CLK) then
            -- Inkrementuj licznik przy narastającym zboczu zegara
            DATA := DATA + 1;
            if DATA = 0 then
                -- Przy przepełnieniu licznika zaświeć diodę
                led <= '1';
            end if;
            if DATA = (SWITCH * X"1000") then
                -- Przy osiągnięciu przez licznik wartości zależnej od stanu
                -- switchy zgaś diodę
                led <= '0';
            end if;
        end if;
    end process;
end arch_counter;