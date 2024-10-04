function X = SubsAdel(A, b)

    % La función resuelve un sistema con matrices, 
    % es un método directo no iterativo, por lo que no tendrá error. 
    % Sustituye hacia delante
    
    % Variables de entrada:
    %  A: matriz triangular inferior
    %  b: es un vector columna de términos independientes
    
    % Variables de salida:
    %  X: vector columna con los resultados del sistema
    
    [n, ~] = size(A);    
    X = zeros(n, 1);
    
    if ~istril(A)
        error('La matriz A no es triangular inferior.');
    end
    
    X(1) = b(1) / A(1, 1);
    
    for i = 2 : n
        sumatorio = 0;
        for j = 1 : i - 1
            sumatorio = sumatorio + A(i, j) * X(j);
        end
        X(i) = (b(i) - sumatorio) / A(i, i);
    end

end
