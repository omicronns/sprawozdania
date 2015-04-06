function callback_reset(~,~)
% callback_reset:   Prepares axes and variables to run optimization
%                   algorithm

    global x_span;
    global y_span;
    global x0;
    global x_opti;
    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    
    % Clear previous path
    opti_path   = [];
    
    % Plot section of opti_fun
    cla(canvas);
    axis([x_span y_span 0 inf]);
    xk  = x0;
    funsection2(canvas,                     ...
                opti_fun,                   ...
                x_span(1):0.1:x_span(2),    ...
                x_idx,                      ...
                y_span(1):0.1:y_span(2),    ...
                y_idx,                      ...
                x_opti);

    % Plot starting point  
    x           = x_opti;
    x(x_idx)    = xk(x_idx);
    x(y_idx)    = xk(y_idx);
    plot3(canvas, xk(x_idx), xk(y_idx), opti_fun(x), '*');
end