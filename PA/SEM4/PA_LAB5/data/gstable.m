function [isstable] = gstable(Mtr)

neg = 0;

if Mtr(1) < 0
    Mtr = Mtr * (-1);
end

for i=2:length(Mtr)
    if Mtr(i) <= 0
        neg = 1;
    end
end

if neg == 1
    isstable = 0;
    return
end

minors=hurmin(Mtr);

neg = 0;

for i=1:(length(minors)-1)
    if minors(i) <= 0
        isstable = 1;
        return
    end
end

isstable = 2;