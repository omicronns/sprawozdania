function [ o ] = conParam( x, con )
    if(x < con(1) || x > con(2))
        o = 0;
    else
        o = x;
    end
end

