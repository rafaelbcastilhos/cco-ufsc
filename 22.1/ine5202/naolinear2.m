function NaoLinear
  clear
  clc
  x=[1;-1];
  erro=10^-8;
  k=0;
  d=1;
  h=0.1;
  while(sum(abs(d))>erro)
    k=k+1;
    F=[funcao1(x);funcao2(x)];
    J(1,1)=(funcao1([x(1)+h x(2)]) -F(1))/h;
    J(1,2)=(funcao1([x(1) x(2)+h]) -F(1))/h;
    J(2,1)=(funcao2([x(1)+h x(2)]) -F(2))/h;
    J(2,2)=(funcao2([x(1) x(2)+h]) -F(2))/h;
    J
    d=J\-F
    x=x+d
  end
  k
  x
  d
end

function y1=funcao1(x)
  y1=exp(x(1))+x(2)-1;
end
function y2=funcao2(x)
  y2=x(1)^2+x(2)^2-4;
end
