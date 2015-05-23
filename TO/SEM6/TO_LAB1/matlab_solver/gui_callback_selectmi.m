function gui_callback_selectmi(~,~)
% callback_selectms:    Prompts a dialog to specify max iterations count

    global max_iters;
    
    ms = inputdlg('Specify max iterations count:');
    if(size(ms) ~= [0 0])
        ms = floor(str2num(ms{1}));
        switch(length(ms))
            case 0
                errordlg('Invalid value');
            case 1
                max_iters = ms;
            otherwise
                errordlg('Specify only one value');
        end
    end
end