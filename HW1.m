clear all;
%read and show jpg
subplot(2,2,1);
imshow("hamburger.jpg")
title("jpg")
imfinfo("hamburger.jpg")
%change and show bmp
subplot(2,2,2);
I=imread("hamburger.jpg");
imwrite(I,"hamburger.bmp",'bmp');
imshow("hamburger.bmp")
imfinfo("hamburger.bmp")
title("bmp")
%change and show gif
subplot(2,2,3);
[f,map]=rgb2ind(I,256);
imwrite(f,map,"hamburger.gif",'gif');
imshow("hamburger.gif")
imfinfo("hamburger.gif")
title("gif")

impixelinfo