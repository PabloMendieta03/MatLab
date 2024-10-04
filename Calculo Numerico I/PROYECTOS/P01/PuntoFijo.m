function [xs, i] = PuntoFijo(y, xest, ermax)

    % Método abierto que calcula una raíz de la función.
    % Se emplea reescribiendo la ecuación en la forma: g(x) = x

    % Variables de entrada:
    % y: función que representa la ecuación que se quiere solucionar.
    % xest: valor conocido cercano a la raíz.
    % Er: error máximo que comete el cálculo de la raíz.

    % Variables de salida:
    % xs: valor de la raíz.
    % i: número de iteraciones de este método.

    % Función y = x, necesaria para hallar xi+1
    g = @(x) x;

    i = 0; 
    xs = []; 
    errorV = []; 

    while true
        % Calcular el siguiente valor de x 
        xs(i + 1) = y(xest);

        % Calcular el error absoluto entre xn y x
        error = abs((xs(i + 1) - xest) / xs(i + 1));

        errorV(i + 1) = error;

        i = i + 1; 

        % Criterio de parada
        if error <= ermax
            break
        end

        xest = g(xs(i));
    end

    i = 1:i;
    T = table(i',xs', (100 * errorV)');
    T.Properties.VariableNames = {'Iteración','Solución', 'Error Relativo %'}
end
