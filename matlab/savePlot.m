function [] = savePlot(paper,filename)
%SAVEPLOT Summary of this function goes here
%   Detailed explanation goes here

set(paper.fig, 'PaperUnits', 'centimeters'); % set unit to centimeter
set(paper.fig, 'PaperPosition', [0 0 paper.x_cm paper.y_cm]); % position of plot, start 0,0 -> top left corner and the size to x_cm and y_cm
print(filename, '-dpng', '-r300'); % picture export
end

