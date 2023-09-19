function drawComplexVector(paper,z)
% Plots a complex number as a vector in a complex plane.
% Input:
%   z (complex number): The complex number to be plotted.
hold on;

ax = paper.fig.CurrentAxes;

% Extract real and imaginary parts of the complex number
realPart = real(z);
imagPart = imag(z);

% Plot the real and imaginary parts as vectors
quiver(ax,0, 0, realPart, imagPart, 0);

% % Calculate the magnitude of the complex number
% magnitude = abs(z);
% 
% % Plot a circle around the vector
% rectangle(ax, 'Position', [-magnitude, -magnitude, 2 * magnitude, 2 * magnitude],...
%     'Curvature', [1, 1]);

hold off;
end
