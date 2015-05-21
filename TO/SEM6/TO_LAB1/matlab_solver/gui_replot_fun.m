function [ ] = gui_replot_fun( static_args )
%GUI_REPLOT_FUN Summary of this function goes here
%   Detailed explanation goes here

    global x_span;
    global y_span;
    global x_idx;
    global y_idx;
    global canvas;
    global opti_fun;

    cla(canvas);
    axis([x_span y_span 0 inf]);
    gui_fun_section_2(canvas,                     ...
                      opti_fun,                   ...
                      x_span(1):0.1:x_span(2),    ...
                      x_idx,                      ...
                      y_span(1):0.1:y_span(2),    ...
                      y_idx,                      ...
                      static_args);
end

