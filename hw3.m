im=imread("animal.jpg");
g=rgb2gray(im);
ed=[0 0 0 7 0;0 3 5 1 0;0 0 0 0 0]/16;
f=Floydsteinberg(g,4,ed);
imshowpair(g,f,"montage")
figure,imshowpair(g,histeq(g),"montage")
figure
subplot(2,1,1),histogram(g,128)
subplot(2,1,2),histogram(histeq(g))
