
function [xs, i] = newtonraphson(f, x0, ermax)

% Método abierto que calcula la raíz de una función que se encuentra cerca 
% del punto dado x0.

% Variables de entrada:
% y: función continua de la que queremos hallar la raíz 
% escrita de forma simbólica.
% x0: punto dado próximo a la raíz.
% ermax: error (máximo relativo).

% Variables de salida:
% xs: raíz
% i: número de iteraciones

    e = 1;
    i = 0;
    xs = x0;
    dy = diff(f);
    
    while e > ermax
        x1 = xs;
    
        % Cálculo del siguiente punto 
        xs = x1 - (subs(f, x1) / subs(dy, x1));
        
        e = abs( (xs - x1) / xs); % ermax
    
        i = i + 1;
    end
end