% drawFunction - Plot a function on a grid paper.
%
% Syntax:
%    drawFunction(paper, x, y, varargin)
%
% Input:
%    paper (struct) - The grid paper generated using the drawPaper function.
%    x (vector) - The x-coordinates of the data points to be plotted.
%    y (vector) - The y-coordinates of the data points to be plotted.
%    varargin (optional) - Additional name-value pairs for customizing the plot.
%       - 'color' (char or RGB triplet): The color of the plot (default: 'blue').
%       - 'linestyle' (char): The line style of the plot (default: '-').
%
% Description:
%    This function plots a function on a pre-generated grid paper. You can specify
%    the x and y coordinates of the data points, as well as customize the plot
%    appearance using optional name-value pairs.
%
% Example:
%    % Create a grid paper
%    paper = drawPaper('default',1,'label','{\it{t}} / s','{\it{U}} / V'); % Specify paper dimensions and parameters
%
%    % Define x and y data
%    x_data = linspace(0, 10, 100); % Example x-data
%    y_data = sin(x_data); % Example y-data
%
%    % Customize plot appearance
%    plot_color = 'red'; % Example plot color
%    plot_linestyle = '--'; % Example plot linestyle
%
%    % Plot the function on the grid paper
%    drawFunction(paper, x_data, y_data, 'color', plot_color, 'linestyle', plot_linestyle);
%
% See Also:
%   drawPaper
%   drawComplexVector
%   drawArrow
% 
% For more Information:
%   https://github.com/tschanni/thm-NormGraphicsGenerator
%
function [] = drawFunction(paper,x,y,varargin)
    %DRAWFUNCTION Summary of this function goes here
    %   Detailed explanation goes here

    %default values
    color = "blue";
    linestyle = "-";
    
    if (nargin < 3 || isempty(paper))
        error('to use the drawFunction the return value of drawPaper, a x - Vector and a y - Vector is needed');
    end
    if nargin > 3
        starting_arg = 1;
        for iCount = starting_arg:numel(varargin)
            switch lower(varargin{iCount})
                case 'color'
                    iCount = iCount + 1;
                    color = varargin{iCount};
                case 'linestyle'
                    iCount = iCount + 1;
                    linestyle = varargin{iCount};
            end
        end
        
        
    end
        
    valha = paper.fig.CurrentAxes;
    
    x_cm = paper.x_cm;
    y_cm = paper.y_cm;
    x_cm_min = paper.x_cm_min;
    y_cm_min = paper.y_cm_min;
    x_cm_max = paper.x_cm_max;
    y_cm_max = paper.y_cm_max;

    x_min =  paper.x_min;
    x_max =  paper.x_max;
    y_min = paper.y_min;
    y_max= paper.y_max;  
    
    pl = line(valha,x,y);
    xlim(valha,[x_min,x_max]);
    ylim(valha,[y_min,y_max]);
    valha.Position = [x_cm_min*1/x_cm y_cm_min*1/y_cm (x_cm_max-x_cm_min)*1/x_cm (y_cm_max-y_cm_min)*1/y_cm];
    valha.YAxisLocation = 'origin';
    valha.XAxisLocation = 'origin';
    pl.Color = color;
    pl.LineStyle = linestyle;
   
end

