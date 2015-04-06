----------------------------------------------------------------------------------
--
--      Kod napisany na potrzeby laboratorium Techniki Mikroprocesorowej
--      Data:       21.10.2014
--      Autorzy:    Konrad Adasiewicz
--                  Michal Maciejewski
-- 
--      Info:       Kod zawiera kilka blokow 'architecture' odnoszacych 
--                  sie do jednego entity, w celu uzycia kodu, niechciane
--                  bloki architecture nalezy wykomentowac
--
----------------------------------------------------------------------------------

-- Used libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bramki is
    Port ( 	SWITCH		: in  		STD_LOGIC_VECTOR (0 to 3);
           	LED				: inout  	STD_LOGIC_VECTOR (0 to 5));
end bramki;

-- Implementuje podstawowe dwuwejsciowe funkcje logiczne
-- i wyswietla ich wyniki na diodach LED:
-- (AND, OR, NAND, NOR, XOR, XNOR)
architecture Behavioral of bramki is
begin
	LED(0) <= 	  SWITCH(0) and SWITCH (1);
	LED(1) <= 	  SWITCH(0) or  SWITCH (1);
	LED(2) <= not(SWITCH(0) and SWITCH (1));
	LED(3) <= not(SWITCH(0) or  SWITCH (1));
	LED(4) <= 	  SWITCH(0) xor SWITCH (1);
	LED(5) <= not(SWITCH(0) xor SWITCH (1));
end Behavioral;

-- Implementuje podstawowe trzywejsciowe funkcje logiczne
-- i wyswietla ich wyniki na diodach LED:
-- (AND, OR, NAND, NOR, XOR, XNOR)
architecture Behavioral of bramki is
begin
	LED(0) <= 	  SWITCH(0) and SWITCH (1) and SWITCH (2);
	LED(1) <= 	  SWITCH(0) or  SWITCH (1) or  SWITCH (2);
	LED(2) <= not(SWITCH(0) and SWITCH (1) and SWITCH (2));
	LED(3) <= not(SWITCH(0) or  SWITCH (1) or  SWITCH (2));
	LED(4) <= 	  SWITCH(0) xor SWITCH (1) xor SWITCH (2);
	LED(5) <= not(SWITCH(0) xor SWITCH (1) xor SWITCH (2));
end Behavioral;

-- Jak poprzednio implementuje podstawowe trzywejsciowe
-- funkcje logiczne i wyswietla ich wyniki na diodach LED,
-- dodatkowo ostatni switch blokuje wyjscia LED na stale
-- je gaszac
architecture Behavioral of bramki is
begin
   	LED <= 	"000000"
			when SWITCH(3) = '0' else
       		(   	SWITCH(0) and SWITCH (1) and SWITCH (2),
                SWITCH(0) or  SWITCH (1) or  SWITCH (2),
            not(SWITCH(0) and SWITCH (1) and SWITCH (2)),
            not(SWITCH(0) or  SWITCH (1) or  SWITCH (2)),
                SWITCH(0) xor SWITCH (1) xor SWITCH (2),
            not(SWITCH(0) xor SWITCH (1) xor SWITCH (2)));
end Behavioral;

-- Przyklad uzycia operatora konkatenacji:
-- gdy SWITCH(3) = '0' diody led odzwierciedlaja stany 
-- switchy od 0 do 2, w przeciwnym wypadku stany switchy
-- zostaje odzwierciedlony w innej kolejnosci poprzez konkatenacje
-- czesci wektora z jego reszta w innej kolejnosci
architecture Behavioral of bramki is
begin
    LED <=  "000" & SWITCH(0 to 2)
		when SWITCH(3) = '0' else
        	"000" & SWITCH(2) & SWITCH(0 to 1);
end Behavioral;