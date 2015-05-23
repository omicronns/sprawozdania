function gui_callback_selectep(~,~)
% callback_selectms:    Prompts a dialog to specify max algorith step

    global stop_eps;
    
    ms = inputdlg('Specify max epsilon:');
    if(size(ms) ~= [0 0])
        ms = str2num(ms{1});
        switch(length(ms))
            case 0
                errordlg('Invalid value');
            case 1
                stop_eps = ms;
            otherwise
                errordlg('Specify only one value');
        end
    end
end