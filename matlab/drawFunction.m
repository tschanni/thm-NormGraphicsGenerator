function [] = drawFunction(fig,x,y)
%DRAWFUNCTION Summary of this function goes here
%   Detailed explanation goes here

hold on;

ax = fig.CurrentAxes;

plot(ax,x,y);

% Automatisch Achsenlimits festlegen
xlim(ax,[0,7]);

hold off;
end

