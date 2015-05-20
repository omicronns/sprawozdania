function [ newsys ] = modifySys( sys )
    sysNum = sys.num{1};
    sysDen = sys.den{1};
    for it=1:length(sysNum)
        sysNum(it) = sysNum(it)*(rand() + 0.1)*10;
    end
    for it=1:length(sysDen)
        sysDen(it) = sysDen(it)*(rand() + 0.1)*10;
    end
    newsys = tf(sysNum, sysDen);
end

