function gui_callback_selectxy(~,~)
% callback_selectxy:    Prompts a dialog that allowes to choose indexes of
%                       arguments used to create section plot

    global nspaces;
    global xk;
    global x_idx;
    global y_idx;
    global opti_path;
    global canvas;
    global opti_fun;
    
    options{nspaces} = '';
    for i=1:nspaces
        options{i} = num2str(i);
    end
    
    idx = listdlg(  'PromptString',                                     ...
                    'Choose two indexes of loose arguments to plot',    ...
                    'ListString',                                       ...
                    options);
    switch(length(idx))
        case 0
            return;
        case 2
            x_idx = idx(1);
            y_idx = idx(2);
        otherwise
            errordlg('Choose two indexes');
            return;
    end
    
    % Plot section of opti_fun
    gui_fun_replot(xk);
	
    %Plot opti_path
    pathsize = size(opti_path);
    for it=1:pathsize(1)
        x           = xk;
        x(x_idx)    = opti_path(it, x_idx);
        x(y_idx)    = opti_path(it, y_idx);
        plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), 'r*')
    end
end