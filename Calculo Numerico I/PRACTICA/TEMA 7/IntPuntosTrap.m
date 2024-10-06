function I = IntPuntosTrap(x, y)
    % Esta funcion integra con el método trapezoidal compuesto de una 
    % función  que se da mediante un conjunto de  puntos discretos.
    % ( No tienen porqué estar equiespaciados ) 
    
    % Variables de Salida: 
    % I: Valor de la integral 

    % Variables de Entrada:
    % x e y: son vectores con los valores de x y los correspondientes de y.

    n = length(x);
    I = 0; 
    
    % Calcular la integral usando el método trapezoidal compuesto
    % Para puntos no equiespaciados
    for i = 1:n-1
        % Ancho del subintervalo
        h = x(i+1) - x(i); 

        % Area del trapecio
        area = h/2 * (y(i) + y(i+1)) ; 
        
        I = I + area;
    end
end
