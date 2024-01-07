clear ;
close all;
inputImage=imread("friday_text.png");
len=size(inputImage,1);width=size(inputImage,2);

hit_or_miss=zeros(len,width);
for xsize=60:-1:10
    for ysize=60:-1:10
        b1=ones(ysize,xsize);
        b2=ones(ysize+2,xsize+2);
        b2(2:ysize+1,2:xsize+1)=~b1;
        tb1=imerode(inputImage,b1);
        tb2=imerode(~inputImage,b2);
        hit_or_miss=hit_or_miss | tb1&tb2;
    end
end
[x,y]=find(hit_or_miss==1);
figure,imshow(hit_or_miss);
% 定義只有白色框線的 mask
frameWidth = 1;
maskxsize=xsize+10;maskysize=ysize+10;
mask = zeros(maskysize, maskxsize);
mask(1:frameWidth, :) = 1;
mask(end-frameWidth+1:end, :) = 1;
mask(:, 1:frameWidth) = 1;
mask(:, end-frameWidth+1:end) = 1;
copy_image=inputImage;

for i = 1:length(x)
    centerX = x(i);
    centerY = y(i);
    
    % 計算 mask 區域的起始和结束座標
    rowStart = max(ceil(centerX - (maskysize)/2), 1);
    rowEnd = min(floor(centerX + (maskysize)/2), size(copy_image, 1));
    colStart = max(ceil(centerY - (maskxsize)/2), 1);
    colEnd = min(floor(centerY + (maskxsize)/2), size(copy_image, 2));

    %maskHeight = min(maskysize, rowEnd - rowStart + 1);
    %maskWidth = min(maskxsize, colEnd - colStart + 1);
    maskHeight=maskysize;
    maskWidth=maskxsize;
    maskAdjusted = mask;

    % 套用mask
    targetRegion = copy_image(rowStart:rowStart+maskHeight-1, colStart:colStart+maskWidth-1);
    if size(targetRegion, 1) == size(maskAdjusted, 1) && size(targetRegion, 2) == size(maskAdjusted, 2)
        copy_image(rowStart:rowStart+maskHeight-1, colStart:colStart+maskWidth-1) = targetRegion | maskAdjusted;
        fprintf("mask\n");
    end
end

figure, imshow(copy_image);