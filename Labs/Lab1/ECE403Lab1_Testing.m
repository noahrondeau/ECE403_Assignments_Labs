% ECE 403 Lab 1: MNIST Handwritten digit classification with PCA
% 
% Testing Script

clear all;
close all;
clc;

% load data
load X1600.mat
load Te28.mat
load Lte28.mat

% load model
load class_components.mat
load class_means.mat 

q = 29;
classes = 10;
[d,num_images] = size(Te28);

% classify all images

misclassifications = 0;

tic;
t = cputime;

for image_index=1:num_images
    x = Te28(:,image_index); % image to classify
    e = zeros(1,classes);
    true_label = Lte28(image_index);
    
    for j=1:classes
        
        % compute class distance for class j
        % fj = Uq^T * (x - uj)
        % xj = Uq*x + uj
        % ej = || x - xj ||
        fj = class_components(:,:,j)'*(x - class_means(:,j));
        xj = class_components(:,:,j)*fj + class_means(:,j);
        e(j) = norm(x - xj);
    end
    
    [ min_e, class_choice ] = min(e);
    
    % subtract one from class choice because of 1-indexing
    % e.g. j,class_choice = 1 corresponds to a chocie of '0'
    if (class_choice - 1) ~= (true_label)
        misclassifications = misclassifications + 1;
    end
end

elapsed_cpu = cputime - t;
elapsed_time = toc;

correct_num = num_images - misclassifications;
correct_rate = correct_num / num_images;
incorrect_rate = misclassifications / num_images;

fprintf('%d images classified\n', num_images);
fprintf('Correct:\t%d\t--\tRate:\t%f\n', correct_num, correct_rate);
fprintf('Incorrect:\t%d\t--\tRate:\t%f\n', misclassifications, incorrect_rate);

fprintf('CPU time elapsed: %f sec\n', elapsed_cpu);
fprintf('Wall clock time elapsed: %f sec\n', elapsed_time);