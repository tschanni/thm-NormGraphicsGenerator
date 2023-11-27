% Example to draw a fully customized paper with matlab tag/value system

paper = drawPaper('x_scale',1,'y_scale',0.5,'x_cm',12,'y_cm',7,'x_cm_max',11,'y_cm_max',6,'x_cm_min',1,'y_cm_min',1,'x_cm_orig',1,'y_cm_orig',4,'x_label','t/ms','y_label','u / utr');

% create a sine wave
x = linspace(0,9.5);
y = sin(x);
drawFunction(paper,x,y);
% create a sawtooth wave
y2 = sawtooth(x);
drawFunction(paper,x,y2,'color','green');
% create a squre wave
y3 = square(x);
drawFunction(paper,x,y3,'color','red');
