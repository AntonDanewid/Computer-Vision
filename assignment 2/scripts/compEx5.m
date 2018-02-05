clear;
compEx3;
close all;
compEx4;

spacePoints = [];
x11 = [x1; ones(1,257)];
x21 = [x2; ones(1,257)];








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
plot (xproj1(1 ,:) , xproj1 (2 ,:),'. ', 'Markersize' ,20);
hold off;

figure('Name','Im2 Non Normalized','NumberTitle','off')

im2 = imread ('cube2.jpg');
hold on;
imagesc ( im2 );
plot (xproj2 (1 ,:) , xproj2 (2 ,:) , '. ' , 'MarkerSize', 20)


good_points = ( sqrt ( sum (( x1 - xproj1 (1:2 ,:)).^2)) < 3 & ...
sqrt ( sum (( x2 - xproj2 (1:2 ,:)).^2)) < 3);











% Finds the points with reprojection error less than 3 pixels in both images
spacePoints = spacePoints (: , good_points );

figure('Name','3D Model','NumberTitle','off')
hold on;
plot3 (spacePoints (1 ,:) ,spacePoints (2 ,:) , spacePoints (3 ,:) , '. ', 'Markersize',20);

P1pos = pflat(null(P1));
p1dir=P1(3 ,1:3)/norm( P1(3 ,1:3));

P2pos = pflat(null(P2));
p2dir=P2(3 ,1:3)/norm( P2(3 ,1:3));


plot3 (P1pos (1 ,:) ,P1pos (2 ,:) , P1pos (3 ,:) , '. ', 'Markersize',20);
quiver3 (P1pos(1) , P1pos(2) , P1pos(3) , p1dir(1) , p1dir(2) , p1dir(3) , 5);
plot3 (P2pos (1 ,:) ,P2pos (2 ,:) , P2pos (3 ,:) , '. ', 'Markersize',20);

quiver3 (P2pos(1) , P2pos(2) , P2pos(3) , p2dir(1) , p2dir(2) , p2dir(3) , 5); 

