function [xs, i] = biseccion (y, a, b, ermax)

%  Calcula la raíz de una función, es un método cerrado, por lo que siempre
%  converge. 

%  Variables de salida: 
%  xs: raíz calculada
%  i: número de iteraciones

%  Variables de entrada:
%  y: funcion en forma anónima
%  a: extremo menor del intervalo
%  b: extremo mayor del intervalo
%  ermax: error máximo admitido, calculado como la mitad del ancho del
%  intervalo abs((a-b)/2)

if(sign(y(a)) == sign(y(b)))
    disp('Error el intervalo seleccionado no contiene la raíz de la función \n')
end
i = 0;
er = abs((b - a) / 2);

while(er > ermax)
    xs = (a + b) / 2;
    er = abs((b - a) / 2);

    if (y(xs) * y(a)) < 0
        b = xs;
        else
            a = xs;
    end
    i = i + 1;
end

end