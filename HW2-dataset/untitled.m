clear;
close all;
for i = 1:5
    path = "LR\LR"+string(i)+".jpg";
    I = imread(path);
    Ir = imresize(I,4,"lanczos3");
    path = "SR\SR"+string(i)+".jpg";
    ref = imread(path);
    figure,imshowpair(I,Ir,"montage");
    title(psnr(Ir,ref)+'and'+ssim(Ir,ref))
end