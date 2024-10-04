
function IR = Romberg(f, a, b, Ni, Niveles)
    % Calcula la integral de una función dada en forma analítica mediante el
    % método de Romberg
    % Variables de entrada:
    % f = función a integrar en forma. f = @(x)
    % a, b = Extremos del intervalo de integración
    % Ni = Número inicial de subintervalos
    % Niveles = Niveles de integración
    % Variables de salida:
    % IR = Matriz con los distintos valores estimados de la integral. El
    % elemento de la primera fila, última columna de IR es el valor más
    % preciso.
    % OBSERVACIONES: Llama a la función Trapeciosn para calcular las integrales
    
    Niveles = Niveles + 1;
    IR = zeros(Niveles, Niveles);
    n = Ni;
    
    % Valores del nivel 0
    for i = 1 : Niveles
        IR(i, 1) = Trapeciosn(f, a, b, n);
        n = 2*n;
    end
    
    for j = 2 : Niveles 
        for i = 1 : Niveles-j+1
            IR(i, j) = (4^(j-1)*IR(i+1, j-1) - IR(i, j-1))/(4^(j-1) - 1);
        end
    end

end