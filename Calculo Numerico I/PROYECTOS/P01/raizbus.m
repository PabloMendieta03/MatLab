function [x1, x2] = raizbus(fun, a, b, dx)

%  Calcula un intervalo en el cual se encuentra la raíz de una función.

%  Variables de salida:
%  x1 = primer punto límite del intervalo en el que está la raíz
%  x2 = punto límite del otro extremo del intervalo

%  Variables de entrada:
%  fun = funcion en forma anónima
%  (a, b) = primer intervalo de búsqueda
%  dx = ancho del intervalo
r = false; %se puede poner arriba el x1 y x2 = NaN
while a < b
    if (fun(a) * fun(a + dx)) < 0  
        x1 = a;
        x2 = a + dx;
        r = true;
        break;
    end
    a = a + dx;
end

if r == false
    %fprintf ('No hay raices');
    x1 = NaN;
    x2 = NaN;
end

end