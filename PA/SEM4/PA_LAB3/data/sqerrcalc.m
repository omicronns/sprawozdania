function [sqerr] = sqerrcalc(samp1,samp2)

sqerr=sum((samp1-samp2).^2);

end

