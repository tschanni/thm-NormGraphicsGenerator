clear myDim;

%Abmaße auf Kollision mit Koordinatensystem achten (bei Unterschreitung = Fehler)
myDim.x_cm = 25; % Breite des Plotfensters (2 Kästchen = 1 cm)
myDim.y_cm = 22; % Höhe des Plotfensters (2 Kästchen = 1 cm) 

%Ursprung KOS
% Bug: Pfeil verschiebt sich, Skala verschiebt sich nicht mit ! (Nur bei x
% Erst wenn Funktionen geplottet werden, funktioniert es nicht mehr
% -> Wenn Funktion neu positioniert wird
myDim.x_cm_orig =8; % Verschiebung der x - Achse (Koordinatenursprung) (y-Achse wird auf x-Achse verschoben)von linken Rand aus
myDim.y_cm_orig = 5; % Verschiebung der y - Achse (Koordinatenursprung) (x-Achse wird auf y-Achse verschoben)von unteren Rand aus

%Minimum KOS
% Bug: Skala wandert Pfeil aber nicht ! (Nur bei x Verschiebung)
% -> gleicher Grund wie oben
myDim.x_cm_min = 1; % Entfernung vom linken Rand
myDim.y_cm_min = 1; % Entfernung vom unteren Rand

%Maximum KOS
myDim.x_cm_max = 22; % Pfeillaenge
myDim.y_cm_max = 20; % Pfeilhoehe

%Skala Einteilung mit noscale = an0/aus1
myDim.x_scale = 0.5;
myDim.y_scale = 0.5;
% myDim.y_noscale = 1;
% myDim.x_noscale = 1;

%Resolution

%Shift
% myDim.x_shift = -5; % Nullpunkt (0) verschieben in x-Richtung (+ nach links / - nach rechts)
% myDim.y_shift = -1; % Nullpunkt (0) verschieben in y-Richtung

%Label
myDim.x_label = '{\it{t}} / s';
myDim.y_label = '{\it{I}} / A';


% 1 Problem: Nur eine Plotausgabe, nicht möglich mehrere figures zu drawen
% getParam and setParam functions -> keine return values mehr notwendig
% Matlab classes verwenden ?


paper = drawPaper(myDim);

x1 = linspace(0,10);
y1 = 3*x1;
drawFunction(paper,x1,y1,'color','green');

x2 = linspace(0,10);
y2 = cos(x2);
drawFunction(paper,x2,y2,'color','red','linestyle','--');
 
% outdated ?
% arrows1 = [0,0,4,4];
% arrows2 = [0,0,4,0];
% 
% drawArrow(paper,arrows1,"red");
% drawArrow(paper,arrows2,"green");

y3 = sin(x2);
drawFunction(paper,x2,y3);

z1 = 1 + 2i;
drawComplexVector(paper,z1);

z2 = 1 - 2i;
drawComplexVector(paper,z2);

z3 = -1 + 5i;
drawComplexVector(paper,z3);

legend('f(x)=3x','cos(x)','sin(x)');

% % Beispiel-Daten für X, Y und Z 3D Modell
% xt = @(t) exp(-t/10).*sin(5*t);
% yt = @(t) exp(-t/10).*cos(5*t);
% zt = @(t) t;
% 
% 
% % Aufruf der draw3DFunction-Funktion
% draw3DFunction(paper, xt, yt, zt);

%savePlot(paper,"myfirstexample");


