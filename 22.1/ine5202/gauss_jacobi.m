clear
clc
a=[-0.5 -1.5 3.5;2.5 -0.5 -4.5;2.5 5 -5];
b=[25.25 -2.25 -53.75];
n=length(b);
x0=[0 0 0];
erro=10^-6;
k=0;
d=1;
c=1
while (c<4)
  c=c+1
  k=k+1;
  for i=1:n
    soma=0;
    for j=1:n
      if j~=i
        soma=soma+a(i,j)*x0(j);
      end
    end
    xk(i)=(b(i)-soma)/a(i,i)
  end
  d=sum(abs(xk-x0));
  x0=xk;
end
k
xk
d
