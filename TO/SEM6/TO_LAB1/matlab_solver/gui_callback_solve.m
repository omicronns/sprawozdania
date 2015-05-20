function gui_callback_solve(~,~)
% callback_solve: 	Executes optimization algorithm until stop condition

    global x_span;
    global y_span;
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
        opti_path   = [opti_path;xk];
        i           = i + 1;
        xkp         = xk;
        xk          = solve_minimstep(xk, opti_fun, opti_grad, max_step);
    end
    
    % Plot section of opti_fun
    cla(canvas);
    axis([x_span y_span 0 inf]);
    gui_funsection2(canvas,                     ...
                    opti_fun,                   ...
                    x_span(1):0.1:x_span(2),    ...
                    x_idx,                      ...
                    y_span(1):0.1:y_span(2),    ...
                    y_idx,                      ...
                    xk);

    %Plot opti_path
    pathsize = size(opti_path);
    for it=1:1:pathsize(1)
        x           = xk;
        x(x_idx)    = opti_path(it, x_idx);
        x(y_idx)    = opti_path(it, y_idx);
        plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), '*')
    end
    
    if(i < max_iters)
        msgbox(['Epsilon criterium halted, eps=' num2str(abs(opti_fun(xk) - opti_fun(xkp)))])
    else
        msgbox(['Iteration criterium halted iters=' num2str(i)])
    end
end