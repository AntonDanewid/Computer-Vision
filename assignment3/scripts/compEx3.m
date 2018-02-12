clear;
close all;
load('compEx3data.mat');
load('compEx1data.mat');

x1 = x{1};
x2 = x{2};


x1n = K\x1; 
x2n = K\x2;

M = [];
for i= 1:2008 
    
    block = [];
   
%     block = horzcat(block, [x1n(1,i)*x2n(1, i) x1n(1,i)*x2n(2, i) x1n(1,i)*x2n(3, i) x1n(2,i)*x2n(1, i) x1n(2,i)*x2n(2, i) x1n(2,i)*x2n(3, i) x1n(3,i)*x2n(1, i) x1n(3,i)*x2n(2, i) x1n(3,i)*x2n(3, i)]);
%                                                                                   
%         
%     M = vertcat(M, block);
    xx = x2n (:,i)* x1n (:,i)';
    M(i ,:) = xx (:)'; 
    
           
           
end
   


[U ,S ,V] = svd ( M );

v =  V(:,end);
norm(M*v)


Eapprox = reshape(v, [3,3]);
[U,S,V] = svd(Eapprox);

[U ,S ,V] = svd ( Eapprox );



if det(U*transpose(V)) >0
E = U* diag ([1 1 0])* V'
else
V = -V;
E = U* diag ([1 1 0])* V'
end


x2n(:,1)'*E*x1n(:,1)
E = E./E(3, 3);
F=K'\E/K;

F = F./F(3, 3)

figure;
hold on;
im = imread('kronan2.JPG');
imagesc ( im );

l = F*x1; 
l = l ./ sqrt ( repmat ( l (1 ,:).^2 + l (2 ,:).^2 ,[3 1]));


xrandom = [];
for i=20:40 
    xrandom = horzcat(xrandom, x{2}(:,i));
end

%Pick 20 point s as random

figure;
hold on;
im = imread('kronan2.JPG');
imagesc ( im );

plot ( xrandom(1 ,: ) , xrandom (2 , : ), 'ro ' );
for i= 20:40
    rital(l(:,i))

end
hold off;

figure;
hist ( abs ( sum ( l .* x {2})) ,100);


