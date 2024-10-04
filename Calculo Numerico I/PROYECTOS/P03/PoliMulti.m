
function [p,Er] = PoliMulti(x,y,m)
    %Esta función calcula el polimnomio de ajuste or minimos cuadrados para un
    %conjunto de datos

    %Variables de entrada: 
    % x e y: vectores de coordenadas de los puntos dados
    % m: grado de ajuste del polinomio
    
    %Variables de salida: 
    % p: coeficientes del polinomio ordenados de mayor a menor
    %Er: error total
    %s: desviación estandar
    if m >= length(x)
        fprinf('El grado del polinomio no debe ser mayor o igual al número de puntos')
    else
        %calculo de los vectores de los sumatorios de potencias
        xsum = zeros(1,2*m);
        for i = 1: 2*m 
            xsum(i) = sum(x.^i);
        end
        
        b = zeros(1,m + 1);
        for i = 1:m + 1
            b(i) = sum ((x.^(i-1)) .* y);
        end  
        
        %calculo de la matriz de los sumatorios de las potencias
        A = zeros (m + 1);
        n = length(x);
        for i = 1:m+1
            A(i,2:end) = xsum(1:m);
            if i > 1
                A(i,:) = xsum(i-1:i+m-1);
            end    
        end
        A(1,1) = n;
        
        %Resolución de la ecuación A*p=b
        p= A\b';
        p = fliplr(p');
    
        %calculo del error
        
        yEst = polyval(p, x);
        Er = sum ((y-yEst).^2); %suma de los cuadrados de las desviaciones
    end
end