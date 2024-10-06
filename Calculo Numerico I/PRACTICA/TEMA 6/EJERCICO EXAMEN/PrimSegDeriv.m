function [yd, ydd] = PrimSegDeriv(x, y)
    % Calcula la primera y segunda derivada de una función dada por un conjunto de puntos discretos
    % utilizando diferencias centrales de 2 puntos.
    %
    %  Variables de entrada:
    %   x: vector que contiene las coordenadas en el eje x de los puntos discretos.
    %   y: vector que contiene los valores de la función en los puntos discretos correspondientes a las coordenadas en x.
    %
    %  Variables de salida:
    %   yd: vector que contiene los valores de la primera derivada en cada punto.
    %   ydd: vector que contiene los valores de la segunda derivada en cada punto.

    % Cáculo del paso
    h = x(2) - x(1);
   
    yd = zeros(size(y));
    ydd = zeros(size(y));
    
    % Primera derivada
    yd(1) = (y(2) - y(1)) / h; % Derivada en el primer punto
    yd(end) = (y(end) - y(end-1)) / h; % Derivada en el último punto

    for i = 2:length(y)-1
        yd(i) = (y(i+1) - y(i-1)) / (2 * h);
    end
    
    % Segunda derivada
    ydd(1) = (y(3) - 2*y(2) + y(1)) / (h^2); % Segunda derivada en el primer punto
    ydd(end) = (y(end-2) - 2*y(end-1) + y(end)) / (h^2); % Segunda derivada en el último punto

    for i = 2:length(y)-1
        ydd(i) = (y(i+1) - 2*y(i) + y(i-1)) / (h^2);
    end
    
end

