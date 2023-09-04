clear myDim;

%Abmaße auf Kollision mit Koordinatensystem achten (bei Unterschreitung = Fehler)
myDim.x_cm = 15; % Breite des Plotfensters (2 Kästchen = 1 cm)
myDim.y_cm = 10; % Höhe des Plotfensters (2 Kästchen = 1 cm) 

%Ursprung KOS
myDim.x_cm_orig = 1; % Verschiebung der x - Achse (Koordinatenursprung) (y-Achse wird auf x-Achse verschoben)von linken Rand aus
myDim.y_cm_orig = 1; % Verschiebung der y - Achse (Koordinatenursprung) (x-Achse wird auf y-Achse verschoben)von unteren Rand aus

%Minimum KOS
myDim.x_cm_min = 1; % Entfernung vom linken Rand
myDim.y_cm_min = 1; % Entfernung vom unteren Rand

%Maximum KOS
myDim.x_cm_max = 11; % Pfeillaenge
myDim.y_cm_max = 8; % Pfeilhoehe

%Skala Einteilung mit noscale = an0/aus1
myDim.x_scale = 1;
myDim.y_scale = 0.5;
%myDim.y_noscale = 1; 

%Resolution

%Shift
%myDim.x_shift = -1; % Koordinatenursprung (0) verschieben in x-Richtung (+ nach links / - nach rechts)
%myDim.y_shift = 2; % Koordinatenursprung (0) verschieben in y-Richtung

%Label
myDim.x_label = '{\it{t}} / s';
myDim.y_label = '{\it{I}} / A';



%       - hline_ypos (array, optional): Array of horizontal line positions (default is empty).
%       - vline_xpos (array, optional): Array of vertical line positions (default is empty).
%       - x_tickres (double, optional): x-axis tick resolution (default is 0).
%       - y_tickres (double, optional): y-axis tick resolution (default is 0).
%       - arrows (matrix, optional): Matrix of arrow positions [x_start, y_start, x_end, y_end].
%
%       argfile (string, optional): Filename for saving the plot (default is 'test_kos').
%
%       valha (handle, optional): Handle for additional value axes (default is empty).



drawPaper(myDim,'myexample1');