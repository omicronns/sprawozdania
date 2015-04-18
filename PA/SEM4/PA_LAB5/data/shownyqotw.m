function [f, ax] = shownyqotw(k,Ti,Td)
[GotL GotM]=oltr(k,Ti,Td);
[real imag]=nyquist(GotL,GotM,{0.9,100});
f=figure(1);
ax=axes;
plot(real,imag)
grid
hold on
plot(-1,0,'+r')
xlabel(ax,'Real [-]')
ylabel(ax,'Imaginary [-]')
magnifyOnFigure(f,  'initialPositionSecondaryAxes', [300 200 100 100], ...
                    'initialPositionMagnifier',     [465 340 30 30])
                    %'magnifierShape', 'ellipse');
hold off