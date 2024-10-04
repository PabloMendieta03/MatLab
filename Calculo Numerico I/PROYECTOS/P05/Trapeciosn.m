function I = Trapeciosn(Fun, a, b, n)
% Utiliza el método compuesto de los trapecios para la integración de una
% función f(x) que se da de forma analítica
% Variables de entrada:
% Fun = Función que se está integrando que debe escribirse de forma
% anónima: Fun = @(x)...
% a, b = Límites de integración (a < b)
% n = número de subintervalos empleado
% Variables de salida:
% I = Valor de la integral

h = (b-a)/n;

I1 = h/2*(Fun(a) + Fun(b));

x = (a:h:b);

I2 = 0;

for i = 2:n
    I2 = I2 + Fun(x(i));
end

I = I1 + h*I2;

end