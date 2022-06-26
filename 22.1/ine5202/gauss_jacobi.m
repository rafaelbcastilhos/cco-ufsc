clear
clc
a=[3 -1 -1;1 3 1;2 -2 4];
b=[1 5 4];
n=length(b);
x0=[0 0 0];
erro=10^-6;
k=0;
d=1;
while (d>erro)
  k=k+1;
  for i=1:n
    soma=0;
    for j=1:n
      if j~=i
        soma=soma+a(i,j)*x0(j);
      end
    end
    xk(i)=(b(i)-soma)/a(i,i);
  end
  d=sum(abs(xk-x0));
  x0=xk;
end
k
xk
d