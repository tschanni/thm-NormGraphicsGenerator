%   Copyright (c) 2020 Fabian Mink <fabian.mink@gmx.de>
%
%   All rights reserved.
%
%   Redistribution and use in source and binary forms, with or without
%   modification, are permitted provided that the following conditions are met:
%
%   1. Redistributions of source code must retain the above copyright notice, this
%      list of conditions and the following disclaimer.
%   2. Redistributions in binary form must reproduce the above copyright notice,
%      this list of conditions and the following disclaimer in the documentation
%      and/or other materials provided with the distribution.
%
%   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
%   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
%   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
%   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
%   ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
%   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
%   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
%   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
%   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
%   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%

function [] = drawPaper(dim_val, argfile, valha)

%Dimensions
x_cm = dim_val.x_cm;
y_cm = dim_val.y_cm;

%Origin KOS
x_cm_orig = dim_val.x_cm_orig; 
y_cm_orig = dim_val.y_cm_orig;

%Minimum KOS
x_cm_min = dim_val.x_cm_min;
y_cm_min = dim_val.y_cm_min;

%Maximum KOS
x_cm_max = dim_val.x_cm_max;
y_cm_max = dim_val.y_cm_max;

%Scaling
x_noscale = 1;
x_scale = 1;
y_noscale = 1;
y_scale = 1;

%Resolution /cm
x_res = 0.5;
y_res = 0.5;

%Axis shift
x_shift = 0;
y_shift = 0;

if(isfield(dim_val,'x_scale'))
    x_scale = dim_val.x_scale;
    x_noscale = 0;
end
if(isfield(dim_val,'y_scale'))
    y_scale = dim_val.y_scale;
    y_noscale = 0;
end
if(isfield(dim_val,'x_noscale'))
    x_noscale = 1;
end
if(isfield(dim_val,'y_noscale'))
    y_noscale = 1;
end

if(isfield(dim_val,'x_shift'))
    x_shift = dim_val.x_shift;
end

if(isfield(dim_val,'y_shift'))
    y_shift = dim_val.y_shift;
end

if(isfield(dim_val,'x_res'))
    x_res = dim_val.x_res;
end

if(isfield(dim_val,'y_res'))
    y_res = dim_val.y_res;
end

x_label = '';
y_label = '';

if(isfield(dim_val,'x_label'))
    x_label = dim_val.x_label;
end

if(isfield(dim_val,'y_label'))
    y_label = dim_val.y_label;
end

%Horizontal Lines (dashed)
h_pos = [];
v_pos = [];

if(isfield(dim_val,'hline_ypos'))
    h_pos = dim_val.hline_ypos;
end
if(isfield(dim_val,'vline_xpos'))
    v_pos = dim_val.vline_xpos;
end

%Tick resolution
x_tickres = 0;
y_tickres = 0;
if(isfield(dim_val,'x_tickres'))
    x_tickres = dim_val.x_tickres;
end
if(isfield(dim_val,'y_tickres'))
    y_tickres = dim_val.y_tickres;
end


%Arrows 
%todo: Arrow color and head style
arrow_x_start = [];
arrow_y_start = [];
arrow_x_end = [];
arrow_y_end = [];
if(isfield(dim_val,'arrows'))
    arrow_x_start = dim_val.arrows(:,1);
    arrow_y_start = dim_val.arrows(:,2);
    arrow_x_end = dim_val.arrows(:,3);
    arrow_y_end = dim_val.arrows(:,4);
end


%Calc min/max
x_min = x_scale * (x_cm_min-x_cm_orig) + x_shift;
y_min = y_scale * (y_cm_min-y_cm_orig) + y_shift;

%Maximum values
x_max = x_scale * (x_cm_max-x_cm_orig) + x_shift;
y_max = y_scale * (y_cm_max-y_cm_orig) + y_shift;

fh = figure();

v_cm = (v_pos-x_shift) / x_scale + x_cm_orig;
h_cm = (h_pos-y_shift) / y_scale + y_cm_orig;

%Axes for grid and h/v lines
plot([0 0],[0 y_cm],"k--");
hold on;
for iv = 1:length(v_cm)
plot([v_cm(iv) v_cm(iv)],[y_cm_min y_cm_max],"k--");
end
for ih = 1:length(h_cm)
plot([x_cm_min x_cm_max],[h_cm(ih) h_cm(ih)],"k--");
end

%Arrows
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
han.Color = 'k';
han.HeadLength = 10;
%han.HeadStyle = 'vback2';
han.HeadWidth = 5;
end

%axes();
ha = gca();
set(ha,'xtick',0:x_res:x_cm);
set(ha,'ytick',0:y_res:y_cm);
grid on;
xlim([0, x_cm]);
ylim([0, y_cm]);
ha.Position = [0 0 1 1];
set(ha,'Xcolor','none','Ycolor','none','box','off');

%x-arrow
X = [x_cm_min*1/x_cm  (x_cm_max+0.5)/x_cm];
Y = [y_cm_orig*1/y_cm   y_cm_orig*1/y_cm];
han = annotation('arrow',X,Y);
han.LineWidth = 0.75;
%axis label
%dim = [X(2)-0.02 Y(1)-0.00 .1 .1];
Xanno = (x_cm_max+0.5)/x_cm;
Yanno = (y_cm_orig-0.4)*1/y_cm;
dim = [Xanno Yanno .2 .2];
han = annotation('textbox',dim,'String',x_label,'Margin',0,'VerticalAlignment', 'bottom');
han.LineStyle='none';
hold off;

%y-arrow
X = [x_cm_orig*1/x_cm x_cm_orig*1/x_cm];
Y = [y_cm_min*1/y_cm   (y_cm_max+0.5)*1/y_cm];
han = annotation('arrow',X,Y);
han.LineWidth = 0.75;
%axis label
%dim = [X(1) Y(2)-0.05 .1 .1];
Xanno = (x_cm_orig-0.4)*1/x_cm;
Yanno = (y_cm_max+0.6)*1/y_cm;
dim = [Xanno Yanno .2 .2];
han = annotation('textbox',dim,'String',y_label,'Margin',0,'VerticalAlignment', 'bottom');
han.LineStyle='none';

%x-axis
if(~x_noscale)
axes()
xlim([x_min,x_max])
ha = gca();
ha.Position = [x_cm_min*1/x_cm y_cm_orig*1/y_cm (x_cm_max-x_cm_min)*1/x_cm 1];
set(ha,'ytick',[],'Ycolor','none','box','off')
%set(ha,'Color','w')
set(ha,'Color','none')
if(x_tickres)
    set(ha,'xtick',ceil(x_min/x_tickres)*x_tickres:x_tickres:floor(x_max/x_tickres)*x_tickres);
end
end

%y-axis
if(~y_noscale)
axes()
ylim([y_min,y_max])
ha = gca();
ha.Position = [x_cm_orig*1/x_cm y_cm_min*1/y_cm 1 (y_cm_max-y_cm_min)*1/y_cm];
set(ha,'xtick',[],'Xcolor','none','box','off')
%set(ha,'Color','w')
set(ha,'Color','none')
if(y_tickres)
    set(ha,'ytick',ceil(y_min/y_tickres)*y_tickres:y_tickres:floor(y_max/y_tickres)*y_tickres);
end
end

filename = 'test_kos';
if(nargin >= 2)
    filename = argfile;
end

if(nargin >= 3)
    %Value-Axes
    valha = copyobj(valha, fh);
    axes(valha);
    
    %copyobj(hl,valha);
    
    xlim(valha,[x_min,x_max]);
    ylim(valha,[y_min,y_max]);
    valha.Position = [x_cm_min*1/x_cm y_cm_min*1/y_cm (x_cm_max-x_cm_min)*1/x_cm (y_cm_max-y_cm_min)*1/y_cm];
    set(valha,'xtick',[],'Xcolor','none','box','off');
    set(valha,'ytick',[],'Ycolor','none','box','off');
    set(valha,'Color','none')
end

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 x_cm y_cm]); %
print(filename, '-dpng', '-r300');


end


