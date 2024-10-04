function [dfdx, d2fdx] = DerRichardson(f, x0, hin, N)

    % La función calcula las derivadas parciales de una función, (primera y segunda) en un punto x0.

    % Variables de entrada:
    %  hin = tamaño de paso inicial
    %  N = orden de extrapolación
    %  x0 = punto donde se calcula la derivada
    %  f = función dada en forma anónima (f = @(x))

    % Variables de salida:
    %  dfdx: matriz de extrapolación para la primera derivada.
    %  d2fdx: matriz de extrapolación para la segunda derivada.
    
    dfdx = zeros(N, N);
    d2fdx = zeros(N, N);
    
    for i = 1 : N
        h1(i) = hin / (2^(i-1));
    end
    
    % Primera derivada 
    % Usando el método de las diferencias centrales de dos puntos
    for i = 1 : N
        h = hin / (2^(i-1));
        dfdx(i, 1) = (f(x0+h) - f(x0-h)) / (2 * h);
    end
    
    for j = 2 : N
        for i = j : N
             dfdx(i, j) = dfdx(i, j-1) + (dfdx(i, j-1) - dfdx(i-1, j-1))/(4^(j-1) - 1);
        end
    end
    
    % Segunda derivada
    %Usando el método de las diferencias centrales de tres puntos
    for i = 1 : N
        h = hin / (2^(i-1));
        d2fdx(i, 1) = (f(x0+h) - 2*f(x0) + f(x0-h)) / (h^2);
    end
    
    for j = 2 : N
        for i = j : N
             d2fdx(i, j) = d2fdx(i, j-1) + ((d2fdx(i, j-1) - d2fdx(i-1, j-1))/(4^(j-1) - 1));
        end
    end
    
    dfdx = [h1' dfdx];
    d2fdx = [h1' d2fdx];

end