function gui_callback_start(~,~)
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
    
    % Get new start point
    ms = inputdlg('Specify start point:');
    if(size(ms) ~= [0 0])
        ms = str2num(ms{1});
        if(size(ms) == [1 nspaces])
            opti_path = ms;
        elseif(size(ms) ~= [0 0])
            errordlg('Wrong point dimensions');
        end
    end
    xk	= opti_path(1,:);
    
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
    x(x_idx)    = opti_path(1, x_idx);
    x(y_idx)    = opti_path(1, y_idx);
    plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), '*')
    
end