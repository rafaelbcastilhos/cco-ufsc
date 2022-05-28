function birgevieta
  clear
  clc

  coeficientes = [1,0,2,-1]
  tamanho = size(coeficientes)(2)
  fx = 1;
  x = 1
  erro = 10^-8;
  k=0;
  while(abs(fx)>erro)
    soma = 0;
    k=k+1;
    b = coeficientes(1);
    c = coeficientes(1);
    for i = 2:tamanho
      a = coeficientes(i);
      b = birge(a,b,x);
      if i < tamanho
        c = birge(b,c,x);
      endif
    endfor
    r = b;
    r1 = c;
    x = xk(x,r,r1);
    for i = 1:tamanho
      soma = soma + f(x,coeficientes(i),tamanho-i);
    endfor
    fx = soma;
  end
  k
  x
  fx

end


function birge=birge(a,b,x)
  birge = a+b*x;
end

function f=f(x,coeficiente,potencia)
  f = coeficiente*(x^potencia);
end

function xk=xk(x,r,r1)
  xk = x-r/r1;
end


