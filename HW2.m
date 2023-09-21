clear
close all
i=imread("monkey.png");
I=rgb2gray(i);
subplot(2,2,1);
imshow(I,gray(256));
[M,N,C]=size(I);
q=I/85;
D=[0 56;84 28];
r=repmat(D,floor(M/2),floor(N/2));
q=q(1:2*floor(M/2),1:2*floor(N/2));
D2=I-q*85;
D3=D2>r;
p=q+uint8(D3);
subplot(2,2,2);
imshow(p,gray(4)),colorbar

DIt=q+uint8(r);
A=floor(DIt/4);
A=uint8(A*85);
subplot(2,2,3);
imshow(A,gray(4)),colorbar
