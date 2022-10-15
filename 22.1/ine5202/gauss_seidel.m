clear
clc
a=[3.5 -2 -1;-5 2 -1.5;2 -3.5 4];
b=[-19.75 18.75 -5.75];
n=length(b);
x0=[0 0 0];
xk=x0;
erro=10^-4;
k=0;
d=1;
c=1;
while (c<4)
  c=c+1;
  k=k+1;
  for i=1:n
    soma=0;
    for j=1:n
      if j~=i
        soma=soma+a(i,j)*x0(j);
      end
    end
    x0(i)=(b(i)-soma)/a(i,i)
  end
  d=sum(abs(xk-x0));
  xk=x0;  %copia
end
k
xk
d
