
function [B,output_median,output_median_noise] = filtering_median(inputfile,noise_probability,kernel)  
%inputfile = 'coloredchips.png';
A = imread(inputfile);
[rows,columns,dim] = size(A);

% kernel = 3;
y = floor(kernel/2);
B = imnoise(A,'salt & pepper',noise_probability);

output_median = A;
output_median_noise = B;
for i=1:rows
    for j=1:columns
        for k=1:dim
            output_median(i,j,k) = 0;
            output_median_noise(i,j,k) = 0;
        end
    end
end

for i=y+1:rows-y
    for j=y+1:columns-y
        for k=1:dim
            X = A(i-y:i+y,j-y:j+y,k);
            %X=double(X);
    
            X=X(:);
            output_median(i,j,k) = median(X);
        end
    end
end


for i=y+1:rows-y
    for j=y+1:columns-y
        for k=1:dim
            X = B(i-y:i+y,j-y:j+y,k);
           % X=double(X);
    
            X=X(:);
            output_median_noise(i,j,k) = median(X);
        end
    end
end


output_mean=uint8(output_median);
output_mean_noise=uint8(output_median_noise);


outstr1=strcat('noisy_saltnpepper_',inputfile);
imwrite(B,outstr1);
title(outstr1);
outstr2=strcat('median_',inputfile);
imwrite(output_median,outstr2);
title(outstr2);
outstr3=strcat('median_noise_',inputfile);
imwrite(output_median_noise,outstr3);
title(outstr3);

end
