m=imread("d.jpg");
m=rgb2gray(m);
[r,c]=size(m);
m2=zeros(r*2,c*2);
m2(1:2:end,1:2:end)=m;
R=[1 4 6 4 1;4 16 24 16 4;6 24 36 24 6;4 16 24 16 4;1 4 6 4 1]/64;
imf=imfilter(m2,R);
%imshow(int8(m2))
mr=imresize(m,2,"bicubic");
imshowpair(uint8(imf),mr,"montage")
[peaksnr,snr] = psnr(uint8(imf),mr);
peaksnr