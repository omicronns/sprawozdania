function [ zeros ] = nyquistrealaxiszeros( G )
%NYQUISTREALAXISZEROS Summary of this function goes here
%   Detailed explanation goes here
    [ren imn wn]=nyquist(G);
    re = ren(1,:);
    im = imn(1,:);
    zeros = re(findzeros(im));
end

