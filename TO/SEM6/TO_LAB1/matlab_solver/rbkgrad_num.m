function [ out ] = rbkgrad_num( x )
%RBKGRAD_NUM Gradient of rbk function(computed numerically)
    gradstep = 0.00001;
    out = zeros(size(x));
    for it=1:length(x)
        dirstep = zeros(size(x));
        dirstep(it) = gradstep;
        out(it) = (rbk(x + dirstep) - rbk(x))/gradstep;
    end
end

