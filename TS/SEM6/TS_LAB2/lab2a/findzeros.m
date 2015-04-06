function [ index ] = findzeros( x )
%FINDZEROS Summary of this function goes here
%   Detailed explanation goes here
    index = [];
    for i = 1:(length(x) - 1)
       if(x(i)*x(i+1) < 0 || x(i) == 0)
           index = [index i];
       end
    end
end

