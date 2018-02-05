clear; 
close all;
load('compEx1data.mat');


hold on;
plotcams(P);
plot3 (X (1 ,:) , X (2 ,:) , X (3 ,:) , '. ', 'Markersize' ,2);
hold off;

figure; 
hold on;
axis equal;
im = imread ( imfiles {1 });
imagesc ( im );
visible = isfinite (x{ 1 }(1 ,:));
plot (x {1 }(1 , visible ), x {1 }(2 , visible ), '* ');
xproj = P{1}*X;
xproj = pflat(xproj);
plot ( xproj (1 , visible ) , xproj (2 , visible ), 'ro ' );
hold off;



T1 = [1 0 0 0; 0 4 0 0; 0 0 1 0; 1/10 1/10 0 1];
T2=[1 0 0 0; 0 1 0 0; 0 0 1 0; 1/16 1/16 0 1];
P1 = P{1}*T1;


P1 = cell(1, 9);
P2 = cell(1, 9);


for i = 1:9
    P1{i}= P{i}*T1;
    P2{i}= P{i}*T2;

end

X1 = T1\ X; 
X1 = pflat(X1);
X2 = T2\X;
X2 = pflat(X2);

figure;
hold on;
plotcams(P1);
plot3 (X1 (1 ,:) , X1 (2 ,:) , X1 (3 ,:) , '. ', 'Markersize' ,2);
axis equal
hold off;

figure;
hold on;
plotcams(P2);
plot3 (X2 (1 ,:) , X2 (2 ,:) , X2 (3 ,:) , '. ', 'Markersize' ,2);
axis equal;
hold off;

figure;
hold on;
imagesc ( im );
visible = isfinite (x{ 1 }(1 ,:));
plot (x {1 }(1 , visible ), x {1 }(2 , visible ), '* ');
xproj = P{1}*X1;
xproj = pflat(xproj);
plot ( xproj (1 , visible ) , xproj (2 , visible ), 'ro ' );
axis equal;
hold off;


figure;
hold on;
imagesc ( im );
visible = isfinite (x{ 1 }(1 ,:));
plot (x {1 }(1 , visible ), x {1 }(2 , visible ), '* ');
xproj = P{1}*X2;
xproj = pflat(xproj);
plot ( xproj (1 , visible ) , xproj (2 , visible ), 'ro ' );
axis equal;
hold off;


