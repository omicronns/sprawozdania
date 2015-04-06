function callback_rand(~,~)
% callback_rand:    Generates random starting point

    global nspaces;
    global x0;
    
    x0 = rand(1,nspaces)*2 - 1;
end