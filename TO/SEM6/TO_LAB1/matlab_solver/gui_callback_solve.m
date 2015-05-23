function gui_callback_solve(~,~)
% callback_solve: 	Executes optimization algorithm until stop condition

    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    global opti_grad;
    global max_iters;
    global stop_eps;
    
    i       = 0;
    xkp     = xk;
    xk      = solve_minimstep(xk, opti_fun, opti_grad);
    
    while((i < max_iters) && (abs(opti_fun(xk) - opti_fun(xkp)) > stop_eps))
        opti_path   = [opti_path;xk];
        i           = i + 1;
        xkp         = xk;
        xk          = solve_minimstep(xk, opti_fun, opti_grad);
    end
    
    % Plot section of opti_fun
    gui_fun_replot(xk);

    %Plot opti_path
    pathsize = size(opti_path);
    for it=1:1:pathsize(1)
        x           = xk;
        x(x_idx)    = opti_path(it, x_idx);
        x(y_idx)    = opti_path(it, y_idx);
        plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), 'r*')
    end
    
    if(i < max_iters)
        msgbox(['Epsilon criterium halted, eps=' num2str(abs(opti_fun(xk) - opti_fun(xkp)))])
    else
        msgbox(['Iteration criterium halted iters=' num2str(i)])
    end
end