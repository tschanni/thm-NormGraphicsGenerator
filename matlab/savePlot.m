% savePlot - Save a plot to a file with specified dimensions.
%
% Syntax:
%    savePlot(paper, filename)
%
% Input:
%    paper (struct) - The grid paper structure obtained using the drawPaper function.
%    filename (char) - The name of the file to which the plot will be saved.
%
% Description:
%    This function saves a plot to a file in PNG format with specified dimensions.
%    You should provide the pre-generated grid paper structure (paper) and the
%    desired filename (including the file extension .png).
%
% Example:
%    % Create a grid paper
%    paper = drawPaper(struct('x_cm', 20, 'y_cm', 15, ...)); % Specify paper dimensions and parameters
%
%    % Plot something on the grid paper
%    % ...
%
%    % Save the plot to a file
%    savePlot(paper, 'my_plot.png'); % Specify the desired filename
%
% See Also:
%   drawFunction
%   drawComplexVector
%   drawArrow
%   drawPaper
% 
% For more Information:
%   https://github.com/tschanni/thm-NormGraphicsGenerator
%
function [] = savePlot(paper,filename)
%SAVEPLOT Summary of this function goes here
%   Detailed explanation goes here

set(paper.fig, 'PaperUnits', 'centimeters'); % set unit to centimeter
set(paper.fig, 'PaperPosition', [0 0 paper.x_cm paper.y_cm]); % position of plot, start 0,0 -> top left corner and the size to x_cm and y_cm
print(filename, '-dpng', '-r300'); % picture export
end

