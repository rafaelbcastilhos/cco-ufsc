function interpolacao
clear
clc
x=[-1 0 1];
y=[4; 1; -1];
n=length(x);
grau=n-1;

for i=1:n
    for j=1:n
        V(i, j)=x(i)^(j-1)
    end
end

a=V\y
xx=0.5;
px=avalia(xx,n,a)
end

function p=avalia(xx, n, a)
    p=0;
    for i=1:n
        p=p+a(i)*xx^(i-1);
    end
end
