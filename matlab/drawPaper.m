% drawPaper - Generate a grid paper with custom parameters
%
% Syntax:
%    paper = drawPaper(dimensions)
%    paper = drawPaper('default',value,'label',xlabel,ylabel)
%
% Input:
%    dimensions - Structure containing dimensions and parameters of the paper.
%                 Required fields:
%                 - x_cm: Width of the paper in centimeters
%                 - y_cm: Height of the paper in centimeters
%                 - x_cm_orig: x-coordinate of the coordinate origin
%                 - y_cm_orig: y-coordinate of the coordinate origin
%                 - x_cm_min: Minimum x-coordinate of the paper
%                 - y_cm_min: Minimum y-coordinate of the paper
%                 - x_cm_max: Maximum x-coordinate of the paper
%                 - y_cm_max: Maximum y-coordinate of the paper
%
%    default    - default 1: 8 x 8 cm Grid Paper with 0.5 scale
%               - default 2: 16 x 8 cm Grid Paper with 0.5 scale
%               - default 3: 25 x 22 cm Grid Paper with 0.5 scale
%
% Name-Value Pairs (optional):
%    - 'x_scale': Scaling factor for the x-axis (default: 1)
%    - 'y_scale': Scaling factor for the y-axis (default: 1)
%    - 'x_noscale': Specifies whether to hide the x-axis scale (0 or 1, default: 0)
%    - 'y_noscale': Specifies whether to hide the y-axis scale (0 or 1, default: 0)
%    - 'x_shift': Shift of the x-coordinate origin position (default: 0)
%    - 'y_shift': Shift of the y-coordinate origin position (default: 0)
%    - 'x_res': Resolution of the grid paper in the x-direction (default: 0.5)
%    - 'y_res': Resolution of the grid paper in the y-direction (default: 0.5)
%    - 'x_tickres': Resolution of x-axis tick marks (default: 0)
%    - 'y_tickres': Resolution of y-axis tick marks (default: 0)
%    - 'x_label': Label for the x-axis (default: empty string)
%    - 'y_label': Label for the y-axis (default: empty string)
%
% Output:
%    paper - A structure containing information about the created paper.
%            You can use this structure to place additional drawings on the
%            paper. 
% See Also:
%   drawFunction
%   drawComplexVector
%   drawArrow
% 
% For more Information:
%   https://github.com/tschanni/thm-NormGraphicsGenerator

function [paper] = drawPaper(varargin) 

    % default values
    selector = 0;
    starting_arg = 1;
    x_label = '';
    y_label = '';
    h_pos = [];
    v_pos = [];
    dim_val.init = 0;
    arg.init = 0;
    %Scaling
    x_noscale = 0;
    x_scale = 1;
    y_noscale = 0;
    y_scale = 1;

    %Resolution /cm
    x_res = 0.5;
    y_res = 0.5;
    x_tickres = 0;
    y_tickres = 0;

    %Axis shift
    x_shift = 0;
    y_shift = 0;

    if ischar(varargin{1})
        for iCount = starting_arg:numel(varargin)
            switch lower(varargin{iCount})
                case 'default'
                    iCount = iCount + 1;
                    selector = varargin{iCount};
                case 'x_label'
                    iCount = iCount + 1;
                    x_label = varargin{iCount};
                case 'y_label'
                    iCount = iCount + 1;
                    y_label = varargin{iCount};
                case 'x_scale'
                    iCount = iCount + 1;
                    arg.x_scale = varargin{iCount};                
                case 'y_scale'
                    iCount = iCount + 1;
                    arg.y_scale = varargin{iCount};                    
                case 'x_shift'
                    iCount = iCount + 1;
                    arg.x_shift = varargin{iCount};         
                case 'y_shift'
                    iCount = iCount + 1;
                    arg.y_shift = varargin{iCount};    
                case 'x_cm'
                    iCount = iCount + 1;
                    arg.x_cm = varargin{iCount};      
                case 'y_cm'
                    iCount = iCount + 1;
                    arg.y_cm = varargin{iCount};               
                case 'x_cm_max'
                    iCount = iCount + 1;
                    arg.x_cm_max = varargin{iCount};              
                case 'y_cm_max'
                    iCount = iCount + 1;
                    arg.y_cm_max = varargin{iCount};  
                case 'x_cm_min'
                    iCount = iCount + 1;
                    arg.x_cm_min = varargin{iCount};              
                case 'y_cm_min'
                    iCount = iCount + 1;
                    arg.y_cm_min = varargin{iCount};  
            end 
        end
    end

    if selector == 0
        dim_val = varargin{1,1};
        % Value Initialisation dim_val
        %Dimensions 
        x_cm = dim_val.x_cm; %required
        y_cm = dim_val.y_cm; %required

        if(x_cm <= 0 || y_cm <= 0)
            error("Value of the dimensions cant be negative or zero!");
        end

        %Origin KOS
        x_cm_orig = dim_val.x_cm_orig; %required
        y_cm_orig = dim_val.y_cm_orig; %required

        if(x_cm_orig > x_cm || y_cm_orig > y_cm)
            error("Origin of the COS outreached the dimensions");
        end

        %Minimum KOS
        x_cm_min = dim_val.x_cm_min; %required
        y_cm_min = dim_val.y_cm_min; %required

        if(x_cm_min <= 0 ||y_cm_min <= 0)
            error("Value of the minimum COS variable cant be negative or zero!")
        end

        %Maximum KOS
        x_cm_max = dim_val.x_cm_max; %required
        y_cm_max = dim_val.y_cm_max; %required

        if(x_cm_max >= x_cm || y_cm_max >= y_cm)
            error("Value of the maximum COS variable outreached the dimensions");
        end 

    end
    
    if selector == 1
        x_cm = 8;
        y_cm = 8; 
        x_cm_orig =4; 
        y_cm_orig = 4; 
        x_cm_min = 1; 
        y_cm_min = 1; 
        x_cm_max = 7; 
        y_cm_max = 7; 
        x_scale = 0.5;
        y_scale = 0.5;
    elseif selector == 2
        x_cm = 16;
        y_cm = 8; 
        x_cm_orig =8; 
        y_cm_orig = 4; 
        x_cm_min = 1; 
        y_cm_min = 1; 
        x_cm_max = 15; 
        y_cm_max = 7; 
        x_scale = 0.5;
        y_scale = 0.5;
    elseif selector == 3
        x_cm = 25;
        y_cm = 22;
        x_cm_orig = 8;
        y_cm_orig = 5;
        x_cm_min = 1; 
        y_cm_min = 1; 
        x_cm_max = 22; 
        y_cm_max = 20; 
        x_scale = 0.5;
        y_scale = 0.5;    
    end
    % check if certain fields are present in dim_val and overrides the default values accordingly

    if(isfield(dim_val,'x_scale'))
        x_scale = dim_val.x_scale;
        if(x_scale <= 0)
            error("scale value cant be negative or zero");
        end
        x_noscale = 0;
    elseif(isfield(arg,'x_scale'))
        x_scale = arg.x_scale;
        if(x_scale <= 0)
            error("scale value cant be negative or zero");
        end
    end
    if(isfield(dim_val,'y_scale'))
        y_scale = dim_val.y_scale;
        if(y_scale <= 0)
            error("scale value cant be negative or zero");
        end
        y_noscale = 0;
    elseif(isfield(arg,'y_scale'))
        y_scale = arg.y_scale;
        if(x_scale <= 0)
            error("scale value cant be negative or zero");
        end
    end
    if(isfield(dim_val,'x_noscale'))
        if(dim_val.x_noscale == 1)
            x_noscale = 1; % noscale = 1 (true) -> Skala wird nicht angezeigt
        end
        if(x_noscale ~= 0 || x_noscale ~= 1)
            error("x_noscale need to be set to 1 (true) or 0 (false)");
        end
    end
    if(isfield(dim_val,'y_noscale'))
        if(dim_val.y_noscale == 1)
            y_noscale = 1;
        end
        if(y_noscale ~= 0 || y_noscale ~= 1)
            error("y_noscale need to be set to 1 (true) or 0 (false)");
        end
    end

    if(isfield(dim_val,'x_shift'))
        x_shift = dim_val.x_shift;
    elseif(isfield(arg,'x_shift'))
        x_shift = arg.x_shift;
    end

    if(isfield(dim_val,'y_shift'))
        y_shift = dim_val.y_shift;
    elseif(isfield(arg,'y_shift'))
        y_shift = arg.y_shift;
    end

    if(isfield(dim_val,'x_res'))
        x_res = dim_val.x_res;
    end

    if(isfield(dim_val,'y_res'))
        y_res = dim_val.y_res;
    end

    if(isfield(dim_val,'x_label'))
        x_label = dim_val.x_label;
    end

    if(isfield(dim_val,'y_label'))
        y_label = dim_val.y_label;
    end

    if(isfield(arg,'x_cm'))
        x_cm = arg.x_cm;
    end
    
    if(isfield(arg,'y_cm'))
        y_cm = arg.y_cm;
    end
    
    if(isfield(arg,'x_cm_max'))
        x_cm_max = arg.x_cm_max;
    end
    
    if(isfield(arg,'y_cm_max'))
        y_cm_max = arg.y_cm_max;
    end
    
    if(isfield(arg,'x_cm_min'))
        x_cm_min = arg.x_cm_min;
    end
    
    if(isfield(arg,'y_cm_min'))
        y_cm_min = arg.y_cm_min;
    end

    %Horizontal Lines (dashed) 
    if(isfield(dim_val,'hline_ypos'))
        h_pos = dim_val.hline_ypos;
    end
    if(isfield(dim_val,'vline_xpos'))
        v_pos = dim_val.vline_xpos;
    end

    %Tick resolution
    if(isfield(dim_val,'x_tickres'))
        x_tickres = dim_val.x_tickres;
    end
    if(isfield(dim_val,'y_tickres'))
        y_tickres = dim_val.y_tickres;
    end

% End of Initialisation

%Calc min/max
x_min = x_scale * (x_cm_min-x_cm_orig) + x_shift;
y_min = y_scale * (y_cm_min-y_cm_orig) + y_shift;

%Maximum values
x_max = x_scale * (x_cm_max-x_cm_orig) + x_shift;
y_max = y_scale * (y_cm_max-y_cm_orig) + y_shift;

% for dashed line
v_cm = (v_pos-x_shift) / x_scale + x_cm_orig;
h_cm = (h_pos-y_shift) / y_scale + y_cm_orig;

% Plot of vertical dashed line
% Axes for grid and h/v lines
plot([0 0],[0 y_cm],"k--");
hold on;
for iv = 1:length(v_cm)
    plot([v_cm(iv) v_cm(iv)],[y_cm_min y_cm_max],"k--");
end
for ih = 1:length(h_cm)
    plot([x_cm_min x_cm_max],[h_cm(ih) h_cm(ih)],"k--");
end

%x-arrow
X = [x_cm_min*1/x_cm  (x_cm_max+0.5)/x_cm];
Y = [y_cm_orig*1/y_cm   y_cm_orig*1/y_cm];
han = annotation('arrow',X,Y);
han.LineWidth = 0.75;

%y-arrow
X = [x_cm_orig*1/x_cm x_cm_orig*1/x_cm];
Y = [y_cm_min*1/y_cm   (y_cm_max+0.5)*1/y_cm];
han = annotation('arrow',X,Y);
han.LineWidth = 0.75;

%axis x-label
%dim = [X(2)-0.02 Y(1)-0.00 .1 .1];
Xanno = (x_cm_max+0.5)/x_cm;
Yanno = (y_cm_orig-0.4)*1/y_cm;
dim = [Xanno Yanno .2 .2];
han = annotation('textbox',dim,'String',x_label,'Margin',0,'VerticalAlignment', 'bottom');
han.LineStyle='none';
hold off;

%axis y-label
%dim = [X(1) Y(2)-0.05 .1 .1];
Xanno = (x_cm_orig-0.4)*1/x_cm;
Yanno = (y_cm_max+0.6)*1/y_cm;
dim = [Xanno Yanno .2 .2];
han = annotation('textbox',dim,'String',y_label,'Margin',0,'VerticalAlignment', 'bottom');
han.LineStyle='none';

%axes() plot grid plaid paper;
ha = gca();
set(ha,'xtick',0:x_res:x_cm);
set(ha,'ytick',0:y_res:y_cm);
grid on;
xlim([0, x_cm]);
ylim([0, y_cm]);
ha.Position = [0 0 1 1];
set(ha,'Xcolor','none','Ycolor','none','box','off');


%x-axis scale print 
if(~x_noscale)
axes()
xlim([x_min,x_max])
ha = gca();
ha.Position = [x_cm_min*1/x_cm y_cm_orig*1/y_cm (x_cm_max-x_cm_min)*1/x_cm 1];
set(ha,'ytick',[],'Ycolor','none','box','off')
%set(ha,'Color','w')
set(ha,'Color','none')
if(x_tickres)
    set(ha,'xtick',ceil(x_min/x_tickres)*x_tickres:x_tickres:floor(x_max/x_tickres)*x_tickres);
end
end

%y-axis scale print
if(~y_noscale)
axes()
ylim([y_min,y_max])
ha = gca();
ha.Position = [x_cm_orig*1/x_cm y_cm_min*1/y_cm 1 (y_cm_max-y_cm_min)*1/y_cm];
set(ha,'xtick',[],'Xcolor','none','box','off')
set(ha,'Color','none')
if(y_tickres)
    set(ha,'ytick',ceil(y_min/y_tickres)*y_tickres:y_tickres:floor(y_max/y_tickres)*y_tickres);
end
end


% return values to work with the grid
paper.fig = gcf;
paper.x_cm = x_cm;
paper.y_cm = y_cm;
paper.x_cm_min = x_cm_min;
paper.x_cm_max = x_cm_max;
paper.y_cm_min = y_cm_min;
paper.y_cm_max = y_cm_max;
paper.x_min = x_min;
paper.y_min = y_min;
paper.x_max = x_max;
paper.y_max = y_max;
paper.x_shift = x_shift;
paper.y_shift = y_shift;
paper.x_scale = x_scale;
paper.y_scale = y_scale;
paper.x_cm_orig = x_cm_orig;
paper.y_cm_orig = y_cm_orig;


end


