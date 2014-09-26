function res = blend(mask,L1,L2,info1,depth)

width = 16;

for i=1:depth
   % mixes different laplacian pyramids
    L{i} = mix(L1{i},L2{i},width);
    width = floor(width/2);
   
end

res =  img4mLap(mask,L,depth,info1); % reconstructs the blend image from mixed laplacians