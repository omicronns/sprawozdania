function [ out ] = rbk( x )
%RBK Summary of this function goes here
%   Detailed explanation goes here
    out = 0;
    for it=1:(length(x) - 1)
        out = out + (1 - x(it))^2 + 100*(x(it + 1) - x(it)^2)^2;
    end
end

