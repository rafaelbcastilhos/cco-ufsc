clc
clear
a=0;
b=1;
fa=10-20*(exp(-0.2 * a)-exp(-0.75 * a))-5;
fb=10-20*(exp(-0.2 * b)-exp(-0.75 * b))-5;
fxm=1;
k=0;
erro=10^-5;
while (abs(fxm)>erro)
    k=k+1;
    xm=(a+b)/2    
    fxm=10-20*(exp(-0.2 * xm)-exp(-0.75 * xm))-5;
    if fa*fxm<0
        b=xm;
        fb=fxm;
    else
        a=xm;
        fa=fxm;
    end
end
k
xm
abs(fxm)