function gui_callback_reset(~,~)
% callback_reset:   Restart solver engine



    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    
    % Clear previous path
    opti_path   = [opti_path(1,:)];
    xk          = opti_path(1,:);
    
    % Plot section of opti_fun
    gui_fun_replot(xk);
    
    % Plot starting point
    x           = xk;
    x(x_idx)    = opti_path(1, x_idx);
    x(y_idx)    = opti_path(1, y_idx);
    plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), 'r*')
end