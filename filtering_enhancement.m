
function [output_enhancement_hor_ed,output_enhancement_ver_ed,output_enhancement_sharpening] = filtering_enhancement(inputfile)  
%inputfile = 'cameraman.tif'; 
%inputfile = 'coins.png'; 
%inputfile = 'moon.tif'; 
% inputfile = 'liftingbody.png'; 

A = imread(inputfile);
[rows,columns,dim] = size(A);

kernel = 3;
y = floor(kernel/2);

horizontal_edge_detection = [-1 0 1; -1 0 1; -1 0 1];
vertical_edge_detection = [-1 -1 -1; 0 0 0; 1 1 1];
sharpening = [-1 -1 -1; -1 8 -1; -1 -1 -1];


for i=1:rows
    for j=1:columns
        for k=1:dim
            output_enhancement_hor_ed(i,j,k) = 0;
            output_enhancement_ver_ed(i,j,k) = 0;
            output_enhancement_sharpening(i,j,k) = 0;
        end
    end
end

for i=y+1:rows-y
    for j=y+1:columns-y
        for k=1:dim
            X = A(i-y:i+y,j-y:j+y,k);
            X=double(X);
        
            output_enhancement_hor_ed(i,j,k) = sum(dot(X,horizontal_edge_detection));
            output_enhancement_ver_ed(i,j,k) = sum(dot(X,vertical_edge_detection));
            output_enhancement_sharpening(i,j,k) = sum(dot(X,sharpening));
        
        end
        
    end
end

output_enhancement_hor_ed=uint8(output_enhancement_hor_ed);
output_enhancement_ver_ed=uint8(output_enhancement_ver_ed);
output_enhancement_sharpening=uint8(output_enhancement_sharpening);



outstr3=strcat('enhancement_hortizontal_edge_detection_',inputfile);
imwrite(output_enhancement_hor_ed,outstr3);
title(outstr3);
outstr4=strcat('enhancement_vertical_edge_detection_',inputfile);
imwrite(output_enhancement_ver_ed,outstr4);
title(outstr4);
outstr5=strcat('enhancement_sharpening_',inputfile);
imwrite(output_enhancement_sharpening,outstr5);
title(outstr5);

end
