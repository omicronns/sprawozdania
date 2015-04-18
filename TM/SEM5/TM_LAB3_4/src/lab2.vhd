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

-- Użyte biblioteki
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;

library WORK;
use WORK.LCD_PACKAGE.all;

architecture arch of entityName is
    
begin

    -- Preskaler (CLK_LOW na 1Hz)
    process(CLK)
        variable PRESC : integer range 0 to 25000000;
    begin
        if rising_edge(CLK) then
            PRESC := PRESC + 1;
            if PRESC = 0 then
                CLK_LOW <= not CLK_LOW;
            end if;
        end if;
    end process;
    
    -- Licznik mod 4
    process(CLK)
        variable CLK_LOW_PREV : STD_LOGIC;
    begin
        if rising_edge(CLK) then
            if (CLK_LOW_PREV & CLK_LOW) = "01" then
                if SWITCH(0) = '1' then
                    CNT_VAL <= CNT_VAL + '1';
                elsif SWITCH(0) = '0' then
                    CNT_VAL <= CNT_VAL - '1';
                end if;
            end if;
            CLK_LOW_PREV := CLK_LOW;
        end if;
    end process;
    
    -- Algorytm 1
    -- Enkoder w trakcie obrotu w jedną stronę generuje dwie fale prostokątne
    -- przesunięte w fazie o ćwierć okresu. Zatem gdy na jednej z linii występuje
    -- dowolne zbocze sprawdzając stan drugiej, jesteśmy w stanie rozpoznać kierunek
    -- obrotu osi enkodera
    process(CLK)
        variable ENC_A_PREV : STD_LOGIC;
        variable ENC_VAL    : STD_LOGIC_VECTOR(1 downto 0);
    begin
        if rising_edge(CLK) then
            if (ENC_A_PREV & ENC_A) = "01" then
                if ENC_B = '1' then
                    ENC_VAL := ENC_VAL + 1;
                else
                    ENC_VAL := ENC_VAL - 1;
                end if;
            end if;
            CNT_VAL <= ENC_VAL;
        end if;
    end process;
    
    -- Algorytm 2
    -- Algorytm ten polega na wstępnym debouncingu sygnałów linii enkodera
    -- opierającego się na tym że w związku z jego budową wiemy, iż gdy
    -- występuje zmiana na jednej z linii, druga linia jest stabilna.
    -- Na odfiltrowanych sygnałach wykonywany jest Algorytm 1
    process(CLK)
        variable ENC_A_LAST_PREV    : STD_LOGIC;
        variable ENC_A_LAST         : STD_LOGIC;
        variable ENC_B_PREV         : STD_LOGIC;
        variable ENC_A_PREV         : STD_LOGIC;
        variable ENC_B_PREV         : STD_LOGIC;
        variable ENC_VAL            : STD_LOGIC_VECTOR(1 downto 0);
    begin
        if rising_edge(CLK) then
            if (ENC_A_PREV & ENC_A) = "01" then
                ENC_B_PREV := ENC_B;
            end if;
    
            if (ENC_B_PREV & ENC_B) = "01" then
                ENC_A_LAST := ENC_A;
            end if;
    
            if (ENC_A_LAST_PREV & ENC_A_LAST) = "01" then
                if ENC_B_LAST = '1' then
                    ENC_VAL <= ENC_VAL + '1';
                elsif ENC_B_LAST = '0' then
                    ENC_VAL <= ENC_VAL - '1';
                end if;
            end if;
            ENC_A_PREV := ENC_A;
            ENC_B_PREV := ENC_B;
            ENC_A_LAST_PREV := ENC_A_LAST;
            CNT_VAL <= ENC_VAL;
        end if;
    end process;
    
    -- Algorytm 3
    -- Algorytm ten reaguje tylko na kilka konkretnych rodzajów zmian sygnałów
    -- linii enkodera, eliminując reakcję na przejścia powstające wskutek
    -- drgań zestyków
    process(CLK)
        variable ENC_A_PREV : STD_LOGIC;
        variable ENC_B_PREV : STD_LOGIC;
        variable ENC_VAL    : STD_LOGIC_VECTOR(3 downto 0);
    begin
        if rising_edge(CLK) then
            if      ((ENC_A & ENC_B) = "10" and (ENC_A_PREV & ENC_B_PREV) = "00") or
                    ((ENC_A & ENC_B) = "11" and (ENC_A_PREV & ENC_B_PREV) = "10") or
                    ((ENC_A & ENC_B) = "01" and (ENC_A_PREV & ENC_B_PREV) = "11") or
                    ((ENC_A & ENC_B) = "00" and (ENC_A_PREV & ENC_B_PREV) = "01") then
                ENC_VAL <= ENC_VAL + '1';
            elsif   ((ENC_A & ENC_B) = "01" and (ENC_A_PREV & ENC_B_PREV) = "00") or
                    ((ENC_A & ENC_B) = "11" and (ENC_A_PREV & ENC_B_PREV) = "01") or
                    ((ENC_A & ENC_B) = "10" and (ENC_A_PREV & ENC_B_PREV) = "11") or
                    ((ENC_A & ENC_B) = "00" and (ENC_A_PREV & ENC_B_PREV) = "10") then
                ENC_VAL <= ENC_VAL - '1';
            end if;
            ENC_A_PREV := ENC_A;
            ENC_B_PREV := ENC_B;
            CNT_VAL <= ENC_VAL(3 downto 2);
        end if;
    end process;
    
    -- Licznik 3xBCD będący pośrednikiem pomiędzy wyświetlaczem a
    -- strukturami go taktującymi(licznik mod 4 oraz algorytmy enkoderowe).
    -- Licznik zmienia swoją wartość na podstawie sygnału CNT_VAL, który
    -- jest 2-bitowym wektorem
    process(CLK)
        variable VAL0         : STD_LOGIC_VECTOR(3 downto 0) := "0000";
        variable VAL1         : STD_LOGIC_VECTOR(3 downto 0) := "0000";
        variable VAL2         : STD_LOGIC_VECTOR(3 downto 0) := "0000";
        variable CNT_VAL_PREV : STD_LOGIC_VECTOR(1 downto 0) := "00";
    begin
        if rising_edge(CLK) then
                -- Warunek dla zwiększenia wartości licznika
            if      ((CNT_VAL_PREV & CNT_VAL) = "0001") or
                    ((CNT_VAL_PREV & CNT_VAL) = "0110") or
                    ((CNT_VAL_PREV & CNT_VAL) = "1011") or
                    ((CNT_VAL_PREV & CNT_VAL) = "1100") then
                VAL0 := VAL0 + "0001";
                if VAL0 = "1010" then
                    VAL0 := "0000";
                    VAL1 := VAL1 + "0001";
                    if VAL1 = "1010" then
                        VAL1 := "0000";
                        VAL2 := VAL2 + "0001";
                        if VAL2 = "1010" then
                            VAL2 := "0000";
                        end if;
                    end if;
                end if;
                -- Warunek dla zmniejszenia wartości licznika
            elsif   ((CNT_VAL_PREV & CNT_VAL) = "1110") or
                    ((CNT_VAL_PREV & CNT_VAL) = "1001") or
                    ((CNT_VAL_PREV & CNT_VAL) = "0100") or
                    ((CNT_VAL_PREV & CNT_VAL) = "0011") then
                VAL0 := VAL0 - "0001";
                if VAL0 = "1111" then
                    VAL0 := "1001";
                    VAL1 := VAL1 - "0001";
                    if VAL1 = "1111" then
                        VAL1 := "1001";
                        VAL2 := VAL2 - "0001";
                        if VAL2 = "1111" then
                            VAL2 := "1001";
                        end if;
                    end if;
                end if;
            end if;
            CNT0 <= VAL0;
            CNT1 <= VAL1;
            CNT2 <= VAL2;
            CNT_VAL_PREV := CNT_VAL;
        end if;
    end process;
    
    -- Przepisanie wartości licznika do tablicy wyświetlacza
    process(CLK)
    begin
        if rising_edge(CLK) then
            CHARS(1,1) <= "0011" & CNT2;
            CHARS(1,2) <= "0011" & CNT1;
            CHARS(1,3) <= "0011" & CNT0;
        end if;
    end process;
    
end architecture;
