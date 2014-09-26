% % Nipun Shrivastava
% % 2011cs50288
% % Submission 15/9/14
% % Image pyramid, blending and compression
% % DIA 783


clc;close all; clear all;

im1a = (imread('apl.jpg'));
im2a = (imread('orng.jpg'));
% Reading the 2 images

im1a = im2double(im1a);
dlmwrite('original.txt',im1a);
% writing image in a text file for size comparison
im2a = im2double(im2a);

a = 0.4;
mask = [(1/4-a/2) 1/4 a 1/4 (1/4-a/2)];
mask = mask'*mask;
% Defining mask




depth = 8;
% giving depth

% loop for r,g and b matrix
for i = 1:3
    im1 = (im1a(:,:,i));
    im2 = im2uint8(im2a(:,:,i));
    im1 = im2double(im1);
    im2 = im2double(im2);
% Reading different components of rgb image in matrix


    [G1,info1] = gaussianPyramid(mask,im1,depth); 
    % Gaussian pyramid and even - odd row column information
    
    L1 =  laplacianPyramid(mask,G1,depth,info1);
    % Laplacian pyramid
    
    for k = 1:depth
        % Loop for writing Laplacian pyramid in text file
        dlmwrite(strcat(strcat('Lap',strcat(num2str(i),num2str(k))),'.txt'),im2uint8(L1{i}));
    end
    

    [G2,info2] = gaussianPyramid(mask,im2,depth); 
    % Gaussian pyramid and even - odd row column information
    L2 =  laplacianPyramid(mask,G2,depth,info2);
    % Laplacian pyramid


    final(:,:,i) = blend(mask,L1,L2,info1,depth);
    % final variable has final blended image
end

imshow(final);