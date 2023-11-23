S=[2 0 1.5 1];
lanczos(1.5,S,2)

function L = lanczosResampling(x,a)
    L = a*sin(pi*x) .* sin(pi*x/a) ./ ...
        (pi^2 * x.^2);
    L(abs(x) > a) = 0;
    L(x == 0) = 1;
end

function f = lanczos(x,S,a)
    f = 0.0;
    for i = (floor(x)-a+1):(floor(x)+a)
        f=f+S(clamp(i,4))*lanczosResampling(x-i,a);
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