clear myDim;

%Abmaße auf Kollision mit Koordinatensystem achten (bei Unterschreitung = Fehler)
myDim.x_cm = 20; % Breite des Plotfensters (2 Kästchen = 1 cm)
myDim.y_cm = 15; % Höhe des Plotfensters (2 Kästchen = 1 cm) 

%Ursprung KOS
myDim.x_cm_orig = 1; % Verschiebung der x - Achse (Koordinatenursprung) (y-Achse wird auf x-Achse verschoben)von linken Rand aus
myDim.y_cm_orig = 1; % Verschiebung der y - Achse (Koordinatenursprung) (x-Achse wird auf y-Achse verschoben)von unteren Rand aus

%Minimum KOS
myDim.x_cm_min = 1; % Entfernung vom linken Rand
myDim.y_cm_min = 1; % Entfernung vom unteren Rand

%Maximum KOS
myDim.x_cm_max = 15; % Pfeillaenge
myDim.y_cm_max = 13; % Pfeilhoehe

%Skala Einteilung mit noscale = an0/aus1
myDim.x_scale = 0.5;
myDim.y_scale = 0.5;
%myDim.y_noscale = 1; 

%Resolution

%Shift
%myDim.x_shift = -1; % Nullpunkt (0) verschieben in x-Richtung (+ nach links / - nach rechts)
myDim.y_shift = -2; % Nullpunkt (0) verschieben in y-Richtung

%Label
myDim.x_label = '{\it{t}} / s';
myDim.y_label = '{\it{I}} / A';


% Problem: Skalierung des Plots stimmt nicht mit kariertem Grid überein


fig = drawPaper(myDim);
% x1 = 0:pi/100:2*pi;
x1 = linspace(0,10);
y1 = x1;
drawFunction(fig,x1,y1);
x2 = linspace(0,10);
y2 = cos(x2);
drawFunction(fig,x2,y2);
