
% ECE 403 Lab 4
% Author: Noah Rondeau V00816430

% load training data and testing data
clear all;
close all;
clc;

load D_bc_te.mat;
load D_bc_tr.mat;

% normalize the data features
Xtrain = zeros(30,480);
for i = 1:30
 xi = D_bc_tr(i,:);
 mi = mean(xi);
 vi = sqrt(var(xi));
 Xtrain(i,:) = (xi - mi)/vi;
end
Xtest = zeros(30,89);
for i = 1:30
 xi = D_bc_te(i,:);
 mi = mean(xi);
 vi = sqrt(var(xi));
 Xtest(i,:) = (xi - mi)/vi;
end

ytrain = D_bc_tr(31,:);
ytest = D_bc_te(31,:); 


