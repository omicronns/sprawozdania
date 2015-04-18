Zadany uk�ad:

                  s + 1
  --------------------------------------
  0.01 s^4 + 0.5 s^3 + 3 s^2 - 10 s + 10

w zamkni�tej p�tli sprz�enia zwrotnego b�dzie posiada� trzy obszary stabilno�ci:
    [1]:    Wykres nyquista nie obejmuje punktu -1 na p�aszczy�nie zespolonej   (niestabilny)
    [2]:    Wykres nyquista obejmuje punkt -1 na p�aszczy�nie zespolonej 2 razy (stabilny)
    [3]:    Wykres nyquista nie obejmuje punktu -1 na p�aszczy�nie zespolonej   (niestabilny)
Owy wniosek mo�na wyci�gn�� obserwuj�c wykres nyquista dla dowolnego wzmocniania regulatora
"K > 0". Wynika to z obecno�ci dw�ch punkt�w przeci�cia osi rzeczywistej przez wykres.

Opis g��wnych element�w sprawozdania:
    [runme]:        Uruchamia prezentacj� g��wnych element�w przebadanych
                    na laboratorium

    [plotnyquist]:  Po zdefiniowaniu wzmocnienia "K", uruchomienie skryptu
                    powoduje wy�wietlenie wykresu nyquista dla zadanego
                    wcze�niej wzmocnienia uk�adu ze skryptu

    [findKfine]:    Nie wymaga definiowania niczego. Numerycznie wyznacza
                    przybli�one warto�ci wzmocnie� krytycznych badanego
                    uk�adu. Zostaj� zapisane one go zmiennej gains.
                    Wyznaczenie sta�ych polega na iterowaniu po warto�ci
                    wzmocnienia ze zmiennym krokiem i analizie po�o�enia
                    miejsc zerowych transmitancji widmowej uk�adu.

    [checkclosed]:  Po zdefiniowaniu wzmocnienia "K", dodatkowy skrypt
                    sprawdza stabilno�� uk�adu zamkni�tego na podstawie
                    numerycznie wyznaczonych biegun�w transmitancji uk�adu
                    zamkni�tego.

Kryterium nyquista pozwala z du�� dok�adno�ci� i co ma du�e znaczenie - metodami
graficznymi - stwierdzi� o stabilno�ci zamkni�tego uk�adu regulacji na podstawie
znajomo�ci wykresu nyquista uk�adu otwartego, kt�ry mo�na wyznaczy� do�wiadczalnie
nie znaj�c modelu matematycznego obiektu i regulatora. Charakterystyki Bodego
nie m�wi� wiele o stabilno�ci obiektu szczeg�lnie je�li interesuje nas charakterystyka
fazowa i zmiana owej fazy w funkcji cz�stotliwo�ci, poniewa� kryterium nie 
bada czystej transmitancji uk�adu otwartego, lecz (Go(jw) + 1) kt�rej charakterystyki
bodego mog� by� ca�kowicie odmienne.

