
function Yint = NewtonINT(x,y,Xint)
    % Función que interpola unos puntos dados 
    % utilizadno el polinomio de newton.

    % Variables de entrada: 
    %  x e y: vectores de coordenadas de los puntos dados
    %  Xint: coordenada x del punto en el que se va a interpolar

    % Variables de salida: 
    %  Yint: valor del punto interpolado
    
    % Cálculo de las diferencias divididas 
    n = length(x);
    A = zeros (n);
    A(:,1) = y;

    for j = 2 : n %columnas
        for i =1 : n - j + 1 %filas
            A(i,j) = (A(i+1,j-1) - A(i,j-1))/(x(i+j-1) - x(i));
        end
    end  
    Yint = A(1,1);
    for i = 2:n
        mult = 1;
        for j = 1:i-1
            mult = mult * (Xint-x(j));
        end 
        Yint = Yint + A(1,i) * mult; 
    end    
    
end