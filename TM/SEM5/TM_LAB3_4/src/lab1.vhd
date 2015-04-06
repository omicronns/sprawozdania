----------------------------------------------------------------------------------
--
--      Kod napisany na potrzeby laboratorium Techniki Mikroprocesorowej
--      Data:       25.11.2014
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity encoder is
    Port ( 	CLK		: in        STD_LOGIC;
		    ENC_A	: in  		STD_LOGIC;
        	ENC_B	: in  		STD_LOGIC;
		    ENC_BUT : in  		STD_LOGIC;
		    LED		: inout 	STD_LOGIC_VECTOR (5 downto 0));
end encoder;

-- Algorytm 1
architecture Behavioral of encoder is
	signal ENC_VAL     : integer range 0 to 9;
begin
	process(CLK)
	    variable ENC_A_PREV  : STD_LOGIC;
	begin
		if rising_edge(CLK) then
		 	if (ENC_A_PREV & ENC_A) = "01" then
		 	    if ENC_B = '0' then
				    ENC_VAL <= ENC_VAL + '1';
			    elsif ENC_B = '1' then
				    ENC_VAL <= ENC_VAL - '1';
			    end if;
			end if;
			ENC_A_PREV := ENC_A;
		end if;
	end process;
end Behavioral;

-- Algorytm 2
architecture Behavioral of encoder is
	signal      ENC_VAL    : integer range 0 to 9;
begin
	process(CLK)
	    variable ENC_A_LAST_PREV    : STD_LOGIC;
	    variable ENC_A_LAST         : STD_LOGIC;
	    variable ENC_B_LAST         : STD_LOGIC;
	    variable ENC_A_PREV         : STD_LOGIC;
	    variable ENC_B_PREV         : STD_LOGIC;
	begin
		if rising_edge(CLK) then
		 	if (ENC_A_PREV & ENC_A) = "01" then
		 	    ENC_B_LAST <= ENC_B;
			end if;
			ENC_A_PREV := ENC_A;
			
		 	if (ENC_B_PREV & ENC_B) = "01" then
		 	    ENC_A_LAST <= ENC_A;
			end if;
			ENC_B_PREV := ENC_B;
			
		 	if (ENC_A_LAST_PREV & ENC_A_LAST) = "01" then
		     	if ENC_B_LAST = '1' then
				    ENC_VAL <= ENC_VAL + '1';
			    elsif ENC_B_LAST = '0' then
				    ENC_VAL <= ENC_VAL - '1';
			    end if;
			end if;
			ENC_A_LAST_PREV := ENC_A_LAST;
		end if;
	end process;
end Behavioral;

-- Algorytm 3
architecture Behavioral of encoder is
	signal ENC_VAL    : integer range 0 to 9;
begin
	process(CLK)
	    variable ENC_A_LAST : STD_LOGIC;
	    variable ENC_B_LAST : STD_LOGIC;
	begin
		if rising_edge(CLK) then
		    if   	((ENC_A & ENC_B) = "00" and (ENC_A_LAST & ENC_B_LAST) = "10") or
				    ((ENC_A & ENC_B) = "10" and (ENC_A_LAST & ENC_B_LAST) = "11") or
				    ((ENC_A & ENC_B) = "11" and (ENC_A_LAST & ENC_B_LAST) = "01") or
				    ((ENC_A & ENC_B) = "01" and (ENC_A_LAST & ENC_B_LAST) = "00") then
					ENC_VAL <= ENC_VAL + '1';
		 	elsif   ((ENC_A & ENC_B) = "00" and (ENC_A_LAST & ENC_B_LAST) = "01") or
				    ((ENC_A & ENC_B) = "01" and (ENC_A_LAST & ENC_B_LAST) = "11") or
				    ((ENC_A & ENC_B) = "11" and (ENC_A_LAST & ENC_B_LAST) = "10") or
				    ((ENC_A & ENC_B) = "10" and (ENC_A_LAST & ENC_B_LAST) = "00") then
					ENC_VAL <= ENC_VAL - '1';
			end if;
			ENC_A_LAST := ENC_A;
			ENC_B_LAST := ENC_B;
		end if;
	end process;
end Behavioral;
