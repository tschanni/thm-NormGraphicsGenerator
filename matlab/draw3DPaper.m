function [paper] = draw3DPaper()

    x_kos = 0;
    y_kos = 0;
    z_kos = 0;
    
    x_max = 20;
    y_max = 20;
    z_max = 20;
    % Erstelle eine Figur
    paper = figure;
    ax = axes;
    
    ax.XRuler.FirstCrossoverValue  = x_kos; % X crossover with Y axis
    ax.YRuler.FirstCrossoverValue  = y_kos; % Y crossover with X axis
    ax.ZRuler.FirstCrossoverValue  = z_kos; % Z crossover with X axis
    ax.ZRuler.SecondCrossoverValue = z_kos; % Z crossover with Y axis
    set(ax, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin', 'XDir', 'normal','ZDir','normal','YDir','reverse');

    %x-arrow
    X = [0.376  0.92];
    Y = [0.465 0.348];
    han = annotation('arrow',X,Y);
    han.LineWidth = 0.75;
    
    %y-arrow
%     X = [x_cm_orig*1/x_cm x_cm_orig*1/x_cm];
%     Y = [y_cm_min*1/y_cm   (y_cm_max+0.5)*1/y_cm];
%     han = annotation('arrow',X,Y);
%     han.LineWidth = 0.75;


%     line([5, 5], [0, 5], [0, 0], 'Color', 'k', 'LineStyle', '-');
%     line([0, 5], [5, 5], [0, 0], 'Color', 'k', 'LineStyle', '-');
%     line([0, 5], [5, 5], [5, 5], 'Color', 'k', 'LineStyle', '-');
%     line([5, 5], [0, 5], [5, 5], 'Color', 'k', 'LineStyle', '-');

    % Achsenbeschriftungen
    xlabel('X');
    ylabel('Y');
    zlabel('Z');

    % Gitterlinien für die Achsen einschalten
%     grid on;


    % Einstellen der Ansicht für eine isometrische Darstellung
%     daspect([1,1,1]);
    view(ax,[25 30]);  % 3D-Ansicht

    % Achsenlimits setzen
    xlim([x_kos, x_max]);
    ylim([y_kos, y_max]);
    zlim([z_kos, z_max]);
    

    set(gca, 'color', 'none');
    
    outerPos = get(paper, 'OuterPosition');
    innerPos = get(paper, 'innerPosition');
    tpos = ax.Position;
    disp(tpos);
    disp(outerPos);
    disp(innerPos);
    hold on;
end