function I = GaussQ(fun,a,b,n)
% calcula cualquier integral definida mediante la cuadratura de Gauss
% Variables de entrada:
% fun: función a integrar dada en forma anonima fun = @(x)
% a y b: limites de integración
% n: número de pesos/ puntos de Gauss
% Variables de salida:
% I: valor de la integral definida

%Hacemos un cambio de variable para que la integral este entre -1 y 1
fu = @(u) (b-a)/2*fun(((u+1)*(b-a)/2 ) + a);

%Calculo del polinomio de legendre
syms x
Pn = legendreP(n,x);

%Calculo de nodos (raices de Pn en (-1,1)
Pn = sym2poly(Pn);
r = roots(Pn);

%Calculo del polinomio de Lagrange 
L = sym('L', [1 n]);
for i=1:n
    Li = 1;
    for j=1:n
        if j~=i
            Li = Li * ((x- r(j) ) / (r(i) - r(j)));
        end
    end
    L(i) = Li;
end

%Calculo de la integral del polinomio de Lagrange para calcular los nodos
w = zeros(n,1);
for i=1:n
    wi = int(L(i),x,-1,1);
    w(i) = double(wi);
end

% Calcular el valor de la integral
I = 0;
for i = 1:n
    I = I + w(i) * fu(r(i));
end    

end