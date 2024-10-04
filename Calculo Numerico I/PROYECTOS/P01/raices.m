function   x = raices(fun,a,b,dx)

%  Calcula las abcisas donde se encuentran todas las raices de la función
%  dentro del intervalo.

%  Variable de Salida:
%  x = matriz de 2 columnas cuyas filas son las abscisas de los extremos 
% de los intervalos donde se encuentra la raíz.

% Variables de Entrada:
%  fun = funcion en forma anónima
%  (a, b) = primer intervalo de búsqueda
%  dx = ancho del intervalo

x = zeros (0 , 0);
while a < b 
    [x1, x2 ] = raizbus(fun, a, b, dx);
    a = x2;
    aux = [x1, x2];
    x = [x ; aux];
end

end