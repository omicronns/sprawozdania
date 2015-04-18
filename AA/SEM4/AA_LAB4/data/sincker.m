function [kernel] = sincker(fc,kerper)
    if nargin < 2
        kerper = 2;
    end
    kernel=sinc(linspace(-kerper,kerper,kerper/fc));
%Blackman
    window= 0.42-0.5*cos(2*pi*linspace(0,1,length(kernel)))+ ...
            0.08*cos(4*pi*linspace(0,1,length(kernel)));

%Hamming
%    window=0.54-0.46*cos(2*pi*linspace(0,1,length(kernel)));

    kernel=kernel.*window;
    kernel=kernel/sum(kernel);
end

