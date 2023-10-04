function [] = draw3DFunction(paper, x, y, z)
% Plots a 3D function graph on a specified figure.
% Input:
%   paper (struct): The paper structure containing the figure and axes.
%   x (vector): X-coordinates.
%   y (vector): Y-coordinates.
%   z (matrix): Z-coordinates (function values).

if nargin < 4 || isempty(paper) || isempty(x) || isempty(y) || isempty(z)
    error('To use draw3DFunction, the paper structure, x, y, and z vectors are needed.');
end

% Retrieve the current axes from the paper structure
valha = paper.CurrentAxes;
% Plot the 3D function
plot3(valha, x, y, z);
% surf(valha,x,y,z)
% Set axis positions
% valha.Position = [25, 25, 50, 50];
% Set axis limits
% xlim(valha, [0, paper.width]);
% ylim(valha, [0, paper.height]);
% zlim(valha, [z_min, z_max]);

% valha.YAxisLocation = 'origin';
% valha.XAxisLocation = 'origin';

end
