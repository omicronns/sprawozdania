step    = 2;
K       = 1;
numk    = 1;

for i = 1:10
    step = step/2;
    findK
end
gains = K;

step    = 2;
K       = 1;
numk    = 2;
for i = 1:10
    step = step/2;
    findK
end
gains = [gains K];
