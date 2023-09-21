clear
close all
%read img
i=imread("dog.png");
D=[0 56;84 28];%dithering matrix
for trans=0:3
    figure
    d=rot90(D,trans);d%Try four different matrices
    %change to gray
    I=rgb2gray(i);
    %show gray picture
    subplot(2,2,1),imshow(I,gray(256)),title("gray"),colorbar
    
    %quantization
    subplot(2,2,2),imshow(grayslice(I,4),gray(4)),title("quantization"),colorbar
    
    %Dithering2
    [M,N,C]=size(I);%get image size
    q=floor(I/85);%cut 4 path
    %extent matrix
    r=repmat(d,floor(M/2),floor(N/2));
    %modify matrix size
    q=q(1:2*floor(M/2),1:2*floor(N/2));
    Ichangesize=I(1:2*floor(M/2),1:2*floor(N/2));
    %binary thresholding with ditering map
    D2=(Ichangesize-q*85)>r;
    p=q+uint8(D2);
    subplot(2,2,3),imshow(p,gray(4)),title("Dithering method2"),colorbar
    
    %Dithering1
    DIt=I+uint8(r);
    A=floor(DIt/85);%cut 4 path
    subplot(2,2,4),imshow(A,gray(4)),title("Dithering method1"),colorbar
end