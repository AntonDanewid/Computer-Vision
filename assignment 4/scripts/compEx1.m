clear;
close all;
load('compEx1data.mat')
im1=imread('house1.jpg');
im2=imread('house2.jpg');
X = pflat(X);


 meanX=mean(X,2);
 Xtilde=(X-repmat(meanX,[1 size(X,2)]));
 M= Xtilde(1:3,:)*Xtilde(1:3,:)' ;

 [V,D]=eig(M);
  abc=V(:,1);
    d= -abc'*meanX(1:3);
    plane=[abc; d];
    plane = plane ./ norm(plane(1:3));
    RMS=sqrt(sum((plane'*X).^2)/size(X ,2))



best_inliers = [];
best_plane = [];


for i = 1:100
    randind = randi(length(X),[3 1]);

    plane = null (X (: ,randind)');
    plane = plane ./ norm ( plane (1:3));
    inliers = abs ( plane'* X ) <= 0.1;
    if(sum(inliers) > sum(best_inliers))
        best_inliers = inliers;
        best_plane = plane;
    end
    

end
plane = best_plane;
inliers = best_inliers;
sum(inliers)

points = X(:, inliers);

RMS = sqrt(sum((plane'*points).^2)/size(points ,2))
hist ( abs (plane'*points),100);



xproj1 = pflat(P{1}*points);
xproj2 = pflat(P{2}*points);



figure;
imshow(im1);

hold on; 

plot(xproj1(1,:), xproj1(2,:), '*', 'Markersize', 8);
hold off;


figure;
imshow(im2);

hold on; 
plot(xproj2(1,:), xproj2(2,:), '*', 'Markersize', 8);

hold off;


P1n = K\P{1};
P2n = K\P{2};

a = pflat(P1n*X);

b = pflat(P2n*X);



pi = pflat(plane);
R = P2n(1:3,1:3);
t = P2n(:,4);

H = (R-t*pi(1:3)');

homography = pflat(H*a);

a = K*homography
b = K*b;




figure;
imshow(im2);
hold on
plot(a(1,:),a(2,:),'ro');
plot(b(1,:),b(2,:),'b+');
hold off
