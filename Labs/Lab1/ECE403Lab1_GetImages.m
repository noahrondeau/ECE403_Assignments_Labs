function [TeImg,class,ClassAvImg,DiffImg,PCAImg] = ECE403Lab1_GetImages(TeIndex)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% load data
load Te28.mat;
load Lte28.mat;

% load model
load class_components.mat;
load class_means.mat; 

class = Lte28(TeIndex);
TeImg = Te28(:,TeIndex);
ClassAvgImg = class_means(:,(class + 1));
DiffImg = TeImg - ClassAvgImg;

f = class_components(:,:,(class + 1))'*(TeImg - class_means(:,(class + 1)));
PCAImg = class_components(:,:,(class + 1))*f + class_means(:,(class + 1));

TeImg = reshape(TeImg, [28,28]);
ClassAvgImg = reshape(ClassAvgImg,[28,28]);
DiffImg = mat2gray(reshape(DiffImg, [28,28]));
PCAImg = reshape(PCAImg,[28,28]);

figure();
imshow(TeImg);
title(['Img. ', num2str(TeIndex), '; Class ', num2str(class)]);

figure();
imshow(ClassAvgImg);
title(['Avg. ', num2str(class), ' img'] );


figure();
imshow(DiffImg);
title(['Difference of Img. ', num2str(TeIndex),' from avg ', num2str(class)]);


figure();
imshow(PCAImg);
title(['Principal Components of Img. ',num2str(TeIndex),' in class ', num2str(class)]);



end

