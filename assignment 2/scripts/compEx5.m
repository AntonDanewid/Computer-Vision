clear;
compEx3;
close all;
compEx4;

spacePoints = [];
x1 = [x1; ones(1,257)];
x2 = [x2; ones(1,257)];








zero = [0; 0; 0];
for i=1:257
   A= [];
   A= vertcat(A, P1);
   A= vertcat(A, P2);
   block = [-x1(:,i) zero;zero  -x2(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( V (1:4) ,[1 4])'
   spacePoints = horzcat(spacePoints, P);
end

xproj1 = pflat ( P1 * spacePoints );
xproj2 = pflat ( P2 * spacePoints );



plot (xproj1(1 ,:) , xproj1 (2 ,:),'. ', 'Markersize' ,20);
hold off;

figure;
im2 = imread ('cube2.jpg');
hold on;
imagesc ( im2 );
plot (xproj2 (1 ,:) , xproj2 (2 ,:) , '. ' , 'MarkerSize', 20)

