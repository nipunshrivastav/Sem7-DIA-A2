function res = mix(a,b,width)
% mixes 2 laplacian image with 2*width pixel columns at centre as a linear
% decreasing function
[row, col] = size(a);


if (width > floor(col/2))
    error('too small images');
end

if (width == 0)
    if(mod(col,2)==0)

        for i = 1:(col/2 - 1)
            res(:,i) = a(:,i);
        end


        for i = (col/2 + 2):col
            res(:,i) = b(:,i);
        end


        res(:,col/2) = 0.67*a(:,col/2) + 0.33*b(:,col/2);
        res(:,(col/2+1)) = 0.67*b(:,(col/2+1)) + 0.33*a(:,(col/2+1));
   
    else

        for i = 1:floor(col/2+1)
            res(:,i) = a(:,i);
        end


        for i = floor(col/2+1):col
            res(:,i) = b(:,i);
        end
        res(:,ceil(col/2)) = 0.5*b(:,ceil(col/2)) + 0.5*a(:,ceil(col/2));
        
    end
     
else
    
    gradient = 1:-(1/(width*2)):0;
    mask = zeros(row,col);
    if(mod(col,2)  == 0)
        
        for i = 1:(col/2 - width-1)
            mask(:,i) = 1;
        end
        
        abc = 1-col/2+width;
        for i = (col/2 - width):(col/2+width)
            mask(:,i) = gradient(i+abc);
        end
        mask2 = 1-mask;
        res = (mask.*a + mask2.*b);
      
    else
        
        for i = 1:(floor(col/2) - width-1)
            mask(:,i) = 1;
        end
        
        abc = 1-floor(col/2)+width;
        for i = (floor(col/2) - width):(floor(col/2)+width)
            if (i < ceil(col/2))
                mask(:,i) = gradient(i+abc);
            else
                mask(:,i+1) = gradient(i+abc);
            end
            mask(:,ceil(col/2)) = 0.5;
        end
        mask2 = 1-mask;

      
        res = (mask.*a + mask2.*b);
    end
end
    