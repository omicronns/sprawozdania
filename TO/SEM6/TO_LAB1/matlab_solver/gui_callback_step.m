function gui_callback_step(~,~)
% callback_step: 	Executes one step of optimization algorithm

    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    global opti_grad;
    global max_step;
    
    % Calculate next point
    xk          = solve_minimstep(xk, opti_fun, opti_grad, max_step);
    opti_path   = [opti_path;xk];
    
    % Plot next point
    x           = opti_path(1,:);
    x(x_idx)    = xk(1, x_idx);
    x(y_idx)    = xk(1, y_idx);
    plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), '*')
end