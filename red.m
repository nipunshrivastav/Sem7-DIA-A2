function im = red(mask,I)

[row, col] = size (I);

I = conv2(I,mask,'same');% convolving with gaussian mask
im(:,:) = I(1:2:row,1:2:col);% odd pixels of I