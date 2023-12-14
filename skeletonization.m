close all
clear
n=imread("nicework.tif");
[x,y]=size(n);
B=[1 0 1;0 1 0;1 0 1];
k=0;
stable=zeros(x,y);
while 1
    erosion=n;
    for i=1:k
        erosion=imerode(erosion,B);
    end
    open=imopen(erosion,B);
    stable=stable+(erosion-open);
    figure,imshow(stable)
    if open == zeros(x,y)
        break;
    end
    k=k+1;
end
figure,
subplot(2,1,1),imshow(n),title("origin")
subplot(2,1,2),imshow(stable),title("skeletonization")
fprintf("run %d times\n",k);
%figure,imshow(bwskel(n))
%use function recurtion
figure,imshow(skeletonizationrecurtion(n,B)),title("skeletonization use function recurtion")