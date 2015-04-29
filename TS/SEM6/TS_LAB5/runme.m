tf1=tf(5,[1 1]);
plotNyq(tf1)
hold on
nyquist(tf1)
hold off
title('tf1')
tf2=tf([5 0],[1 1 1]);
plotNyq(tf2)
hold on
nyquist(tf2)
hold off
title('tf2')
tf3=tf([1 0],[1 1 2 1]);
plotNyq(tf3)
hold on
nyquist(tf3)
hold off
title('tf3')
