% drawComplexVector - Plot a complex number as a vector in a complex plane.
%
% Syntax:
%    drawComplexVector(paper, z)
%
% Input:
%    paper (struct) - The grid paper generated using the drawPaper function.
%    z (complex number) - The complex number to be plotted.
%
% Description:
%    This function plots a complex number as a vector in a complex plane on a
%    pre-generated grid paper.
%
% Example:
%    % Create a grid paper
%    paper = drawPaper('default',1,'label','real','imag'); % Specify paper dimensions and parameters
%
%    % Define a complex number
%    z = 3 + 4i; % Example complex number
%
%    % Plot the complex number as a vector on the grid paper
%    drawComplexVector(paper, z);
%
% See Also:
%   drawFunction
%   drawPaper
%   drawArrow
% 
% For more Information:
%   https://github.com/tschanni/thm-NormGraphicsGenerator

function drawComplexVector(paper,z)
hold on;

ax = paper.fig.CurrentAxes;
x_min =  paper.x_min;
x_max =  paper.x_max;
y_min = paper.y_min;
y_max= paper.y_max;
x_cm = paper.x_cm;
y_cm = paper.y_cm;
x_cm_min = paper.x_cm_min;
y_cm_min = paper.y_cm_min;
x_cm_max = paper.x_cm_max;
y_cm_max = paper.y_cm_max;

% Extract real and imaginary parts of the complex number
realPart = real(z);
imagPart = imag(z);

% Plot the real and imaginary parts as vectors
h = quiver(ax, 0, 0, realPart, imagPart, 0);
set(h,'MaxHeadSize',1/abs(z),'AutoScaleFactor',1); % continious headsize

xlim(ax,[x_min,x_max]);
ylim(ax,[y_min,y_max]);
ax.Position = [x_cm_min*1/x_cm y_cm_min*1/y_cm (x_cm_max-x_cm_min)*1/x_cm (y_cm_max-y_cm_min)*1/y_cm];
ax.YAxisLocation = 'origin';
ax.XAxisLocation = 'origin';

% % Calculate the magnitude of the complex number
% magnitude = abs(z);
% 
% % Plot a circle around the vector
% rectangle(ax, 'Position', [-magnitude, -magnitude, 2 * magnitude, 2 * magnitude],...
%     'Curvature', [1, 1]);

hold off;
end
