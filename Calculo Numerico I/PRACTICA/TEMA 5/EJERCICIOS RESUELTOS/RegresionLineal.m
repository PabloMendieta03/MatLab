function [a, Er] = RegresionLineal(x, y)
    % Función que calcula los coeficientes de la recta de regresión para 
    % cualquier número de puntos de datos así como el error.
    
    % Variables de entrada: 
    % x: vector con las coordenadas x de los puntos
    % y: vector con las coordenadas y de los puntos
    
    % Variables de salida: 
    % a: vector con los coeficientes de la recta [a0; a1]
    % Er: error estándar de la estimación
    
    % Verificar que las dimensiones de x e y sean iguales
    if length(x) ~= length(y)
        error('Los vectores x e y deben tener la misma longitud.');
    end
    
    % Calcular las sumas necesarias para los coeficientes
    n = length(x);
    sum_x = sum(x);
    sum_y = sum(y);
    sum_xy = sum(x .* y);
    sum_x2 = sum(x .^ 2);
    
    % Calcular los coeficientes de la recta
    a0 = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x^2);
    a1 = (sum_y * sum_x2 - sum_x * sum_xy) / (n * sum_x2 - sum_x^2);
    a = [a0; a1];
    
    % Calcular el error estándar de la estimación
    y_pred = a0 * x + a1;
    Er = sqrt(sum((y - y_pred) .^ 2) / (n - 2)); % Se corrige la fórmula del error
    
    % Opcional: Visualización de la recta de regresión y los datos
    % plot(x, y, 'o');
    % hold on;
    % plot(x, y_pred);
    % xlabel('x');
    % ylabel('y');
    % legend('Datos', 'Recta de regresión');
    % title('Regresión Lineal');
    % hold off;
end
