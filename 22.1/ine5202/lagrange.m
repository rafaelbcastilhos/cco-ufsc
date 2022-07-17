function lagrange
clc
x=[-3 -2 1 3];
y=[-1 2 1 10];

n=length(x);
xx=0.5;
px=lag(x, y, n, xx)

end

function p=lag(x, y, n, xx)
    p=0;

    for i=1:n
        num=1;
        den=1;
        for j=1:n
            if(j != i)
                num=num*(xx-x(j));
                den=den*(x(i)-x(j));
            end
        end
        L=num/den;
        p=p+y(i)*L;
    end
end