clear
close all;
load('compEx1data.mat');



std1 = std (x {1 }(1:2 ,:) ,0 ,2);

s1 = (std1(1) + std1(end))/2;
s1 = 1 /s1;

x1mean = mean (x {1 }(1:2 ,:) ,2);
x2mean = mean (x {2 }(1:2 ,:) ,2);

std2 = std (x {2 }(1:2 ,:) ,0 ,2);

s2 = (std2(1) + std2(end))/2;
s2 = 1 /s2;



N1 = [s1, 0, -s1*x1mean(1); 0 s1 -s1*x1mean(2); 0 0 1];
N2 = [s2, 0, -s2(1)*x2mean(1); 0 s2 -s2*x2mean(2); 0 0 1];

x1n = N1 * x{1};
x2n = N2 * x{2};

M = [];
for i= 1:2008 
    
    block = [];
    for j= 1:3 
           block = horzcat(block, [x1n(j,i)*x2n(1, i) x1n(j,i)*x2n(2, i) x1n(j,i)*x2n(3, i)]);
   
    end
    M = vertcat(M, block);
    
end

[U ,S ,V] = svd ( M );

v = V(:,end);

disp('M*v')
norm(M*v) 
disp('norm(V)^2')
norm(v)*norm(v)


Fn = reshape (v ,[3 3])
det(Fn)

plot ( diag ( x2n'* Fn * x1n ));

F = transpose(N2) *Fn * N1
F = F./F(3, 3)
l = F*x {1}; 
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






