function secante
clc
clear
x0=0;
x1=2;
erro=10^-6;
k=0;
fx0=funcao(x0);
fx1=funcao(x1);
while (abs(fx1)>erro)
  k=k+1;
  xk=x1-(((x1-x0)*fx1)/(fx1-fx0));
  delta=abs(x1-x0);
  x0=x1;
  x1=xk;
  fx0=fx1;
  fx1=funcao(x1);
end
k
xk
fx1
delta
endfunction

function fx=funcao(x)
  fx=exp(x)*sin(x)-1;
end
