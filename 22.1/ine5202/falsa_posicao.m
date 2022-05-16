function falsa_posicao
clear
clc
a=0;
b=2;
fa=funcao(a);
fb=funcao(b);
erro=10^-6;
k=0;
fxm=1;
x=[a:0.1:b];
while(abs(fxm)>erro)
  k=(k+1);
  xm=a-((fa*(b-a))/(fb-fa));
  fxm=(funcao(xm));
  r=fa+(((fb-fa)/(b-a))*(x-a)); 
  if fa*fxm<0
   b=xm;
   fb=fxm;
  else
   a=xm;
   fa=fxm;
  end
end
xm
abs(fxm)
k
abs(a-b)
end

function f=funcao(x)
 f=exp(x)*sin(x)-1;
end