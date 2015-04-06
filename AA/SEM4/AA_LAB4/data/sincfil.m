function [samfil] = sincfil(samples,fc,kerper)
%     if nargin < 3
%         kerper = 50;
%     end

kernel=sincker(fc,kerper);
samfil=conv(samples,kernel,'same');

end

