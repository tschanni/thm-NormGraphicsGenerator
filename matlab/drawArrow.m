function [] = drawArrow(paper,arrowpos,color)
%DRAWARROW Summary of this function goes here
%   Detailed explanation goes here

x_shift = paper.x_shift;
y_shift = paper.y_shift;
x_scale = paper.x_scale;
y_scale = paper.y_scale;
x_cm_orig = paper.x_cm_orig;
y_cm_orig = paper.y_cm_orig;
x_cm = paper.x_cm;
y_cm = paper.y_cm;

% arrow_x_start = [];
% arrow_y_start = [];
% arrow_x_end = [];
% arrow_y_end = [];
arrow_x_start = arrowpos(:,1);
arrow_y_start = arrowpos(:,2);
arrow_x_end = arrowpos(:,3);
arrow_y_end = arrowpos(:,4);


%arrowpos
for iar = 1:length(arrow_x_start)
arrow_x_start_cm = (arrow_x_start(iar)-x_shift) / x_scale + x_cm_orig;
arrow_y_start_cm = (arrow_y_start(iar)-y_shift) / y_scale + y_cm_orig;
arrow_x_end_cm = (arrow_x_end(iar)-x_shift) / x_scale + x_cm_orig;
arrow_y_end_cm = (arrow_y_end(iar)-y_shift) / y_scale + y_cm_orig;
%plot([arrow_x_start_cm(iar) arrow_x_end_cm(iar)],[arrow_y_start_cm(iar) arrow_y_end_cm(iar)],"k-");
X = [arrow_x_start_cm/x_cm  arrow_x_end_cm/x_cm];
Y = [arrow_y_start_cm/y_cm   arrow_y_end_cm/y_cm];
han = annotation('arrow',X,Y);
%han.LineWidth = 0.1;
han.LineStyle = '-';
han.Color = color;
han.HeadLength = 10;
%han.HeadStyle = 'vback2';
han.HeadWidth = 5;
end


end

