% ECE 403 Assignment 1, Problem 1

A = [1 2 1; 2 3 1];

[U,S,V] = svd(A)

A1 = S(1,1)*U(:,1)*V(:,1)'

norm(A - A1, 'fro')