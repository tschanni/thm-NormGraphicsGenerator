function [] = drawFunction(fig,x,y)
%DRAWFUNCTION Summary of this function goes here
%   Detailed explanation goes here

hold on;

valha = fig.CurrentAxes;
x_cm = 20;
y_cm = 15;
x_cm_min = 1;
y_cm_min =1;
x_cm_max =15;
y_cm_max = 13;
x_min = 0 ;
x_max =  7;
y_min = -2;
y_max= 4;    

plot(valha,x,y);
xlim(valha,[x_min,x_max]);
ylim(valha,[y_min,y_max]);
valha.Position = [x_cm_min*1/x_cm y_cm_min*1/y_cm (x_cm_max-x_cm_min)*1/x_cm (y_cm_max-y_cm_min)*1/y_cm];
% set(valha,'xtick',[],'Xcolor','none','box','off');
% set(valha,'ytick',[],'Ycolor','none','box','off');
% set(valha,'Color','none')

hold off;

end

