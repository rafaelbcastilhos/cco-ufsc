function newton
clc
clear
a=0;
b=2;
x=[a:0.1:b];
x0=0;
erro=10^-6;
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
fx
delta
endfunction

function fx=funcao(x)
  fx=exp(x)*sin(x)-1;
endfunction

function fx=derivada(x)
  fx=exp(x)*sin(x)+exp(x)*cos(x);
endfunction