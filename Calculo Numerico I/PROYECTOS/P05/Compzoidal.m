
function I = Compzoidal(Fun, a, b, Er)
    % Función que utilica el método compuesto de los trapecios para la 
    % integración de una función  que se da en forma analítica.

    % Variables de Salida: 
    % I: Valor de la integral 

    % Variables de salida:
    % Fun: Función a integrar 
    % a: Límite inferior
    % b: Límite superior
    % Er: Error 
    % Número de subintervalos
    n = 1; 
    I_prev = 0; 

    % Ancho del subintervalos
    h = (b - a) / n; 

    % Puntos del intervalo
    x = a:h:b; 

    y = Fun(x); 

    % Fórmula del trapecio compuesto
    I = h/2 * ( y(1) + y(end) ) + h * sum(y);
    
    while true
        n = 2 * n; % Duplicamos el número de subintervalos
        h = (b - a) / n; % Calculamos el nuevo ancho del subintervalo
        x = a:h:b; % Generamos los nuevos puntos de integración
        y = Fun(x); % Evaluamos la función en los nuevos puntos de integración
        %I_next = h * (sum(y) - (y(1) + y(end)) / 2); % Calculamos la integral con el nuevo número de subintervalos
        I_next = h/2 * ( y(1) + y(end) ) + h * sum(y);
        if abs(I_next - I) < Er % Comprobamos si la diferencia es menor que el error
            I = I_next; % Si sí, asignamos el nuevo valor de la integral y salimos del bucle
            break;
        end
        
        I_prev = I;
        I = I_next; 
    end
end
