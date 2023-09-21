function [] = drawFunction(paper,x,y,varargin)
    %DRAWFUNCTION Summary of this function goes here
    %   Detailed explanation goes here

    % setPaper und getPaper Function ?

    color = "blue";
    linestyle = "-";
    
    if (nargin < 3 || isempty(paper))
        error('to use the drawFunction the return value of drawPaper, a x - Vector and a y - Vector is needed');
    end
    if nargin > 3
        starting_arg = 1;
        for iCount = starting_arg:numel(varargin)
            switch lower(varargin{iCount})
                case 'color'
                    iCount = iCount + 1;
                    color = varargin{iCount};
                case 'linestyle'
                    iCount = iCount + 1;
                    linestyle = varargin{iCount};
            end
        end
        
        
    end
        
    valha = paper.fig.CurrentAxes;
    
    x_cm = paper.x_cm;
    y_cm = paper.y_cm;
    x_cm_min = paper.x_cm_min;
    y_cm_min = paper.y_cm_min;
    x_cm_max = paper.x_cm_max;
    y_cm_max = paper.y_cm_max;

    x_min =  paper.x_min;
    x_max =  paper.x_max;
    y_min = paper.y_min;
    y_max= paper.y_max;  
    
    pl = line(valha,x,y);
    xlim(valha,[x_min,x_max]);
    ylim(valha,[y_min,y_max]);
    valha.Position = [x_cm_min*1/x_cm y_cm_min*1/y_cm (x_cm_max-x_cm_min)*1/x_cm (y_cm_max-y_cm_min)*1/y_cm];
    valha.YAxisLocation = 'origin';
    valha.XAxisLocation = 'origin';
    pl.Color = color;
    pl.LineStyle = linestyle;
    
% Da nun die line funktion genutzt wird braucht man den workaround nicht
% mehr
%     set(valha,'xtick',[],'Xcolor','none','box','off');
%     set(valha,'ytick',[],'Ycolor','none','box','off');
%     set(valha,'Color','none');

    

end

