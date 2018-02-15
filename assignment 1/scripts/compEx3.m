close all;
clear;
load('compEx3.mat');
H1 = [sqrt(3) -1 1; 1 sqrt(3) 1; 0 0 2]
H2 = [1 -1 1; 1 1 0; 0 0 1];
H3 = [ 1 1 0; 0 2 0; 0 0 1]; 
H4 = [sqrt(3) -1 1; 1 sqrt(3) 1; 1/4 1/2 2]
spoints = [startpoints; ones(1,42)];
epoints = [endpoints; ones(1,42)];
figure;plot ([ spoints(1 ,:); epoints(1 ,:)] , ...
[ spoints(2 ,:); epoints(2 ,:)] , 'b - ');
axis equal;
stemp = pflat(H1*spoints);
etemp = pflat(H1*epoints);

figure;plot ([ stemp(1 ,:); etemp(1 ,:)] , ...
[ stemp(2 ,:); etemp(2 ,:)] , 'b - ');
axis equal;

stemp = pflat(H2*spoints);
etemp = pflat(H2*epoints);
figure;plot ([ stemp(1 ,:); etemp(1 ,:)] , ...
[ stemp(2 ,:); etemp(2 ,:)] , 'b - ');
axis equal;

stemp = pflat(H3*spoints);
etemp = pflat(H3*epoints);
figure;plot ([ stemp(1 ,:); etemp(1 ,:)] , ...
[ stemp(2 ,:); etemp(2 ,:)] , 'b - ');
axis equal;

stemp = pflat(H4*spoints);
etemp = pflat(H4*epoints);
figure;plot ([ stemp(1 ,:); etemp(1 ,:)] , ...
[ stemp(2 ,:); etemp(2 ,:)] , 'b - ');
axis equal;