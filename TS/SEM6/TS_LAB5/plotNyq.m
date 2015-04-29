function [] = plotNyq( sys )
    figure
    hold on
    [amp phase]=simNyq(sys, 0.1);
    lastpt=[cos(phase) sin(phase)]*amp;
    for omega=0.1:0.1:100
        [amp phase]=simNyq(sys, omega);
        newpt=[cos(phase) sin(phase)]*amp;
        plot([lastpt(1) newpt(1)],[lastpt(2) newpt(2)])
        lastpt=newpt;
    end
end

