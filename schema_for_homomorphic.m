close all;
clear;
input=double(rgb2gray(imread("EXP_0.bmp")));
[hight,width]=size(input);
newinput=input;newinput(newinput==0)=1;%avoid log(0)
loginput=log(newinput);
finput=fft2(loginput);

%create high-boost filter
id=[0 0 0;0 1 0;0 0 0];
f=fspecial('average');
hb_3=1.25*id-0.25*f;
hb=zeros(hight,width);
hb(1:3,1:3)=hb_3;
fhb=fft2(hb);

output=finput.*fhb;
output=ifft2(output);

imshowpair(uint8(exp(output)),input,'montage')
title('homomorphic vs origin')