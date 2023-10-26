function print(name,inputImage,outputImage)
    %輸出經過gamma轉換後輸入和輸出的圖像變化曲線
    figure,plot(inputImage(:,:,3),outputImage(:,:,3),'.'),axis tight
    title('AGC後輸入和輸出的圖像變化曲線')
    xlabel('input level');
    ylabel('output level');
    %將圖形轉換回RGB
    inputImage=hsv2rgb(inputImage);
    outputImage=hsv2rgb(outputImage);
    %輸出原始圖像和轉換後的圖像
    figure,imshowpair(inputImage,outputImage,"montage")
    title([name,'原始圖像  ','AGC後的圖像']);
    %輸出原始圖像和轉換後的圖像的直方圖
    histogrami = imhist(inputImage); % 计算直方圖
    histogramo = imhist(im2uint8(outputImage));
    figure;
    subplot(1, 2, 1);
    bar(histogrami); % 使用bar函数繪製直方圖
    title([name,' 的圖像直方圖']);
    xlabel('像素值');
    ylabel('像素頻率');
    subplot(1, 2, 2);
    bar(histogramo); % 使用bar函数繪製直方圖
    title([name,' AGC後圖像直方圖']);
    xlabel('像素值');
    ylabel('像素頻率');
    
    %比較一般gamma轉換和AGC轉換的差別
    G=imadjust(inputImage, [], [],0.5);
    figure,imshowpair(inputImage,G,"montage")
    title([name,'原始圖像  ','GC後的圖像']);
    
    score("inputImage",im2uint8(inputImage));
    score("outputImage",im2uint8(outputImage));
    score("gamma",im2uint8(G));
    
    figure;
    subplot(1, 2, 1);
    bar(histogrami); % 使用bar函数繪製直方圖
    title([name,' 的圖像直方圖']);
    xlabel('像素值');
    ylabel('像素頻率');
    subplot(1, 2, 2);
    bar(imhist(G)); % 使用bar函数繪製直方圖
    title([name,' GC後圖像直方圖']);
    xlabel('像素值');
    ylabel('像素頻率');

    figure,imshowpair(G,outputImage,"montage")
    title([name,'GC後的圖像  ','AGC後的圖像']);
end