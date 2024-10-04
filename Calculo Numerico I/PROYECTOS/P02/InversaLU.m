function invA = InversaLU(A)
    % Función que calcula la inversa de una matriz (A) 
    % mediante la descomposición LU.
    
    % Variables de entrada:
    %   A: matriz cuadrada de la que se va a calcular la inversa.
    
    % Variables de salida:
    %   invA: matriz cuadrada inversa de A.
    
    
    [F, C] = size(A);
    % Hallamos las matrices L y U 
    [L, U] = LUCrout(A);
    
    invA = zeros(F);

    b = eye(F, C);
    
    for j = 1:C
        y = SubsAdel(L, b(:,j));
        invA(:, j) = SubsAtras(U, y);
    end

end