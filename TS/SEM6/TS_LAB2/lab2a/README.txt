Zadany uk³ad:

                  s + 1
  --------------------------------------
  0.01 s^4 + 0.5 s^3 + 3 s^2 - 10 s + 10

w zamkniêtej pêtli sprzê¿enia zwrotnego bêdzie posiada³ trzy obszary stabilnoœci:
    [1]:    Wykres nyquista nie obejmuje punktu -1 na p³aszczyŸnie zespolonej   (niestabilny)
    [2]:    Wykres nyquista obejmuje punkt -1 na p³aszczyŸnie zespolonej 2 razy (stabilny)
    [3]:    Wykres nyquista nie obejmuje punktu -1 na p³aszczyŸnie zespolonej   (niestabilny)
Owy wniosek mo¿na wyci¹gn¹æ obserwuj¹c wykres nyquista dla dowolnego wzmocniania regulatora
"K > 0". Wynika to z obecnoœci dwóch punktów przeciêcia osi rzeczywistej przez wykres.

Opis g³ównych elementów sprawozdania:
    [runme]:        Uruchamia prezentacjê g³ównych elementów przebadanych
                    na laboratorium

    [plotnyquist]:  Po zdefiniowaniu wzmocnienia "K", uruchomienie skryptu
                    powoduje wyœwietlenie wykresu nyquista dla zadanego
                    wczeœniej wzmocnienia uk³adu ze skryptu

    [findKfine]:    Nie wymaga definiowania niczego. Numerycznie wyznacza
                    przybli¿one wartoœci wzmocnieñ krytycznych badanego
                    uk³adu. Zostaj¹ zapisane one go zmiennej gains.
                    Wyznaczenie sta³ych polega na iterowaniu po wartoœci
                    wzmocnienia ze zmiennym krokiem i analizie po³o¿enia
                    miejsc zerowych transmitancji widmowej uk³adu.

    [checkclosed]:  Po zdefiniowaniu wzmocnienia "K", dodatkowy skrypt
                    sprawdza stabilnoœæ uk³adu zamkniêtego na podstawie
                    numerycznie wyznaczonych biegunów transmitancji uk³adu
                    zamkniêtego.

Kryterium nyquista pozwala z du¿¹ dok³adnoœci¹ i co ma du¿e znaczenie - metodami
graficznymi - stwierdziæ o stabilnoœci zamkniêtego uk³adu regulacji na podstawie
znajomoœci wykresu nyquista uk³adu otwartego, który mo¿na wyznaczyæ doœwiadczalnie
nie znaj¹c modelu matematycznego obiektu i regulatora. Charakterystyki Bodego
nie mówi¹ wiele o stabilnoœci obiektu szczególnie jeœli interesuje nas charakterystyka
fazowa i zmiana owej fazy w funkcji czêstotliwoœci, poniewa¿ kryterium nie 
bada czystej transmitancji uk³adu otwartego, lecz (Go(jw) + 1) której charakterystyki
bodego mog¹ byæ ca³kowicie odmienne.

