function gui_callback_selectms(~,~)
% callback_selectms:    Prompts a dialog to specify max algorith step

    global max_step;
    
    ms = inputdlg('Specify max algorithm step:');
    if(size(ms) ~= [0 0])
        ms = str2num(ms{1});
        switch(length(ms))
            case 0
            case 1
                max_step = ms;
            otherwise
                errordlg('Specify only one value');
        end
    end
end