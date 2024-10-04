
function G = Cholesky(A)
    
    % La función calcula una factorización de la matriz de entrada A. 
    % Es similar al método de descomposición LU
    
    % La variable de entrada:
    % A: una matriz cuadrada, definida positiva y simétrica.
    
    % La variable de salida:
    % G: matriz triangular superior. 
    
    % Crear una matriz triangular superior a partir de A
    G = triu(A);

    % Obtener las dimensiones de la matriz A
    [n, m] = size(A);

    % Verificar si la matriz A no es cuadrada
    if n ~= m
        disp('La matriz no es cuadrada, no podemos aplicar Cholesky');
        return;
    end

    % Verificar si la matriz A no es simétrica
    if ~issymmetric(A)
        disp('La matriz no es simétrica, no siempre convergerá');
    end

    % Verificar si la matriz A no es definida positiva
    if any(eig(A) <= 0)
        disp('La matriz no es definida positiva, no podemos aplicar Cholesky');
        return;
    end

    % Iterar sobre las filas de la matriz A
    for i = 1 : n
        % Iterar sobre las columnas desde la fila actual hasta la última fila
        for j = i : n
            sumatorio = 0;
            % Calcular sumatorio para elementos anteriores en la fila
            for k = 1 : i - 1
                sumatorio = sumatorio + (G(k, i))^2;
            end
            % Calcular el elemento G(i, i)
            G(i, i) = sqrt(A(i, i) - sumatorio);

            sumatorio = 0;
            % Calcular sumatorio para elementos anteriores en la fila y columna
            for t = 1 : i - 1
                sumatorio = sumatorio + (G(t, i) * G(t, j));
            end
            % Calcular el elemento G(i, j)
            G(i, j) = (A(i, j) - sumatorio)*(1 / G(i, i));
        end
    end
end



   