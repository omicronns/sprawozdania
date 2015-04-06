function callback_selectxy(~,~)
% callback_selectxy:    Prompts a dialog that allowes to choose indexes of
%                       arguments used to create section plot

    global x_idx;
    global y_idx;
    global nspaces;
    
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
end