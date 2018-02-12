load('compEx3.mat');
H1 = [sqrt(3) -1 1; 1 sqrt(3) 1; 0 0 2]
H2 = [1 -1 1; 1 1 0; 0 0 1];
H3 = [ 1 1 0; 0 2 0; 0 0 1]; 
H4 = [sqrt(3) -1 1; 1 sqrt(3) 1; 1/4 1/2 2]
spoints = [startpoints; ones(1,42)];
epoints = [endpoints; ones(1,42)];
stemp = H1*spoints;
etemp = H1*epoints;

figure;plot ([ stemp(1 ,:); etemp(1 ,:)] , ...
[ stemp(2 ,:); etemp(2 ,:)] , 'b - ');
axis equal;

stemp = H2*spoints;
etemp = H2*epoints;
figure;plot ([ stemp(1 ,:); etemp(1 ,:)] , ...
[ stemp(2 ,:); etemp(2 ,:)] , 'b - ');
axis equal;

stemp = H3*spoints;
etemp = H3*epoints;
figure;plot ([ stemp(1 ,:); etemp(1 ,:)] , ...
[ stemp(2 ,:); etemp(2 ,:)] , 'b - ');
axis equal;

stemp = H4*spoints;
etemp = H4*epoints;
figure;plot ([ stemp(1 ,:); etemp(1 ,:)] , ...
[ stemp(2 ,:); etemp(2 ,:)] , 'b - ');
axis equal;