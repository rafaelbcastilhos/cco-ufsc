function newton
clc
clear
a=0;
b=1;
x0=1;
erro=10^-5;
k=0;
fx=funcao(x0);
dfx=derivada(x0);
while (abs(fx)>erro)
  k=k+1;
  xk=x0-(fx/dfx);
  delta=abs(xk-x0);
  x0=xk;
  fx=funcao(x0);
  dfx=derivada(x0);
end  
k
xk
abs(fx)
endfunction

function fx=funcao(x)
  fx=10-20*(exp(-0.2 * x)-exp(-0.75 * x))-5;
endfunction

function fx=derivada(x)
  fx=-15*exp(-0.75*x)+4*exp(-0.2*x)
endfunction