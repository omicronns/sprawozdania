function gui_callback_reset(~,~)
% callback_reset:   Restart solver engine

    global x_span;
    global y_span;
    global x_opti;
    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    
    
    % Clear previous path
    opti_path   = [opti_path(1,:)];
    
    % Plot section of opti_fun
    cla(canvas);
    axis([x_span y_span 0 inf]);
    gui_funsection2(canvas,                     ...
                    opti_fun,                   ...
                    x_span(1):0.1:x_span(2),    ...
                    x_idx,                      ...
                    y_span(1):0.1:y_span(2),    ...
                    y_idx,                      ...
                    x_opti);

    % Plot starting point  
    xk          = opti_path(1,:);
    x           = x_opti;
    x(x_idx)    = xk(x_idx);
    x(y_idx)    = xk(y_idx);
    plot3(canvas, xk(x_idx), xk(y_idx), opti_fun(x), '*');
end