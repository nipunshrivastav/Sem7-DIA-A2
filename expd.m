function im = expd(mask,I,r2,c2)

[m, n] = size (mask);
[row, col] = size (I);

pM = floor(m/2);
pN = floor(n/2);

for i = 1:(row*2 - r2)
    for j = 1:(col*2 - c2)
        sum = 0;
        for p = -pM:pM
            for q = -pN:pN
                a = (i-p);b = (j-q);
                if ((mod(a,2)==0) && (mod(b,2) == 0))
                    r = a/2;c = b/2;
                    if ((r>0) && (r<=row) && (c>0) && (c<=col))
                        sum = sum +  mask(p+1+pM,q+1+pN).*I(r,c);
                    end
                end
            end
        end
        im(i,j) = 4*sum;
    end
end