compEx1

xtilde{1}=pflat(N1*x{1});

e2 = null(F') % Computes the epipole
e2x = [0 -e2(3) e2(2); e2(3) 0 -e2(1); -e2(2) e2(1) 0];

P1 = [1 0 0 0; 0 1 0 0; 0 0 1 0]

P1n = N1*P1

P2=horzcat(e2x*F, e2)

P2n = N2*P2

spacePoints = [];

zero = [0; 0; 0];
for i=1:2008
   A= [];
   A= vertcat(A, P1n);
   A= vertcat(A, P2n);
   block = [-x1n(:,i) zero;zero  -x2n(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePoints = horzcat(spacePoints, P);
end

spacePoints = pflat(spacePoints);
figure('Name','3D Model','NumberTitle','off')
plot3 (spacePoints (1 ,:) ,spacePoints (2 ,:) , spacePoints (3 ,:) , '. ', 'Markersize',5);
hold on;



hold off;


xproj2 = pflat(P2*spacePoints);
figure;
imshow(im);
hold on;
plot(xproj2(1,:),xproj2(2,:),'*');
plot(x{2}(1,:),x{2}(2,:),'ro');



xproj1 = pflat(P1*spacePoints);
figure;
im1 = imread('kronan1.JPG');
imshow(im1);
hold on;
plot(xproj1(1,:),xproj1(2,:),'*');
plot(x{1}(1,:),x{1}(2,:),'ro');



