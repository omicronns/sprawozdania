function [ out ] = v12grad( x )
%V2GRAD Summary of this function goes here
%   Detailed explanation goes here
    out = [ 2*x(1)/(1 - x(1)*x(2)) + x(2)^2*x(1)/((1-x(1)*x(2))^2); ...
            2*x(2) + x(1)^3/((1 - x(1)*x(2))^2)];
end

