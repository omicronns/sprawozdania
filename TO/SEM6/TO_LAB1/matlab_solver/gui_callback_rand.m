function gui_callback_rand(~,~)
% callback_rand:    Generates random starting point and restart solver engine


    global nspaces;
    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    
    % Get new random start point
    opti_path   = rand(1,nspaces)*2 - 1;
    xk          = opti_path(1,:);
    
    % Plot section of opti_fun
    gui_fun_replot(xk);

    % Plot starting point  
    x           = xk;
    x(x_idx)    = xk(x_idx);
    x(y_idx)    = xk(y_idx);
    plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), 'r*')
end