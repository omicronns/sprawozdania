function [ out ] = rbkgrad_num( x )
%RBKGRAD_NUM Summary of this function goes here
%   Detailed explanation goes here
    gradstep = 0.00001;
    out = zeros(size(x));
    for it=1:length(x)
        dirstep = zeros(size(x));
        dirstep(it) = gradstep;
        out(it) = (rbk(x + dirstep) - rbk(x))/gradstep;
    end
end

