function gui_callback_selectmi(~,~)
% callback_selectms:    Prompts a dialog to specify max iterations count

    global max_iters;
    
    ms = floor(str2double(inputdlg('Specify max iterations count:')));
    switch(length(ms))
        case 0
        case 1
            max_iters = ms;
        otherwise
            errordlg('Specify one value');
    end
end