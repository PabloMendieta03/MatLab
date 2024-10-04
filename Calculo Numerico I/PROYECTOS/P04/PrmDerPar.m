function [dfdx,dfdy] = PrmDerPar(x,y,f)

    % Evalua las primeras derivadas parciales de una funcion f(x,y) dada por
    % puntos tabulados discretos con igual espaciado. Usa formulas de diferencia
    % central en dos puntos interiores y la diferencia de tres puntos hacia
    % delante y haca antras en los extremos.

    %Variables de entrada: 
    %x e y: vectores con los valores de las variables independientes
    %f:matriz con el valor de 𝑓(𝑥, 𝑦) en cada punto

    %Varaibles de salida:
    %dfdx: matriz con los valores de la derivada parcial respecto a x en cada
         %punto de modo que la posicion i,j de la matriz corresponde con la derivada
         %en el punto x(i) y(j)
    %dfdy: matriz con los valores de la derivada parcial respecto a y en cada
         %punto de modo que la posicion i,j de la matriz corresponde con la derivada
         %en el punto x(i) y y(j)
    
    [m,n] = size(f);
    dfdx = zeros(m,n);
    dfdy = zeros(m,n);
    
    for i = 1:m
        for j = 1:n
            if i == 1 % Primera fila (diferencias hacia adelante)
                dfdx(i,j) = (-3*f(i,j)+4*f(i+1,j)-f(i+2,j))/(2*(x(2)-x(1)));

            elseif i == m % Última fila (diferencias hacia atrás de 3 puntos)
                dfdx(i,j) = (f(i-2,j)-4*f(i-1,j)+3*f(i,j))/(2*(x(m)-x(m-1)));

            else % Fila intermedia (diferencias centrales de 2 puntos)
                dfdx(i,j) = (f(i+1,j)-f(i-1,j))/(2*(x(i+1)-x(i-1)));
            end
            
            if j == 1 % Primera columna (diferencias hacia adelante de 3 puntos)
                dfdy(i,j) = (-3*f(i,j)+4*f(i,j+1)-f(i,j+2))/(2*(y(2)-y(1)));

            elseif j == n % Última columna (diferencias hacia atrás de 3 puntos)
                dfdy(i,j) = (f(i,j-2)-4*f(i,j-1)+3*f(i,j))/(2*(y(n)-y(n-1)));

            else % Columna intermedia (diferencias centrales de 2 puntos)
                dfdy(i,j) = (f(i,j+1)-f(i,j-1))/(2*(y(j+1)-y(j-1)));
            end
        end
    end

end