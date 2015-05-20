close all
clear all

% Prepare globals
global max_step;
global x_span;
global y_span;
global nspaces;
global xk;
global x_idx;
global y_idx;
global opti_path;
global max_iters;
global stop_eps;
global canvas;
global opti_fun;
global opti_grad;

% Assign parameters
opti_fun    = @rbk;             % Function handle to be optimized
opti_grad   = @rbkgrad_num;     % Function gradient handle
x_span      = [-1.5 1.5];       % Peek argument x (one of peek spaces) span
y_span      = [-1.5 1.5];       % Peek argument y (one of peek spaces) span
nspaces     = 10;               % Number of spaces to optimize
                                % Note: opti_fun and opti_grad must accept
                                %       nspaces lenght vectors
stop_eps    = 0.001;            % First stop condition parameter
max_iters   = 1000;             % Second stop condition parameter
max_step    = 0.1;              % Maximum step of algorithm
x_idx       = 1;                % Init x space index to peek
y_idx       = 2;                % Init y space index to peek
opti_path   = zeros(1,nspaces); % Vector that will contain optimization history
xk          = opti_path(1,:);   % Init start point

% Buttons properties
buttonX             = 0.02;
buttonY             = 0.7;
buttonWidth         = 0.2;
buttonHeight        = 0.15;
spaceBetweenButtons = 0.001;

% Setup figure
fhandle = figure('Name', 'Solver', 'NumberTitle', 'off');
set(fhandle, 'Position', [100 100 800 600]);
canvas = axes('Position', [0.3 0.1 0.65 0.8]);
hold on;

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

% Plot starting point
plot3(canvas, xk(x_idx), xk(y_idx), opti_fun(xk), '*');

% Setup GUI
button_step = uicontrol(fhandle, 'Style', 'push');
set(button_step, 'String', 'Step');
set(button_step, 'Units', 'normalized');
set(button_step, 'Position', [buttonX buttonY+(buttonHeight/2)+0.05 buttonWidth buttonHeight/2]);
set(button_step, 'CallBack', @gui_callback_step);
set(button_step, 'tooltip', ['Execute one step of algorithm and ' ...
                             'present results on the plot']);

button_solve = uicontrol(fhandle, 'Style', 'push');
set(button_solve, 'String', 'Solve');
set(button_solve, 'Units', 'normalized');
set(button_solve, 'Position', [buttonX buttonY+0.05 buttonWidth buttonHeight/2]);
set(button_solve, 'CallBack', @gui_callback_solve);
set(button_solve, 'tooltip', ['Execute algorithm until one of stop ' ...
                              'conditions is met']);

button_reset = uicontrol(fhandle, 'Style', 'push');
set(button_reset, 'String', 'Reset');
set(button_reset, 'Units', 'normalized');
set(button_reset, 'Position', [buttonX buttonY-(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_reset, 'CallBack', @gui_callback_reset);
set(button_reset, 'tooltip', ['Reset starting point']);

button_rand = uicontrol(fhandle, 'Style', 'push');
set(button_rand, 'String', 'Rand x');
set(button_rand, 'Units', 'normalized');
set(button_rand, 'Position', [buttonX buttonY-2*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_rand, 'CallBack', @gui_callback_rand);
set(button_rand, 'tooltip', ['Pick new random starting point']);

button_selectst = uicontrol(fhandle, 'Style', 'push');
set(button_selectst, 'String', 'Start x');
set(button_selectst, 'Units', 'normalized');
set(button_selectst, 'Position', [buttonX buttonY-3*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_selectst, 'CallBack', @gui_callback_start);
set(button_selectst, 'tooltip', ['Enter new starting point']);

button_selectxy = uicontrol(fhandle, 'Style', 'push');
set(button_selectxy, 'String', 'Select indexes');
set(button_selectxy, 'Units', 'normalized');
set(button_selectxy, 'Position', [buttonX buttonY-4*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_selectxy, 'CallBack', @gui_callback_selectxy);
set(button_selectxy, 'tooltip', ['Pick spaces indexes to peek']);

button_selectms = uicontrol(fhandle, 'Style', 'push');
set(button_selectms, 'String', 'Select max step');
set(button_selectms, 'Units', 'normalized');
set(button_selectms, 'Position', [buttonX buttonY-5*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_selectms, 'CallBack', @gui_callback_selectms);
set(button_selectms, 'tooltip', ['Pick max algorithm step size']);

button_selectmi = uicontrol(fhandle, 'Style', 'push');
set(button_selectmi, 'String', 'Select max iterations');
set(button_selectmi, 'Units', 'normalized');
set(button_selectmi, 'Position', [buttonX buttonY-6*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_selectmi, 'CallBack', @gui_callback_selectmi);
set(button_selectmi, 'tooltip', ['Pick max algorithm iterations count']);

button_selectep = uicontrol(fhandle, 'Style', 'push');
set(button_selectep, 'String', 'Select epsilon');
set(button_selectep, 'Units', 'normalized');
set(button_selectep, 'Position', [buttonX buttonY-7*(buttonHeight/2+spaceBetweenButtons) buttonWidth buttonHeight/2]);
set(button_selectep, 'CallBack', @gui_callback_selectep);
set(button_selectep, 'tooltip', ['Pick max function value decrement ' ...
                                 'which will not stop algorithm ']);

set(fhandle,'toolbar','figure');
