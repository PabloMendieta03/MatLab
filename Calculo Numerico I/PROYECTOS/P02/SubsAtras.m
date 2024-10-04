
function y = SubsAtras(A,b)

    % La función resuelve un sistema con matrices, 
    % es un método directo no iterativo, por lo que no tendrá error. 
    % Sustituye hacia atras.
    
    % Variables de entrada
    %  A : matriz triangular superior
    %  b : es un vector columna de términos independientes
    % Variables de salida
    %  y : vector columna con los resultados del sistema
    
    [n, ~] = size(A);    
    y = zeros(n, 1);
    y(n) = b(n) / A(n, n);
    
    for i = n - 1 : -1 : 1
        sumatorio = 0;
        for j = i + 1 : n
            sumatorio = sumatorio + A(i, j) * y(j);
        end
        
        y(i) = (b(i) - sumatorio) / A(i, i);
    end

end