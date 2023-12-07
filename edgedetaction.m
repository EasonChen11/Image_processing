%create noise image
Img=im2gray(imread("cat.jpg"));
Imgpeppernoise=imnoise(Img,"salt & pepper");
Imgguassion=imnoise(Img,"gaussian");
figure
subplot(1,2,1),imshow(Imgpeppernoise)
title("salt & pepper noise")
subplot(1,2,2),imshow(Imgguassion)
title("guassion noise")

%Sobel
ImgpeppernoiseSobel=edge(Imgpeppernoise,"Sobel");
ImgguassionSobel=edge(Imgguassion,"Sobel");
figure
subplot(1,2,1),imshow(ImgpeppernoiseSobel)
title("salt & pepper use Sobel")
subplot(2,2,2),imshow(ImgguassionSobel)
title("guassion noise use Sobel")

%Prewitt
ImgpeppernoisePrewitt=edge(Imgpeppernoise,"Prewitt");
ImgguassionPrewitt=edge(Imgguassion,"Prewitt");
figure
subplot(1,2,1),imshow(ImgpeppernoisePrewitt)
title("salt & pepper use Prewitt")
subplot(2,2,2),imshow(ImgguassionPrewitt)
title("guassion noise use Prewitt")

%Roberts
ImgpeppernoiseRoberts=edge(Imgpeppernoise,"Roberts");
ImgguassionRoberts=edge(Imgguassion,"Roberts");
figure
subplot(1,2,1),imshow(ImgpeppernoiseRoberts)
title("salt & pepper use Roberts")
subplot(2,2,2),imshow(ImgguassionRoberts)
title("guassion noise use Roberts")
%log
Imgpeppernoiselog=edge(Imgpeppernoise,"log");
Imgguassionlog=edge(Imgguassion,"log");
figure
subplot(1,2,1),imshow(Imgpeppernoiselog)
title("salt & pepper use log")
subplot(2,2,2),imshow(Imgguassionlog)
title("guassion noise use log")
%zerocross
Imgpeppernoisezerocross=edge(Imgpeppernoise,"zerocross");
Imgguassionzerocross=edge(Imgguassion,"zerocross");
figure
subplot(1,2,1),imshow(Imgpeppernoisezerocross)
title("salt & pepper use zerocross")
subplot(2,2,2),imshow(Imgguassionzerocross)
title("guassion noise use zerocross")
%Canny
ImgpeppernoiseCanny=edge(Imgpeppernoise,"Canny");
ImgguassionCanny=edge(Imgguassion,"Canny");
figure
subplot(1,2,1),imshow(ImgpeppernoiseCanny)
title("salt & pepper use Canny")
subplot(2,2,2),imshow(ImgguassionCanny)
title("guassion noise use Canny")
%approxcanny
Imgpeppernoiseapproxcanny=edge(Imgpeppernoise,"approxcanny");
Imgguassionapproxcanny=edge(Imgguassion,"approxcanny");
figure
subplot(1,2,1),imshow(Imgpeppernoiseapproxcanny)
title("salt & pepper use approxcanny")
subplot(2,2,2),imshow(Imgguassionapproxcanny)
title("guassion noise use approxcanny")