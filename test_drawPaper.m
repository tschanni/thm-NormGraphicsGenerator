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

clear myDim;

%Abmaße
myDim.x_cm = 15;
myDim.y_cm = 12;

%Ursprung KOS
myDim.x_cm_orig = 1; 
myDim.y_cm_orig = 3;

%Minimum KOS
myDim.x_cm_min = 0.5;
%myDim.y_cm_min = 0.5;
myDim.y_cm_min = 3.5;
myDim.x_shift = 1;
myDim.y_shift = 2;

%Maximum KOS
myDim.x_cm_max = 13.5;
myDim.y_cm_max = 11;

%Scaling
myDim.x_scale = 1;
myDim.y_scale = 0.5;
%myDim.y_noscale = 1;

myDim.x_label = '{\it{t}} / s';
myDim.y_label = '{\it{I}} / A';


myDim.arrows = [2.5,3,3.5,4.5];

x = plot([1,2, 3, 4],[1,4, 5, 2]);
hold on;
y = plot([1,2, 3, 4],[2,3, -1, 1],'r-');


%quiver(2,3.5,1,1,0,'b-','MaxHeadSize',0.1) %Last element is scale -> 0 to have correct length
%hq = quiver(2,3.5,4,0,0,'b-','MaxHeadSize',0.1) %Last element is scale -> 0 to have correct length
%hq = quiver(2,3.5,1,10,0,'b-','MaxHeadSize',0.1); %Last element is scale -> 0 to have correct length
%drawArrow([2,5],[3.5 4.5],{'Color','b','LineWidth',1});
%annotation('arrow',[0.5 0.2],[0.2 0.4]);

%plot([1 2], [3.5 4.5]);
%plot([1 2], [3.5 4.5], 'r<');
%plot([1 1], [5 6], 'r<');

hold off;
ah = gca();

drawPaper(myDim,'testfile',ah);



