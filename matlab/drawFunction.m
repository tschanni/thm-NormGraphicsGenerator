function [] = drawFunction(fig,dim_val,x,y)
%DRAWFUNCTION Summary of this function goes here
%   Detailed explanation goes here

hold on;

valha = fig.CurrentAxes;

x_cm = dim_val.x_cm;%20;%von dim
y_cm = dim_val.y_cm;%15;%von dim
x_cm_min = dim_val.x_cm_min;%1;%von dim
y_cm_min = dim_val.y_cm_min;%1;%von dim
x_cm_max = dim_val.x_cm_max;%15;%von dim
y_cm_max = dim_val.y_cm_max;%13;%von dim

XLims = xlim;
disp(XLims(2))
YLims = get(valha,'YLim');
% disp(YLims)

x_min =  XLims(1);%calculated XLim: [0 7]
x_max =  7;%calculated XLim: [0 7]
y_min = YLims(1);%calculated YLim: [-2 4]
y_max= YLims(2);%calculated YLim: [-2 4]

plot(valha,x,y);
xlim(valha,[x_min,x_max]);
ylim(valha,[y_min,y_max]);
valha.Position = [x_cm_min*1/x_cm y_cm_min*1/y_cm (x_cm_max-x_cm_min)*1/x_cm (y_cm_max-y_cm_min)*1/y_cm];
% set(valha,'xtick',[],'Xcolor','none','box','off');
% set(valha,'ytick',[],'Ycolor','none','box','off');
% set(valha,'Color','none')
% get(valha)

hold off;

end

