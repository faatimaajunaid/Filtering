
function [B,output_mean,output_mean_noise] = filtering_mean(inputfile,kernel,noise_variance)  
%inputfile = 'coloredchips.png'; 


A = imread(inputfile);
[rows,columns,dim] = size(A);

%kernel = 3;

y = floor(kernel/2);

% noise_variance = 900;

for i=1:rows
    for j=1:columns
                 n = randn*sqrt(noise_variance);
                 B(i,j,1)=A(i,j,1)+n;
                 B(i,j,2)=A(i,j,2)+n;
                 B(i,j,3)=A(i,j,3)+n;
                 
                 if B(i,j,1)<0
                    B(i,j,1)=0;
                 elseif B(i,j,1)>255
                    B(i,j,1)=255;
                 end
                    if B(i,j,2)<0
                    B(i,j,2)=0;
                    elseif B(i,j,2)>255
                    B(i,j,2)=255;
                    end
                    
                    if B(i,j,3)<0
                    B(i,j,3)=0;
                elseif B(i,j,3)>255
                    B(i,j,3)=255;
             
                end
    end
end
B=uint8(B);


for i=1:rows
    for j=1:columns
        for k=1:dim
            output_mean(i,j,k) = 0;
            output_mean_noise(i,j,k) = 0;
        end
    end
end

for i=y+1:rows-y
    for j=y+1:columns-y
        for k=1:dim
            X = A(i-y:i+y,j-y:j+y,k);
            X=double(X);
    
            X=X(:);
            output_mean(i,j,k) = mean(X);
        end
    end
end


for i=y+1:rows-y
    for j=y+1:columns-y
        for k=1:dim
            X = B(i-y:i+y,j-y:j+y,k);
            X=double(X);
    
            X=X(:);
            output_mean_noise(i,j,k) = mean(X);
        end
    end
end

output_mean=uint8(output_mean);
output_mean_noise=uint8(output_mean_noise);


outstr1=strcat('noisy_gussian_',inputfile);
imwrite(B,outstr1);
title(outstr1);
outstr2=strcat('mean_',inputfile);
imwrite(output_mean,outstr2);
title(outstr2);
outstr3=strcat('mean_noise_',inputfile);
imwrite(output_mean_noise,outstr3);
title(outstr3);


end
