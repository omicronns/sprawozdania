function gui_callback_selectns(~,~)
% callback_selectms:    Prompts a dialog to specify max iterations count

    global nspaces;
    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    
    ms = inputdlg('Specify max iterations count:');
    if(size(ms) ~= [0 0])
        ms = floor(str2num(ms{1}));
        switch(length(ms))
            case 0
                errordlg('Invalid value');
            case 1
                if(ms >= 2)
                    nspaces = ms;
                    x_idx = 1;
                    y_idx = 2;
    
                    % Clear previous path
                    opti_path   = zeros(1,nspaces);
                    xk          = opti_path(1,:);

                    % Plot section of opti_fun
                    gui_fun_replot(xk);

                    % Plot starting point
                    x           = xk;
                    x(x_idx)    = opti_path(1, x_idx);
                    x(y_idx)    = opti_path(1, y_idx);
                    plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), 'r*')
                else
                    errordlg('Spaces count must be greater than 2');
                end
            otherwise
                errordlg('Specify only one value');
        end
    end
end