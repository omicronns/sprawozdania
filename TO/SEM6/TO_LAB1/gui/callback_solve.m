function callback_solve(~,~)
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
    
    xkp     = xk;
    xk      = minimstep(xk, opti_fun, opti_grad, max_step);
    i       = 0;
    
    while((i < max_iters) && (norm(xk - xkp) > stop_eps))
        i           = i + 1;
        xkp         = xk;
        xk          = minimstep(xk, opti_fun, opti_grad, max_step);
        x           = x_opti;
        x(x_idx)    = xk(x_idx);
        x(y_idx)    = xk(y_idx);
        opti_path   = [opti_path;xk];
        plot3(canvas, xk(x_idx), xk(y_idx), opti_fun(x), '*')
    end
end