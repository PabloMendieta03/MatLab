function x = Tridiagonal(A, B)
    % Método que resuelve un sistema de ecuaciones 
    % si la matriz de coeficientes es tridiagonal.

    % Variables de entrada:
    % A = Matriz cuadrada
    % b = Vector columna con los términos independientes

    % Variables de salida:
    % x = vector columna con los resultados del sistema 

    n = size(A);
    esTridiagonal = true;
    
    for i = 1:n
        for j = 1:n
            if i~= j && abs(i-j)>1 && A(i, j) ~= 0
                esTridiagonal = false; 
                break;
            end
        end
    end
    
    if ~esTridiagonal
        error('La matriz de coeficientos NO es tridiagonal')

    else
        % Algoritmo de Thomas
        % Definimos los vectores que vamos a utilizar
        for i = 1:n
            for j = 1:n
                if i == j
                    d(i) = A(i,j);
                elseif (i - j) == -1
                    a(i) = A(i, j);
                elseif (i - j) == 1
                    if i == 1
                        b(i) = 0;
                    else
                        b(i) = A(i, j);
                    end
                end
            end
        end
    
        a1(1) = a(1) / d(1);
        B1(1) = B(1) / d(1);
    
        for i = 2:(n-1)
            a1(i) = a(i) / (d(i) - b(i).*a1(i-1));
            B1(i) = (B(i) - b(i).*B1(i-1)) / (d(i) - b(i).*a1(i-1));
        end
    
        B1(n) = (B(n) - b(n).*B1(n-1)) / (d(n) - b(n).*a1(n-1));
    
        % Calculamos la solución mediante sustitución hacia atrás
        x(n) = B1(n);
        for i = (n-1):-1:1
            x(i) = B1(i) - a1(i).*x(i+1);
        end
    
    end

end