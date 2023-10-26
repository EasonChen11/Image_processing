clear
close all
i=rgb2gray(imread('dog.jpg'));%read image

[ir,ic]=size(i);%size of input image
fprintf("size of origin: %d * %d\n",ir,ic);
figure,imshow(i),title('origin image')

icounterclockwise =imrotate(i,60,"bicubic");%rotate input image counterclockwise 60
[icounterclockwiser,icounterclockwisec]=size(icounterclockwise);%size of input image of counterclockwise
fprintf("size of counterclockwise 60: %d * %d\n",icounterclockwiser,icounterclockwisec);
figure,imshow(icounterclockwise),title('counterclockwise image')

ireverse=imrotate(icounterclockwise,-60,"bicubic");%rotate input image of counterclockwise clockwise 60
[ireverser,ireversec]=size(ireverse);%size of input image of counterclockwise clockwise
fprintf("size of reverse rotation: %d * %d\n",ireverser,ireversec);
figure,imshow(ireverse),title('reverse rotation image')

uprblack=round((ireverser-ir)/2);%calculate up black width
leftrblack=round((ireversec-ic)/2);%calculate left black width
ireverse=ireverse(uprblack+1:uprblack+ir,leftrblack+1:leftrblack+ic);%take image of remove black
fprintf("psnr between origin and reverse rotation: %f\n",psnr(i,ireverse));
figure,imshowpair(i,ireverse,"montage"),title('origin image vs reverse rotation image')