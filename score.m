clear;
close all;
for i = 1:5
    path = "HW2-dataset\LR\LR"+string(i)+".jpg";
    I = imread(path);
    path = "ans\ans"+string(i)+".jpg";
    Il = imread(path);
    Ir = imresize(I,4,"lanczos3");
    path = "HW2-dataset\SR\SR"+string(i)+".jpg";
    ref = imread(path);
    figure,imshowpair(Il,Ir,"montage"),title("lanczos3 by myself vs imresize lanczos3");
    %figure,imshowpair(I,Ir,"montage"),title("origin vs imresize lanczos3");
    fprintf("psnr for Il %f\n",psnr(Il,ref));
    fprintf("psnr for Ir %f\n",psnr(Ir,ref));
    fprintf("ssim for Il %f\n",ssim(Il,ref));
    fprintf("ssim for Ir %f\n\n",ssim(Ir,ref));
end