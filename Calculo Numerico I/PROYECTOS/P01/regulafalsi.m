
function [xs, k] = regulafalsi(f, a, b, ermax)

    % Regula Falsi es un método para hallar soluciones de funciones no lineales
    % en un intervalo dado. Como condución la función debe ser continua en
    % dicho intervalo y deber tener solución. 
    
    
    % Variables de salida: 
    % xs : raíz de la función
    % k: número de iteraciones
    
    % Variables de entrada: 
    % f: función de forma anónima 
    % a: primer valor del intervalo
    % b: segundo valor del intervalo 
    % ermax: error máximo de la solución
    
    
    fa = f(a); % extremo menor del intervalo
    fb = f(b); % extremo mayor del intervalo
    k = 0; % Contador de iteraciones 
    
    % Creamos un bucle en el que no salga de él hasta que el intervalo sea
    % menor que el error máximo que nos pide. 
    while abs(fa) > ermax && abs(fb) > ermax
        
        % Punto de corte con el eje x.
        xs = (a*fb - b*fa) / (fb - fa);
        fx = f(xs);
        % Contador de iteraciones
        k = k + 1;
        
        % Vamos acotando el intervalo.
        if fx*fa < 0
            b = xs;
            fb = fx;
        else
            a = xs;
            fa = fx;
        end
    end
    
    xs = (a*fb - b*fa) / (fb - fa);

end