%Universidade Federal de Santa Catarina - UFSC
%Cálculo Numérico - INE5202
%Diferença divididas de Newton
%Rafael B. Castilhos (20205642)

function diferencas
  clc
  clear
  x = [-3 -2 1 3];
  y = [-1 2 -1 10];
  a = min (x);
  b = max (x);
  n = length(x);
  xx = 2;
  px = dif(x,y,n,xx)

  %para o grafico
  x1 = [a:0.25:b];
  n1 = length(x1);
  for k=1:n1
    p1(k) = dif(x,y,n,x1(k));
  endfor

  result_inter=px
  result_certo=sin(xx)
  precisao=abs(px-sin(xx))
  erro=abs(p1(k)- sin(x1))
end

function P=dif(x,y,n,xx)
  for i=1:n
      a(i,1)=y(i);
  end

  for j=2:n
    for i=j:n
        a(i,j)=(a(i,j-1)-a(i-1,j-1))/(x(i)-x(i-j+1));
    end
  end
  P=0;
  for i=1:n
    prod=1;
    for j=1:i-1
        prod=prod*(xx-x(j));
    end
    P=P+a(i,i)*prod;
  end
end