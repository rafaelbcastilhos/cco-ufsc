function falsa_posicao
clear
clc
a=0;
b=1;
fa=funcao(a);
fb=funcao(b);
erro=10^-5;
k=0;
fxm=1;
while(abs(fxm)>erro)
  k=(k+1);
  xm=a-((fa*(b-a))/(fb-fa));
  fxm=(funcao(xm));
  if fa*fxm<0
   b=xm;
   fb=fxm;
  else
   a=xm;
   fa=fxm;
  end
end
k
xm
abs(fxm)

end

function f=funcao(x)
 f=10-20*(exp(-0.2 * x)-exp(-0.75 * x))-5;
end