function y=Floydsteinberg(x,k,ed)
    height=size(x,1);
    width=size(x,2);
    y=uint8(zeros(height,width));
    z=zeros(height+4,width+4);
    z(3:height+2,3:width+2)=x;
    for i=3:height+2
        for j=3:width+2
            quant=floor(255/(k-1))*floor(z(i,j)*k/256);
            y(i-2,j-2)=quant;
            e=z(i,j)-quant;
            z(i:i+2,j-2:j+2)=z(i:i+2,j-2:j+2)+e*ed;
        end
    end
end