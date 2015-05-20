function gui_callback_step(~,~)
% callback_step: 	Executes one step of optimization algorithm

    global x_opti;
    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    global opti_grad;
    global max_step;
    
    xk          = solve_minimstep(xk, opti_fun, opti_grad, max_step);
    x           = x_opti;
    x(x_idx)    = xk(x_idx);
    x(y_idx)    = xk(y_idx);
    opti_path   = [opti_path;xk];
    plot3(canvas, xk(x_idx), xk(y_idx), opti_fun(x), '*')
end