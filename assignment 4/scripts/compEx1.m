
meanX = mean (X ,2); % Computes the mean 3D point
Xtilde = (X - repmat ( meanX ,[1 size (X ,2)]));
% Subtracts the mean from the 3D points
M = Xtilde (1:3 ,:)* Xtilde (1:3 ,:) ’; % Computes the matrix from Exercise 2
[V ,D ] = eig ( M ); % Computes eigenvalues and eigenvectors of M
plane = null (X (: , randind ) ’);
% Computes a plane from a sample set .
plane = plane ./ norm ( plane (1:3));
% Makes sure that the plane has a unit length norm
inliers = abs ( plane ’* X ) <= 0.1;
% Finds the the indices for which the distance to the plane is less than 0.1.
3
Assignment 4 Computer Vision, Vt1 2017 4
% Note : Works only if the 4 th coordinate of all the points in X is 1.
RMS = sqrt ( sum (( plane ’* X ).^2)/ size (X ,2)); % Computes the RMS error