compEx1

null(transpose(F))


e2 = null(F') % Computes the epipole
e2x = [0 -e2 (3) e2 (2); e2 (3) 0 -e2 (1); -e2 (2) e2 (1) 0];

P1 = [1 0 0 0; 0 1 0 0; 0 0 1 0]
P2=horzcat(e2x*F, e2)


zero = [0; 0; 0];
for i=1:257
   A= [];
   A= vertcat(A, P1);
   A= vertcat(A, P2);
   block = [-x1n(:,i) zero;zero  -x2n(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePoints = horzcat(spacePoints, P);
end


figure('Name','3D Model','NumberTitle','off')
hold on;
plot3 (spacePoints (1 ,:) ,spacePoints (2 ,:) , spacePoints (3 ,:) , '. ', 'Markersize',5);