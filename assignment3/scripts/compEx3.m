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
   
    block = horzcat(block, [x1n(1,i)*x2n(1, i) x1n(1,i)*x2n(2, i) x1n(1,i)*x2n(3, i) x1n(2,i)*x2n(1, i) x1n(2,i)*x2n(2, i) x1n(2,i)*x2n(3, i) x1n(3,i)*x2n(1, i) x1n(3,i)*x2n(2, i) x1n(3,i)*x2n(3, i)]);
                                                                                  
        
    M = vertcat(M, block);

           
           
end
   


[U ,S ,V] = svd ( M );

v =  V(:,end);
norm(M*v)

Eapprox = U*diag([1 1 0])*v;

[U ,S ,V] = svd ( Eapprox );



if det(U*transpose(V)) >0
E = U* diag ([1 1 0])* V';
else
V = -V;
E = U* diag ([1 1 0])* V';
end



