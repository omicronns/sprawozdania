function [samfil] = sincfil(samples,fc)

kernel=sincker(fc,50);
samfil=conv(samples,kernel,'same');

end

