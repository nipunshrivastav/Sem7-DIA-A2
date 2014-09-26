function res_f = img4mLap(mask,L,depth,info)
% function reconstructs the image from laplacian pyramid
res{depth} = L{depth};

for i = depth-1:-1:1
    res{i} = L{i} + expd(mask,res{i+1},info(i+1,1),info(i+1,2));
end

figure, res{depth};

res_f = res{i};