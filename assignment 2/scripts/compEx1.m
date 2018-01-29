load('compEx1data.mat');
hold on;
axis equal;

plotcams(P);
%im = imread ( imfiles {1 });
%imagesc ( im );
%visible = isfinite (x{ 1 }(1 ,:));
%plot3 (X (1 ,:) , X (2 ,:) , X (3 ,:) , '. ', 'Markersize' ,2);

%plot (x {1 }(1 , visible ), x {1 }(2 , visible ), '* ');
%xproj = P{1}*X;
%xproj = pflat(xproj);
%plot ( xproj (1 , visible ) , xproj (2 , visible ), 'ro ' );


T1 = [1 0 0 0; 0 4 0 0; 0 0 1 0; 1/10 1/10 0 1];
T2=[1 0 0 0; 0 1 0 0; 0 0 1 0; 1/16 1/16 0 1];
%P1 = P*T1;
%P2 = P*T2;

X1 = inv(T1) * X; 

X2 = inv(T2) * X;

plot3 (X2 (1 ,:) , X2 (2 ,:) , X2 (3 ,:) , '. ', 'Markersize' ,2);
