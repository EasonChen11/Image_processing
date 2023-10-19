close all
clear
readImage=imread("dog.png");    %read image
readImage=rgb2gray(readImage);  %to gray
[r,c]=size(readImage);  %get size
extentoddM=zeros(r*2,c*2); %create extent matrix save 0
extentevenM=zeros(r*2,c*2); %create extent matrix save 0

extentoddM(1:2:end,1:2:end)=readImage; %replace odd place
extentevenM(2:2:end,2:2:end)=readImage; %replace even place

spactialFileterBicubic=[1 4 6 4 1;4 16 24 16 4;6 24 36 24 6;4 16 24 16 4;1 4 6 4 1]/64; %define spatial filter
enlargementoddM=imfilter(extentoddM,spactialFileterBicubic);  %use filter change matrix
enlargementevenM=imfilter(extentevenM,spactialFileterBicubic);  %use filter change matrix
figure,imshowpair(uint8(enlargementoddM),uint8(enlargementevenM),"montage")   %show pair
title('replace odd index v.s replace even index');
%fprintf("psnr is %d\n",psnr(uint8(enlargementoddM),uint8(enlargementevenM))) ;   %compare psnr

resizeM=imresize(readImage,2,"bicubic");    %use imresize to enlarge

figure,imshowpair(uint8(enlargementoddM),resizeM,"montage")   %show pair
title('image with spatial filter v.s image with imresize');
fprintf("psnr is %d\n",psnr(uint8(enlargementoddM),resizeM)) ;   %compare psnr

figure,imshowpair(readImage,uint8(enlargementoddM),"montage")   %show pair
title('origin image v.s image with spatial filter');

figure,imshow(enlargementoddM-enlargementoddM,jet)
title('Compare them by showing the difference image');

figure,histogram(enlargementevenM)
title('histogram of image with spatial filter');

figure,histogram(resizeM)
title('histogram of image with imresize');
