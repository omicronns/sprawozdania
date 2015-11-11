function [ y ] = amax( coofs, u, n )
    y = zeros(length(u),1);
    for it=1:length(y)
        for itn=1:n
            if(it-itn > 0)
                y(it) = y(it) - coofs(itn)*y(it-itn) + coofs(itn+n)*u(it-itn);
            end
        end
    end
end
