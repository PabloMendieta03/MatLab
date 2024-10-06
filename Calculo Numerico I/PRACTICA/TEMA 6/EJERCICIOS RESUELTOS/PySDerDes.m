function [yd, ydd] = PySDerDes(x, y)

    % La función calcula el valor de la primera derivada de un conjunto de
    % puntos x e y mediante polinomios de Lagrange

    % Variables de entrada
    %  x e y : vectores columna con las coordenadas de los puntos

    % Variable de salida
    %  yd : un vector columna con los valores de la primera derivada en cada punto.

    n = length(x);
    yd = zeros(length(x), 1);
    ydd = zeros(length(x), 1);
    
    % Primeras derivadas
    for i = 1 : n - 2
        yd(i + 1) = (x(i + 1) - x(i + 2)) * y(i) / ((x(i) - x(i + 1)) * (x(i) - x(i + 2))) + (2 * x(i + 1) - x(i) - x(i + 2)) * y(i + 1) / ((x(i + 1) - x(i)) * (x(i + 1) - x(i + 2))) + (x(i + 1) - x(i)) * y(i + 2) / ((x(i + 2) - x(i)) * (x(i + 2) - x(i + 1)));
    end
    
    yd(1) = ((2 * x(1) - x(2) - x(3)) / ((x(1) - x(2)) * (x(1) - x(3)))) * y(1) + ((x(1) - x(3)) / ((x(2) - x(1)) * (x(2) - x(3)))) * y(2) + ((x(1) - x(2)) / ((x(3) - x(1)) * (x(3) - x(2)))) * y(3);
    yd(end) = ((x(n) - x(n - 1)) / ((x(n - 2) - x(n - 1)) * (x(n - 2) - x(n)))) * y(n - 2) + ((x(n) - x(n - 2)) / ((x(n - 1) - x(n - 2)) * (x(n - 1) - x(n)))) * y(n - 1) + ((2 * x(n) - x(n - 2) - x(n - 1)) / (x(n) - x(n - 2)) * (x(n) - x(n - 1))) * y(n);
    
    
    % Segundas derivadas
    for i = 2 : 2
        ydd(1) = (2 * y(i - 1)) / ((x(i - 1) - x(i + 1)) * (x(i - 1) - x(i))) - (2 * y(i - 1)) / ((x(i + 2) - x(i - 1)) * (x(i - 1) - x(i))) - (2 * y(i - 1)) / ((x(i + 2) - x(i - 1)) * (x(i - 1) - x(i + 1))) + (2 * y(i + 2) * (x(i - 1) - x(i + 1))) / ((x(i + 2) - x(i - 1)) * (x(i + 2) - x(i + 1)) * (x(i + 2) - x(i))) - (2 * y(i + 1) * (x(i + 2) - x(i - 1))) / ((x(i + 2) - x(i + 1)) * (x(i - 1) - x(i + 1)) * (x(i + 1) - x(i))) + (2 * y(i + 2) * (x(i - 1) - x(i))) / ((x(i + 2) - x(i - 1)) * (x(i + 2) - x(i + 1)) * (x(i + 2) - x(i))) + (2 * y(i + 1) * (x(i - 1) - x(i))) / ((x(i + 2) - x(i + 1)) * (x(i - 1) - x(i + 1)) * (x(i + 1) - x(i))) + (2 * y(i) * (x(i + 2) - x(i - 1))) / ((x(i + 2) - x(i)) * (x(i - 1) - x(i)) * (x(i + 1) - x(i))) - (2 * y(i) * (x(i - 1) - x(i + 1))) / ((x(i + 2) - x(i)) * (x(i - 1) - x(i)) * (x(i + 1) - x(i)));
    end
    
    for i = 2 : n - 2
        ydd(i) = (2 * y(i))/((x(i + 2) - x(i)) * (x(i - 1) - x(i))) + (2 * y(i)) / ((x(i + 2) - x(i)) * (x(i + 1) - x(i))) + (2 * y(i)) / ((x(i - 1) - x(i)) * (x(i + 1) - x(i))) - (2 * y(i + 2) * (x(i - 1) - x(i))) / ((x(i + 2) - x(i - 1)) * (x(i + 2) - x(i + 1)) * (x(i + 2) - x(i))) - (2 * y(i + 2) * (x(i + 1) - x(i))) / ((x(i + 2) - x(i - 1)) * (x(i + 2) - x(i + 1)) * (x(i + 2) - x(i))) - (2 * y(i + 1) * (x(i + 2) - x(i))) / ((x(i + 2) - x(i + 1)) * (x(i - 1) - x(i + 1)) * (x(i + 1) - x(i))) - (2 * y(i + 1) * (x(i - 1) - x(i))) / ((x(i + 2) - x(i + 1)) * (x(i - 1) - x(i + 1)) * (x(i + 1) - x(i))) + (2 * y(i - 1) * (x(i + 2) - x(i))) / ((x(i + 2) - x(i - 1)) * (x(i - 1) - x(i + 1)) * (x(i - 1) - x(i))) + (2 * y(i - 1) * (x(i + 1) - x(i))) / ((x(i + 2) - x(i - 1)) * (x(i - 1) - x(i + 1)) * (x(i - 1) - x(i)));
        ydd(end - 1) = (2 * y(i + 1)) / ((x(i + 2) - x(i + 1)) * (x(i - 1) - x(i + 1))) - (2 * y(i + 1)) / ((x(i + 2) - x(i + 1)) * (x(i + 1) - x(i))) - (2 * y(i + 1)) / ((x(i - 1) - x(i + 1)) * (x(i + 1) - x(i))) - (2 * y(i + 2) * (x(i - 1) - x(i + 1))) / ((x(i + 2) - x(i - 1)) * (x(i + 2) - x(i + 1)) * (x(i + 2) - x(i))) + (2 * y(i -1) * (x(i + 2) - x(i + 1))) / ((x(i + 2) - x(i - 1)) * (x(i - 1) - x(i + 1)) * (x(i - 1) - x(i))) + (2 * y(i + 2) * (x(i + 1) - x(i))) / ((x(i + 2) - x(i - 1)) * (x(i + 2) - x(i + 1)) * (x(i + 2) - x(i))) - (2 * y(i - 1) * (x(i + 1) - x(i))) / ((x(i + 2) - x(i - 1)) * (x(i - 1) - x(i + 1)) * (x(i - 1) - x(i))) + (2 * y(i) * (x(i + 2) - x(i + 1))) / ((x(i + 2) - x(i)) * (x(i - 1) - x(i)) * (x(i + 1) - x(i))) + (2 * y(i) * (x(i - 1) - x(i + 1))) / ((x(i + 2) - x(i)) * (x(i - 1) - x(i)) * (x(i + 1) - x(i)));
        ydd(end) = (2 * y(i + 2)) / ((x(i + 2) - x(i - 1)) * (x(i + 2) - x(i + 1))) + (2 * y(i + 2)) / ((x(i + 2) - x(i - 1)) * (x(i + 2) - x(i))) + (2 * y(i + 2)) / ((x(i + 2) - x(i + 1)) * (x(i + 2) - x(i))) + (2 * y(i + 1) * (x(i + 2) - x(i - 1))) / ((x(i + 2) - x(i + 1)) * (x(i - 1) - x(i + 1)) * (x(i + 1) - x(i))) - (2 * y(i - 1) * (x(i + 2) - x(i + 1))) / ((x(i + 2) - x(i - 1)) * (x(i - 1) - x(i + 1)) * (x(i - 1) - x(i))) + (2 * y(i + 1) * (x(i + 2) - x(i))) / ((x(i + 2) - x(i + 1)) * (x(i - 1) - x(i + 1)) * (x(i + 1) - x(i))) - (2 * y(i - 1) * (x(i + 2) - x(i))) / ((x(i + 2) - x(i - 1)) * (x(i - 1) - x(i + 1)) * (x(i - 1) - x(i))) - (2 * y(i) * (x(i + 2) - x(i - 1))) / ((x(i + 2) - x(i)) * (x(i - 1) - x(i)) * (x(i + 1) - x(i))) - (2 * y(i) * (x(i + 2) - x(i + 1))) / ((x(i + 2) - x(i)) * (x(i - 1) - x(i)) * (x(i + 1) - x(i)));
    end


end
