% ECE 403 Lab 1: MNIST Handwritten digit classification with PCA

% Training Script

clear all;
close all;
clc;

% load training data
load X1600.mat

q = 29;
classes = 10;
[d,m] = size(X1600);
samples_per_class = m / classes;

%preallocate mean and eigenvector matrices
class_means = zeros(d, classes);
class_components = zeros(d,q, classes);

% calculate means per class, eigenvector basis

for j=1:(classes)
    % calculate indices for array slicing
    class_start = (j-1)*samples_per_class + 1;
    class_end = class_start + samples_per_class - 1;
    
    %calculate and store class mean
    class_means(:,j) = mean(X1600(:, class_start:class_end )')';
    
    % calculate class covariance
    A = X1600(:, class_start:class_end ) - class_means(:,j);
    C = (A*A')/samples_per_class;
    
    % calculate and store principle components for class
    [class_components(:,:, j), eigenvalues] = eigs(C,q);
end

save('class_components.mat', 'class_components');
save('class_means.mat', 'class_means');