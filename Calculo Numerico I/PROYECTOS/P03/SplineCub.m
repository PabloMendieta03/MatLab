
function Yint = SplineCub(x, y, xint)

    % La función calcula un polinomio de Lagrange mediante splines cuadráticas,
    % lo que devuelve es un punto interpolado en función del polinomio que se
    % ha creado.

    % Variables de entrada:
    %  x : vector con coordenadas dado
    %  y : vector con coordenadas de las imágenes de x
    %  xint : coordenada x del punto interpolado

    % Variables de salida:
    %  Yint : valor y del punto interpolado
    
    % Verificar que x y y tengan la misma longitud
    if length(x) ~= length(y)
        error('x e y deben tener la misma longitud');
    end
    
    n =  length(x);
    M = zeros(n);
    h = zeros (n-1,1);
    u = zeros(n-1,1);

    %matriz de coeficientes
    for i = 1 : n - 1
        h(i) = x(i + 1) - x(i);
        if i ~= 1
           u(i) = 2*(h(i-1)+h(i));
        end  
    end
    M(1,1) = 1;
    M(n,n) = 1;
    
    for i = 2:n-1
        M(i,i) = u(i);
        M(i,i-1) = h(i-1);
        M(i-1,i) = h(i-1);
    end
    M(n-1,n) = h(end);
    M(1,2) = 0;
    
    %vector de terminos independientes
    v = zeros(n-1, 1);
    b = zeros(n);

    for i = 1:n-1
        b(i) = (1/h(i)) * (y(i+1)-y(i));
        if i ~= 1
           v(i) = 6*(b(i)-b(i-1));
        end  
    end
    vaux = zeros (n ,1);
    vaux(2:end-1) = v(2:end);
    
    %resolución del sistema
    a = Tridiagonal(M, vaux);
    
    %obtención de Yint medinate el polinomio
    indice = find(x <= xint, 1, 'last');

    if indice ~= n 
        Yint1 = a(indice)/(6 * h(indice)) * (x(indice + 1) - xint)^3;
        Yint2 = Yint1 + a(indice + 1)/(6 * h(indice)) * (xint - x(indice))^3;
        Yint3 = Yint2 + (y(indice) / h(indice) - (a(indice) * h(indice) / 6)) * (x(indice + 1) - xint);
        Yint = Yint3 + (y(indice + 1) / h(indice) - (a(indice + 1) * h(indice) / 6)) * (xint - x(indice));
    else 
        Yint = y(end);
    end

end