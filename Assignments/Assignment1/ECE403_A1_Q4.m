%ECE 403 Assignment 1 Problem 4

clc;
clear all;
close all;

% non-centralized data matrix
X = [ 0.6 0.4; 1 1.2; 1.6 1.3; 2 2.3]'

% PART A
% find mean using built-in function, careful of row vs col representation
% could have done this by summing all four columns and dividing by 4
mu = mean(X')'

% PART B
% centralize the data
% in matlab, directly subtracting columns from matrix is allowed,
% it does the subtraction elementwise, taking each column as the "element"
% for the operation
A = X - mu

% PART C
% Evaluate the covariance
C = (A*A') / length(X)

% extract u1 and lambda1
[U, V] = eigs(C)
u1 = U(:,1)
lambda1 = V(1,1)

% PART D
% project the data into new basis
% each column f_i of F is the principle component of each x_i
F = u1'*A
