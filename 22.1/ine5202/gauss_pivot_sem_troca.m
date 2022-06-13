%Universidade Federal de Santa Catarina - UFSC
%Cálculo Numérico - INE5202
%Pivoteamento Parcial de Gauss sem a troca das linhas
%Rafael B. Castilhos (20205642)
clc
clear
format long
  
a =[1 1 1.5 1 1.5 0 0 0 0 0;
    0 1 0.01 0.51 1.5 0.5 0 0 0 0;
    2.9 1 2 1 1 0 5 0 0 0;
    9 1 0.2 1 1 0 0 1.5 0 0;
    1 0 2 0 0 1 1 1 0 2;
    0 1 0 0 -2 0 1 -1 1 1;
    1 0 2 0 0 0 1 1 1 0;
    0 1 0 0 2 0 1 1 1 -1;
    0 0 1 0 2 1 -1 0 -1 -1;
    0 1 0 0 2 0 1 0 1 1];
a1=a;
b = [4 -3 1 -1 -1 0 -1 1 3 -2];
b1=b;
n = length(b); %tamanho matriz a
o = [1:n]; %vetor de oenamento
x = [1:n]; %vetor solucao

for k=1:n-1 %linha pivo e coeficiente pivo
  maior = abs(a(o(k),k)); %procura maior em modulo
  pivo = k;
  for i=k+1:n
    if (abs(a(o(i),k))>maior)
      maior = abs(a(o(i),k));
      pivo = i;%linha do maior em modulo
    end
  end
  % trocando as linhas no vetor o
  if pivo>k
    aux = o(k);
    o(k) = o(pivo);
    o(pivo) = aux;

  end
  for i=k+1:n
    m = a(o(i),k) / a(o(k),k);
    for j=k:n
      a(o(i),j) = a(o(i),j) - m * a(o(k),j);
    end
    b(o(i)) = b(o(i)) - m * b(o(k));
  end
end

%retrosubstituicao
x(n) = b(o(n)) / a(o(n),n);
for i=n-1:-1:1
  soma = 0;
  for j=i+1:n
    soma = soma + a(o(i),j) * x(j);
  end
  x(i) = (b(o(i)) - soma) / a(o(i),i);
end

a
b
x
o
r = abs(b1' - a1 * x')