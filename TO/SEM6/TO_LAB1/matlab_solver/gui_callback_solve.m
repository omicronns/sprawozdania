function gui_callback_solve(~,~)
% callback_solve: 	Executes optimization algorithm until stop condition

    global x_opti;
    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    global opti_grad;
    global max_step;
    global max_iters;
    global stop_eps;
    
    i       = 0;
    xkp     = xk;
    xk      = solve_minimstep(xk, opti_fun, opti_grad, max_step);
    
    while((i < max_iters) && (abs(opti_fun(xk) - opti_fun(xkp)) > stop_eps))
        x           = x_opti;
        x(x_idx)    = xk(x_idx);
        x(y_idx)    = xk(y_idx);
        opti_path   = [opti_path;xk];
        plot3(canvas, xk(x_idx), xk(y_idx), opti_fun(x), '*')

        i           = i + 1;
        xkp         = xk;
        xk          = solve_minimstep(xk, opti_fun, opti_grad, max_step);
    end
end