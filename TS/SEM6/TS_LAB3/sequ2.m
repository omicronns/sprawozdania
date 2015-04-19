function [ out ] = sequ2( x )
%RS1 Summary of this function goes here
%   Detailed explanation goes here
    out = [x(2) - x(1) + x(1)^3; -x(1)];
end

