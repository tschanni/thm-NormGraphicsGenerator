paper = drawPaper('default',1,'x_label','real','y_label','imag','x_scale',1,'y_scale',1);

arrows1 = [0,0,1,-1.5];
arrows2 = [0,0,2,3];
arrows3 = [1,-1.5,2,3];

drawArrow(paper,arrows1,"red");
drawArrow(paper,arrows2,"green");
drawArrow(paper,arrows3,"blue");


z1 = - 1 + 1.5i;
drawComplexVector(paper,z1);

z2 = - 2 - 3i;
drawComplexVector(paper,z2);

% z3 = -1 + 1i;
% drawComplexVector(paper,z3);

savePlot(paper,"example2");