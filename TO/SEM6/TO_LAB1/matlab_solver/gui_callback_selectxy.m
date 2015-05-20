function gui_callback_selectxy(~,~)
% callback_selectxy:    Prompts a dialog that allowes to choose indexes of
%                       arguments used to create section plot

    global nspaces;
    global x_span;
    global y_span;
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
        case 2
            x_idx = idx(1);
            y_idx = idx(2);
        otherwise
            errordlg('Choose only two indexes');
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
    for it=1:pathsize(1)
        x           = xk;
        x(x_idx)    = opti_path(it, x_idx);
        x(y_idx)    = opti_path(it, y_idx);
        plot3(canvas, x(1, x_idx), x(1, y_idx), opti_fun(x), '*')
    end
end