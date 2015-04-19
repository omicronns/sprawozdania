function [ l, att, natt, nst, ndn ] = checkLap2( eps, dom, v, vgrad, sequ )
%CHECKLAP2 Checks stability of non linear system
% eps   - space to be checked
% dom   - function handle that returns boolean true if x is in domain false
%         otherwise
% v     - Lapunow function handle
% vgrad - Lapunow function gradient handle
% sequ  - state equation handle
%
% l     - contour threshold
% att   - attraction set
% natt  - undetermined attraction set
% nst   - unstable points set
% ndn   - set of points not in domain
    step    = 0.1;
    ok      = true;
    space   = [0:step:eps];
    space   = [space -space(2:length(space))];
    xk      = [0 0];
    l       = inf;
    att     = [];
    natt    = [];
    nst     = [];
    ndn     = [];
    if(v(xk) == 0)
        atttmp = [0 0];
        for ii=1:length(space)
            for iii=1:length(space)
                xk = [space(ii) space(iii)];
                if(norm(xk) ~= 0)
                    if(dom(xk))
                        if(v(xk) <= 0 || (vgrad(xk)')*sequ(xk) >= 0)
                            nst = [nst; xk];
                            ltmp = v(xk);
                            if(ltmp < l)
                                l = ltmp;
                            end
                        else
                            atttmp = [atttmp; xk];
                        end
                    else
                        ndn = [ndn; xk];
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
    end
end

