
function [x, itr] = Gauss_Seidel(A, b, tol)

       % Comprueba si la matriz A es cuadrada
    [n, m] = size(A);
    if n ~= m
        error('ERROR - La matriz A no es cuadrada.');
    else
        % Comprueba si la matriz A es diagonalmente dominante
        % ( condición necesaria pero no suficiente para la convergencia )
        diagonal = abs(diag(A));
        if all(diagonal > sum(abs(A), 2) - diagonal)
        else
            disp('WARNING - La matriz A no es diagonalmente dominante.');
        end 
    
        % Hallamos la cantidad de incógnitas e inicializamos el vector de
        % soluciones.
        [~,n] = size(A);
        x = zeros(n, 1);
    
        % Contador de iteraciones
        itr = 0;
        
        % Itera hasta que se alcance la tolerancia
        while true
            xi = x;
            
            for i = 1:n
                % Calcula la suma de los elementos conocidos
                elementos = A(i, 1:i-1) * x(1:i-1) + A(i, i+1:n) * xi(i+1:n);
                
                % Calcula el valor de la variable desconocida
                x(i) = (b(i) - elementos) / A(i, i);
            end
        
            itr = itr + 1;
            
            % Calculo del error relativo:
            % || x(i) - x(i-1) / x(i) ||
            if norm(x - xi) / norm(x) < tol
                break;
            end
        end
    end
end

