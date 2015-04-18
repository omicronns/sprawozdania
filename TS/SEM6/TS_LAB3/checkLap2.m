function [ ok, l, att, natt, nst ] = checkLap2( eps, v, vgrad, rs )
%CHECKLAP Summary of this function goes here
%   Detailed explanation goes here
    step    = 0.1;
    ok      = true;
    space   = [0:step:eps];
    space   = [space -space(2:length(space))];
    xk      = [0 0];
    l       = inf;
    att     = [];
    natt    = [];
    nst     = [];
    if(v(xk) == 0)
        atttmp = [0 0];
        for ii=1:length(space)
            for iii=1:length(space)
                xk = [space(ii) space(iii)];
                if(norm(xk) ~= 0)
                    if(v(xk) <= 0 || (vgrad(xk)')*rs(xk) >= 0)
                        ok = false;
                        nst = [nst; xk];
                        ltmp = v(xk);
                        if(ltmp < l)
                            l = ltmp;
                        end
                    else
                        atttmp = [atttmp; xk];
                    end
                end
            end
        end
        for ii=1:length(atttmp)
            if(v(atttmp(ii,:)) > l)
                natt = [natt; atttmp(ii,:)];
            else
                att = [att; atttmp(ii,:)];
            end
        end
    else
        ok = false;
    end
end

