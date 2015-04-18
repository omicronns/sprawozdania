function callback_selectms(~,~)
% callback_selectms:    Prompts a dialog to specify max algorith step

    global max_step;
    
    ms = str2double(inputdlg('Specify max algorithm step:'));
    switch(length(ms))
        case 0
        case 1
            max_step = ms;
        otherwise
            errordlg('Specify one value');
    end
end