function secante
clc
clear
x0=0;
x1=2;
erro=10^-5;
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
abs(fx1)
endfunction

function fx=funcao(x)
  fx=10-20*(exp(-0.2 * x)-exp(-0.75 * x))-5;
end
