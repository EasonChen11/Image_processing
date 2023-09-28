i=imread("EXP_4.bmp");
g=rgb2gray(i);
a=[0 100 190 230 255];
b=[0 70 130 190 250];
T=interp1(a,b,0:255,'linear');
T_I=uint8(T(g+1));
adj=imadjust(g,[],[],2);
figure,plot(T,'.'),axis tight
figure,subplot(2,1,1),histogram(g),subplot(2,1,2),histogram(T_I)
figure,imshowpair(g,T_I,'montage'),title("Piecewise"),figure,imshow(adj),title("gamma")
brisqueI=brisque(g);
n=niqe(g);
fprintf('BRISQUE score for original image is %0.4f.NIQEscore for original image is %0.4f.\n',brisqueI,n)
brisqueI=brisque(T_I);
n=niqe(T_I);
fprintf('BRISQUE score for original image is %0.4f.NIQEscore for original image is %0.4f.\n',brisqueI,n)
