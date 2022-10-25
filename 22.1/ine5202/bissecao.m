clc
clear
a=0;
b=1;
fa=tan(a);
fb=tan(b);
fxm=1;
k=0;
erro=10^-5;
while (abs(fxm)>erro)
    k=k+1;
    xm=(a+b)/2
    fxm=tan(xm);
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
