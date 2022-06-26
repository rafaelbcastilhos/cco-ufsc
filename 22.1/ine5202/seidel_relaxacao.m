clear
clc
a=[5 2 1;-1 4 2;2 -3 10];
b=[7 3 -1];
D=det(a);
n=length(b);
x0=[0 0 0];
xk=x0;
erro=10^-6;
k=0;
d=1;
w=1;
while (d>erro)
  k=k+1;
  for i=1:n
    soma=0;
    for j=1:n
      if j~=i
        soma=soma+a(i,j)*x0(j);
      end
    end
    x0(i)=(1-w)*x0(i)+w*(b(i)-soma)/a(i,i);
  end
  d=sum(abs(xk-x0));
  d2=max(abs(xk-x0));
  xk=x0;  %copia
end
D
k
xk
d