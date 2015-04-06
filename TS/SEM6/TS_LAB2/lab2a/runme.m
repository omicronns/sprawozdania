findKfine

K = 10;
figure
plotnyquist
title('Uk³ad ze wzmocnieniem w obszarze niestabilnoœci 1(nyquist)')
figure
plotbode
title('Uk³ad ze wzmocnieniem w obszarze niestabilnoœci 1(bode)')

K = gains(1);
figure
plotnyquist
title('Uk³ad ze wzmocnieniem granicznym pierwszym(nyquist)')
figure
plotbode
title('Uk³ad ze wzmocnieniem granicznym pierwszym(bode)')

K = mean(gains);
figure
plotnyquist
title('Uk³ad ze wzmocnieniem pomiêdzy krytycznymi(nyquist)')
figure
plotbode
title('Uk³ad ze wzmocnieniem pomiêdzy krytycznymi(bode)')

K = gains(2);
figure
plotnyquist
title('Uk³ad ze wzmocnieniem granicznym drugim(nyquist)')
figure
plotbode
title('Uk³ad ze wzmocnieniem granicznym drugim(bode)')

K = gains(2) + 10;
figure
plotnyquist
title('Uk³ad ze wzmocnieniem w obszarze niestabilnoœci 2(nyquist)')
figure
plotbode
title('Uk³ad ze wzmocnieniem w obszarze niestabilnoœci 2(bode)')


