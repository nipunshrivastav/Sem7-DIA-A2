function [res, info] = gaussianPyramid(mask,I,depth)

info = zeros(depth,2);

res{1} = I;% Top most Gaussian pyramid has same image
info(1,:) = mod(size(I),2);

for i = 2:depth
    info(i,:) = mod(size(res{i-1}),2);
    res{i} = red(mask,res{i-1});% reducing image and storing at different pyramid level
end