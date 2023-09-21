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
    subplot(2,3,1),imshow(I),title("gray"),colorbar
    
    %quantization
    subplot(2,3,2),imshow(grayslice(I,4),gray(4)),title("quantization"),colorbar
    
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
    subplot(2,3,3),imshow(p,gray(4)),title("Dithering method2"),colorbar
    
    %Dithering1
    DIt=q*85+uint8(r);
    Mean=mean(r,'all')+mean(q*85,'all');
    A=DIt>Mean;
    subplot(2,3,4),imshow(A,gray(2)),title("Dithering method1-1"),colorbar
    %other method
    AA=zeros(floor(M/2)*2,floor(N/2)*2);
    for cnt=0.5:0.5:1.5
        AA=AA+(DIt>repmat(Mean*cnt,floor(M/2)*2,floor(N/2)*2));
    end
    subplot(2,3,5),imshow(uint8(AA),gray(4)),title("Dithering method1-2"),colorbar
end
imwrite(I,"gray.png");
imwrite(grayslice(I,4),gray(4),"quantization.png");
imwrite(p,gray(4),"Dithering2.png");
imwrite(A,gray(2),"Dithering1-1.png");
imwrite(AA,gray(4),"Dithering1-2.png");

