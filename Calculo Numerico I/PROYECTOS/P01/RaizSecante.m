
function [xs, i] = RaizSecante(y, xa, xb, ermax)

% Calcula el cero de una función mediante el método de la secante.

% Entradas:
%   y: Función en forma anónima (y = @(x))
%   xa, xb: Abscisas de los puntos iniciales de iteración (próximos a la raíz buscada)
%   ermax: Error relativo máximo 
    
% Salidas:
%   xs: Raíz calculada
%   i: Número de iteraciones realizadas

    i = 0;

    % Primera iteración 
    fa = y(xa);
    fb = y(xb);

    while true
        % Calculamos la pendiente
        xs = xb - (fb * (xa - xb)) / (fa - fb);

        % Calculamos el error relativo
        error = abs((xs - xb) / xs);

        % Valores para la siguiente iteración
        xa = xb;
        fa = fb;
        xb = xs;
        fb = y(xb);

        i = i + 1;

        % Criterio de Parada
        if error < ermax 
            break
        end
    end
end
