function res = laplacianPyramid(mask,gPyramid,depth,info)

res{depth} = gPyramid{depth};
% Top most level of gaussian and laplacian are same

for i = depth-1:-1:1
    res{i} = gPyramid{i} - expd(mask,gPyramid{i+1},info(i+1,1),info(i+1,2));
    % calculating laplacian image and storing at different pyramid level
end