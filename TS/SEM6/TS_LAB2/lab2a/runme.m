findKfine

K = 10;
figure
plotnyquist
title('Uk�ad ze wzmocnieniem w obszarze niestabilno�ci 1(nyquist)')
figure
plotbode
title('Uk�ad ze wzmocnieniem w obszarze niestabilno�ci 1(bode)')

K = gains(1);
figure
plotnyquist
title('Uk�ad ze wzmocnieniem granicznym pierwszym(nyquist)')
figure
plotbode
title('Uk�ad ze wzmocnieniem granicznym pierwszym(bode)')

K = mean(gains);
figure
plotnyquist
title('Uk�ad ze wzmocnieniem pomi�dzy krytycznymi(nyquist)')
figure
plotbode
title('Uk�ad ze wzmocnieniem pomi�dzy krytycznymi(bode)')

K = gains(2);
figure
plotnyquist
title('Uk�ad ze wzmocnieniem granicznym drugim(nyquist)')
figure
plotbode
title('Uk�ad ze wzmocnieniem granicznym drugim(bode)')

K = gains(2) + 10;
figure
plotnyquist
title('Uk�ad ze wzmocnieniem w obszarze niestabilno�ci 2(nyquist)')
figure
plotbode
title('Uk�ad ze wzmocnieniem w obszarze niestabilno�ci 2(bode)')


