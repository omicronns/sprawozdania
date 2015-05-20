function gui_callback_rand(~,~)
% callback_rand:    Generates random starting point and restart solver engine

    global x_span;
    global y_span;
    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    global nspaces;
    
    % Get new random start point
    opti_path       = rand(1,nspaces)*2 - 1;
    xk              = opti_path(1,:);
    
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

    % Plot starting point  
    x           = xk;
    x(x_idx)    = xk(x_idx);
    x(y_idx)    = xk(y_idx);
    plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), '*')
end