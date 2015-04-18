function [ ok att, natt ] = checkLap2( eps, v, vgrad, rs )
%CHECKLAP Summary of this function goes here
%   Detailed explanation goes here
    step    = 0.1;
    ok      = true;
    space   = [0:step:eps];
    space   = [space -space(2:length(space))];
    xk      = [0 0];
    natt    = [];
    if(v(xk) == 0)
        att = [0 0];
        for ii=1:length(space)
            for iii=1:length(space)
                xk = [space(ii) space(iii)];
                if(norm(xk) ~= 0)
                    if(v(xk) <= 0)
                        ok = false;
                        natt = [natt; xk];
                    elseif((vgrad(xk)')*rs(xk) >= 0)
                        ok = false;
                        natt = [natt; xk];
                    else
                        att = [att; xk];
                    end
                end
            end
        end
    else
        ok = false;
    end
end

