lanczos1 = @(x) lanczosResampling(x,1);
lanczos2 = @(x) lanczosResampling(x,2);
lanczos3 = @(x) lanczosResampling(x,3);
nhood = [-3.5 3.5];
fplot(lanczos1,nhood)
hold on
fplot(lanczos2,nhood)
fplot(lanczos3,nhood)
hold off
legend(["lanczos1", "Lanczos 2","Lanczos 3"])
title("lanczos1、lanczos2 and lanczos3 Interpolation Kernels")

function f = lanczosResampling(x,a)
    f = a*sin(pi*x) .* sin(pi*x/a) ./ ...
        (pi^2 * x.^2);
    f(abs(x) > a) = 0;
    f(x == 0) = 1;
end