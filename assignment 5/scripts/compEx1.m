 compExA3_4;
close all
im1=imread('kronan1.JPG');
im2=imread('kronan2.JPG');


%%
close all
% Takes two camera matrices and puts them in a cell .
P = {P0 , K\P2};

u = {x1n, x2n}
U = spacePoints2;
n = 200;
allErrs = zeros(n, 1);



lambda = 1;

[a,first_res] = ComputeReprojectionError(P,U,u);
figure;
histogram(first_res,100);
title('Residuials before LM')



for i=1:n 
    [err , res ] = ComputeReprojectionError (P ,U ,u );
    allErrs(i) = err;
    % Computes the r and J matrices for the appoximate linear least squares problem .
    [r ,J ] = LinearizeReprojErr (P ,U ,u );
    % Computes the LM update .
    C = J' * J+ lambda * speye ( size (J ,2));
    c = J'* r;

    deltav = -C \c ;
    % Updates the variabels
    [ P , U ] = update_solution ( deltav ,P , U );
end

figure;
histogram(res,100);
title('Residuals after LM')
figure;
plot(1:n,allErrs)
title('Errors');



