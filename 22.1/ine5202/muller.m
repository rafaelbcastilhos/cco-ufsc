function x3 = muller(x0, x1, x2, stop_error)
  function retval = f(x)
    retval = x^2-6*x+25;
  endfunction;
  while(abs(x2 - x1) > stop_error)
    h0 = x1 - x0;
    h1 = x2 - x1;
    d0 = (f(x1) - f(x0))/(x1 - x0);
    d1 = (f(x2) - f(x1))/(x2 - x1);

    a = (d1-d0)/(h1+h0);
    b = a*h1 + d1;
    c = f(x2);

    x3 = x2 - 2*c/(b + sign(b)*sqrt(b^2 - 4*a*c));

    x0 = x1;
    x1 = x2;
    x2 = x3;
    printf("%.10f\n", x3);
  endwhile
endfunction
