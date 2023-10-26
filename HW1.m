%https://jivp-eurasipjournals.springeropen.com/articles/10.1186/s13640-016-0138-1
clear
close all
picturename='EXP_0.bmp';
inputImage = im2double(rgb2hsv(imread(picturename)));%read image and changed to hsv
outputImage=gammatransform(inputImage);
print(picturename,inputImage,outputImage);
