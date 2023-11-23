for q = 1:5
    path = "HW2-dataset\LR\LR"+string(q)+".jpg";
    big=4;
    I=double(imread(path));
    %ref=imread("HW2-dataset\SR\SR1.jpg");
    %rs=imresize(I,big,"lanczos3");
    [high,width,~]=size(I);
    z=zeros(high*big,width*big,3);
    for cc = 1:3
        Ic=I(:,:,cc);
        for i = 1:high*big
            for j = 1:width*big
                z(i,j,cc)=lanczos(i/big,j/big,Ic,3,high,width);
            end
        end
    end
    path = "ans\ans"+string(q)+".jpg";
    imwrite(uint8(z),path);
    fprintf(path);
end
%{
psnr(uint8(rs),ref)
figure,imshowpair(uint8(rs),ref,"montage")
psnr(uint8(z),ref)
figure,imshowpair(uint8(z),ref,"montage")
%}


function L = lanczosResampling(x,a)
    L = a*sin(pi*x) .* sin(pi*x/a) ./ ...
        (pi^2 * x.^2);
    L(abs(x) > a) = 0;
    L(x == 0) = 1;
end

function f = lanczos(x,y,S,a,high,width)
    f = 0.0;
    for k = (floor(x)-a+1):(floor(x)+a)
        for w = (floor(y)-a+1):(floor(y)+a)
            f=f+S(clamp(k,high),clamp(w,width))*lanczosResampling(x-k,a)*lanczosResampling(y-w,a);
        end
    end
end

function c = clamp(x,b)
    if x<=0
        c=1;
    elseif x>b
        c=b;
    else 
        c=x;
    end
end