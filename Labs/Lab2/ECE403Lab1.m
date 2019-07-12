% ECE 403 Lab 2
% Author: Noah Rondeau
% V00816430

clc;
close all;
clear all;

%prepare datasets
load D_iris.mat;
D = D_iris(1:4,:);

X1 = D(:,1:50);
X2 = D(:,51:100);
X3 = D(:,101:150);

rand('state',111);
r1 = randperm(50);
Xtr1 = X1(:,r1(1:40));
Xte1 = X1(:,r1(41:50));

rand('state',112);
r2 = randperm(50);
Xtr2 = X2(:,r2(1:40));
Xte2 = X2(:,r2(41:50));

rand('state',113);
r3 = randperm(50);
Xtr3 = X3(:,r3(1:40));
Xte3 = X3(:,r3(41:50));

% constants
k = 3;
y = [ones(40,1); -ones(80,1)];

% use Class 1 as P
Xhat1 = [ [Xtr1 Xtr2 Xtr3]' ones(120,1) ];
what1 = pinv(Xhat1)*y;
b1 = what1(end);
w1 = what1(1:end-1);

% use Class 2 as P
Xhat2 = [ [Xtr2 Xtr3 Xtr1]' ones(120,1) ];
what2 = pinv(Xhat2)*y;
b2 = what2(end);
w2 = what2(1:end-1);

% use Class 1 as P
Xhat3 = [ [Xtr3 Xtr1 Xtr2]' ones(120,1) ];
what3 = pinv(Xhat3)*y;
b3 = what3(end);
w3 = what3(1:end-1);

% now classify

Xtest = [Xte1 Xte2 Xte3];
labels = [ones(1, 10) 2*ones(1, 10) 3*ones(1, 10) ];
E = zeros(3, length(labels));
% apply models to the data, storing the results in a column for each sample
Xresult = zeros(3, length(Xtest));
Xresult(1,:) = w1'*Xtest + b1;
Xresult(2,:) = w2'*Xtest + b2;
Xresult(3,:) = w3'*Xtest + b3;

% get the max per column and index in the column
[m,index] = max(Xresult);

% compare to expected labels and count misclassifications
mis_class = sum(index ~= labels);
error = mis_class/30;
fprintf('The error is %f\n', error);

% construct data for confusion matrix
%E(1, :) = (index == 1);
%E(2, :) = (index == 2);
%E(3, :) = (index == 3);

confusionchart(labels, index);


