paper = draw3DPaper();

xt(1,:) = sin(t).*cos(10*t);
yt(1,:) = sin(t).*sin(10*t);
zt = cos(t);

draw3DFunction(paper,xt,yt,zt);