
function I = Simpson38(f, a, b, Er)
% La función calcula el valor de una integral definida en un intervalo (a, b) 
% Variables de entrada
%  a y b : límites de integración
%  f : función en forma anónima
%  Er: error máximo admitido 
% Variable de salida
%  I : valor de la integral, resultado.

if a == b
    fprintf('como a=b la integral es 0');
    I=0;
else   
    n = 3; % número de subintervalos en la primera iteración
    h = ( b-a )/ n; % tamaño de subintervalo
    x = a:h:b;  % intervalos de la integración
    
    fx = f(x);
    
    % Calculamos la primera iteración
    I0 = 3*h/8 * (fx(1) + 3*fx(2) + 3*fx(3) + fx(4));
    
    % Iteraciones
    while true
        n = 2*n; 
        h = (b-a)/(n); 
        x = a:h:b; 
       
        fx = f(x);
        
        % Calculamos la nueva iteración
        I = 3*h/8 * (fx(1) + 3*sum(fx(2:3:end-2)) + 3*sum(fx(3:3:end-1)) + 2*sum(fx(4:3:end-2)) + fx(end));
        
        % Cálculo del error relativo
        Error = abs(I - I0)/abs(I);
        if Error < Er
            break;
        end
        
        I0 = I;
    end
end    
end
