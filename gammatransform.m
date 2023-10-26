function outputImage=gammatransform(inputImage)
    % 定義期望的均值和標準差
    Value=inputImage(:,:,3);
    [row,column]=size(Value);
    desiredMean = mean2(Value);
    desiredStdDev = std2(Value); 
    tau=3.0;
    D=desiredMean+2*desiredStdDev-(desiredMean-2*desiredStdDev);
    if D<=(1/tau)
        gamma= -log2(desiredStdDev);
    else
        gamma= exp(1-(desiredMean+desiredStdDev)/2);
    end
    k= power(Value,gamma)+(1-power(Value,gamma)).*power(desiredMean,gamma);
    if (0.5-desiredMean)<=0
        c=double(zeros(row,column));
    else 
        c=double(ones(row,column));
    end
    c=power(double((1+(c).*(k-1))),-1);
    outputImage=inputImage;
    outputImage(:,:,3) =double( c .* double(imadjust(inputImage(:,:,3), [], [], gamma)));
end