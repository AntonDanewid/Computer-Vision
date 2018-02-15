clear;
compEx3;
close all;
compEx4;
%Add ones
spacePoints = [];
x11 = [x1; ones(1,257)];
x21 = [x2; ones(1,257)];







%Build the dlt
zero = [0; 0; 0];
for i=1:257
   A= [];
   A= vertcat(A, P1);
   A= vertcat(A, P2);
   block = [-x11(:,i) zero;zero  -x21(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePoints = horzcat(spacePoints, P);
end





xproj1 = pflat ( P1 * spacePoints );
xproj2 = pflat ( P2 * spacePoints );


figure('Name','Im1 Non Normalized','NumberTitle','off')
im1 = imread ('cube1.jpg');
hold on;
imagesc ( im1 );
plot (xproj1(1 ,:) , xproj1 (2 ,:), 'ro ' );
plot (x1(1 ,:) , x1 (2 ,:), '*' );

hold off;

figure('Name','Im2 Non Normalized','NumberTitle','off')

im2 = imread ('cube2.jpg');
hold on;
imagesc ( im2 );
plot (xproj2(1 ,:) , xproj2 (2 ,:), 'ro ' );
plot (x2(1 ,:) , x1 (2 ,:), '*' );








x1N = P1inner\x11;
x2N = P2inner\x21;
P1n = P1inner\P1;
P2n = P2inner\P2;




%Build the dlt
spacePointsN= [];
zero = [0; 0; 0];
for i=1:257
   M= [];
   M= vertcat(A, P1n);
   M= vertcat(A, P2n);
   block = [-x1N(:,i) zero;zero  -x2N(:,i)];
   M = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePointsN = horzcat(spacePointsN, P);
end

xproj1N = pflat (P1n * spacePointsN );
xproj2N = pflat (P2n * spacePointsN );



figure('Name','Im1 Normalized','NumberTitle','off')
hold on;
plot (xproj1N(1 ,:) , xproj1N (2 ,:), 'ro ' );
plot (x1N(1 ,:) , x1N (2 ,:), '*' );


figure('Name','Im2 Normalized','NumberTitle','off')

hold on;
plot (xproj2N(1 ,:) , xproj2N (2 ,:), 'ro ' );
plot (x2N(1 ,:) , x2N (2 ,:), '*' );









good_points = ( sqrt ( sum (( x1 - xproj1 (1:2 ,:)).^2)) < 3 & ...
sqrt ( sum (( x2 - xproj2 (1:2 ,:)).^2)) < 3);











% Finds the points with reprojection error less than 3 pixels in both images
spacePoints = spacePoints (: , good_points );

figure('Name','3D Model','NumberTitle','off')
hold on;
plot3 (spacePoints (1 ,:) ,spacePoints (2 ,:) , spacePoints (3 ,:) , '. ', 'Markersize',5);

P1pos = pflat(null(P1));
p1dir=P1(3 ,1:3)/norm( P1(3 ,1:3));

P2pos = pflat(null(P2));
p2dir=P2(3 ,1:3)/norm( P2(3 ,1:3));


plot3 (P1pos (1 ,:) ,P1pos (2 ,:) , P1pos (3 ,:) , '. ', 'Markersize',20);
quiver3 (P1pos(1) , P1pos(2) , P1pos(3) , p1dir(1) , p1dir(2) , p1dir(3) , 5);
plot3 (P2pos (1 ,:) ,P2pos (2 ,:) , P2pos (3 ,:) , '. ', 'Markersize',20);

quiver3 (P2pos(1) , P2pos(2) , P2pos(3) , p2dir(1) , p2dir(2) , p2dir(3) , 5); 
hold off;





