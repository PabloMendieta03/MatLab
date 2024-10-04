function [L, U] = LUCrout(A)

    % La función descompone una matriz en el producto de L*U, 
    % donde los elementos de la diagonal de U y de L son 1.

    % Variables de entrada:
    %  A : matriz cuadrada

    % Variables de salida:
    %  U : matriz triangular superior con unos en la diagonal.
    %  L : matriz triangular inferiro con unos en la diagonal.
    
    [n, ~] = size(A);
    L = eye(n);
    U = eye(n);  %matrices identidad del tamaño de la matriz A

    for i = 1 : n
        L(i, 1) = A(i, 1);
        U(i, i) = 1;

        for j = 2 : n
            U(1, j) = A(1, j) / L (1, 1);
        end
    end

    for i = 2 : n
        for j = 2 : i
            sumatorio = 0;
            for k = 1 : j - 1
                sumatorio = sumatorio  + L(i, k) * U(k, j);
            end
            L(i, j) = A(i, j) - sumatorio;
        end

        for j = i + 1 : n
            sumatorio = 0;
            for k = 1 : j - 1
                sumatorio = sumatorio  + L(i, k) * U(k, j);
            end
            U(i, j) = (A(i, j) - sumatorio) / L(i, i);
        end
    end

end