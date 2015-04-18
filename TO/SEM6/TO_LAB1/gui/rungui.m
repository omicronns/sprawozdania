close all

% Prepare globals
global max_step;
global x_span;
global y_span;
global nspaces;
global x_opti;
global x0;
global xk;
global x_idx;
global y_idx;
global opti_path;
global max_iters;
global stop_eps;
global canvas;
global opti_fun;
global opti_grad;

% opti_fun    = @(x) sum(x.^2);
% opti_grad   = @(x) 2*x;
opti_fun    = @rbk;
opti_grad   = @rbkgrad;
x_span      = [-1.5 1.5];
y_span      = [-1.5 1.5];
nspaces     = 10;
stop_eps    = 0.0001;
max_iters   = 1000;
max_step    = 0.1;
x_idx       = 1;
y_idx       = 2;
opti_path   = [];
x0          = zeros(1,nspaces);
x_opti      = ones(1,nspaces);

% Buttons properties
buttonX             = 0.02;
buttonY             = 0.7;
buttonWidth         = 0.2;
buttonHeight        = 0.2;
spaceBetweenButtons = 0.001;

% GUI setup
fhandle = figure;
canvas = axes('Position', [0.3 0.1 0.65 0.8]);
hold on;

% Plot section of opti_fun
cla(canvas);
axis([x_span y_span 0 inf]);
xk  = x0;
funsection2(canvas,                     ...
            opti_fun,                   ...
            x_span(1):0.1:x_span(2),    ...
            x_idx,                      ...
            y_span(1):0.1:y_span(2),    ...
            y_idx,                      ...
            x_opti);

% Plot starting point  
x           = x_opti;
x(x_idx)    = xk(x_idx);
x(y_idx)    = xk(y_idx);
plot3(canvas, xk(x_idx), xk(y_idx), opti_fun(x), '*');

button_step = uicontrol(fhandle, 'Style', 'push');
set(button_step, 'String', 'Step');
set(button_step, 'Units', 'normalized');
set(button_step, 'Position', [buttonX buttonY+(buttonHeight/2)+0.05 buttonWidth buttonHeight/2]);
set(button_step, 'CallBack', @callback_step);

button_solve = uicontrol(fhandle, 'Style', 'push');
set(button_solve, 'String', 'Solve');
set(button_solve, 'Units', 'normalized');
set(button_solve, 'Position', [buttonX buttonY+0.05 buttonWidth buttonHeight/2]);
set(button_solve, 'CallBack', @callback_solve);

button_reset = uicontrol(fhandle, 'Style', 'push');
set(button_reset, 'String', 'Reset');
set(button_reset, 'Units', 'normalized');
set(button_reset, 'Position', [buttonX buttonY-(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_reset, 'CallBack', @callback_reset);

button_rand = uicontrol(fhandle, 'Style', 'push');
set(button_rand, 'String', 'Rand x');
set(button_rand, 'Units', 'normalized');
set(button_rand, 'Position', [buttonX buttonY-2*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_rand, 'CallBack', @callback_rand);

button_rand = uicontrol(fhandle, 'Style', 'push');
set(button_rand, 'String', 'Select indexes');
set(button_rand, 'Units', 'normalized');
set(button_rand, 'Position', [buttonX buttonY-3*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_rand, 'CallBack', @callback_selectxy);

button_rand = uicontrol(fhandle, 'Style', 'push');
set(button_rand, 'String', 'Select max step');
set(button_rand, 'Units', 'normalized');
set(button_rand, 'Position', [buttonX buttonY-4*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_rand, 'CallBack', @callback_selectms);

button_rand = uicontrol(fhandle, 'Style', 'push');
set(button_rand, 'String', 'Select max iterations');
set(button_rand, 'Units', 'normalized');
set(button_rand, 'Position', [buttonX buttonY-5*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_rand, 'CallBack', @callback_selectmi);
