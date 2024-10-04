
function Yint = LagINT(x, y, Xint)
    % Función para interpolación mediante el polinomio de Lagrange

    % Variables de Entrada:
    %  x: vector con las coordenadas x de los puntos de datos dados
    %  y: vector con las coordenadas y de los puntos de datos dados
    %  Xint: coordenada x en el punto en el que se debe calcular el valor interpolado de y

    % Variable de Salida:
    %  Yint: valor interpolado de y en el punto Xint
    
    n = length(x); 
    Yint = 0; 
    for i = 1:n
        L = 1; 
    
        for j = 1:n
            if j ~= i
                L = L.*(Xint-x(j))./(x(i)-x(j)); % calcular el polinomio de Lagrange
            end
        end
        Yint = Yint + y(i).*L; % agregar el término correspondiente al valor interpolado de y
    end
end
