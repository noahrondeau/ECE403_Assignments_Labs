
%ECE 403 Assignment 1 Q2

% PART A
disp('PART A');
load building256.mat;
A = building256/255;

[U,S,V] = svd(A);

% PART B
disp('PART B');
A1 = S(1,1)*U(:,1)*V(:,1)';
A2 = A1 + S(2,2)*U(:,2)*V(:,2)';
A3 = A2 + S(3,3)*U(:,3)*V(:,3)';
A4 = A3 + S(4,4)*U(:,4)*V(:,4)';
A5 = A4 + S(5,5)*U(:,5)*V(:,5)';

% PART C
disp('PART C');
normA = norm(A,'fro');

e1 = norm(A1-A, 'fro')/ normA
e2 = norm(A2-A, 'fro')/ normA
e3 = norm(A3-A, 'fro')/ normA
e4 = norm(A4-A, 'fro')/ normA
e5 = norm(A5-A, 'fro')/ normA

% PART D
disp('PART D');

figure(1)
subplot(221)
imshow(A)
title('original building256')
subplot(222)
imshow(A1) 
title('rank-1 approximation')
subplot(223)
imshow(A3)
title('rank-3 approximation')
subplot(224)
imshow(A5)
title('rank-5 approximation')

% PART E
disp('PART E');
lenU = length(U(:,1));
lenV = length(V(:,1));
totalNums = 5*(1 + lenU + lenV);
fprintf('For each additional rank, you need to keep track of 1 singular value\n');
fprintf('You also need to keep track of a vector v_k of dimension %d\n', lenU);
fprintf('You also need to keep track of a vector v_k of dimension %d\n', lenV);
fprintf('So for a rank 5 approximation, we need to track 5*(1 + %d + %d) = %d numbers.\n', ...
    lenU, lenV, totalNums);

