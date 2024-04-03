{
    1.  Escribir un programa que: 
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol 
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza 
con el número de socio 0 y el árbol debe quedar ordenado por número de socio. 

b.  Una  vez  generado  el  árbol,  realice  módulos  independientes  que  reciban  el  árbol  como 
parámetro y que :  

i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que 
retorne dicho valor. 

ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un 
módulo recursivo que retorne dicho socio. 

iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que 
retorne dic;ho valor. 
iv. Aumente en 1 la edad de todos los socios. 
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a 
un módulo recursivo que reciba el valor leído y retorne verdadero o falso. 
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a 
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso. 
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha 
cantidad. 
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del 
inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios. 
xi. Informe los números de socio en orden creciente.  
x. Informe los números de socio pares en orden decreciente. 
}

program p3e1;

type
    socio = record
        nro: integer;
        nombre: string;
        edad: integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato: socio;
        hi: arbol;
        hd: arbol;
    end;

// Cargar Arbol
procedure CargarArbol(var a: arbol);
    procedure LeerSocio(var s: socio);
    begin
        writeln('Ingrese el nro de socio: ');
        readln(s.nro);
        if(s.nro <> 0) then begin
            writeln('Ingrese el nombre de socio: ');
            readln(s.nombre);
            writeln('Ingrese la edad del socio: ');
            readln(s.edad);
        end;
        writeln('-------');
    end;

    procedure AgregarArbol(var a: arbol; s: socio);
    begin
        if(a = nil) then begin
            new(a);
            a^.dato:= s;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else
            if(s.nro <= a^.dato.nro) then
                AgregarArbol(a^.hi, s)
            else
                AgregarArbol(a^.hd, s);
    end;

var
    s: socio;
begin
    a:= nil;
    LeerSocio(s);
    while(s.nro <> 0) do begin
        AgregarArbol(a, s);
        LeerSocio(s);
    end;
end;


{ i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que 
 retorne dicho valor. } 
function MayorNumSocio(a: arbol):integer;
begin
    if(a = nil) then
        MayorNumSocio:= -1
    else
        if(a^.hd = nil) then
            MayorNumSocio:= a^.dato.nro
        else    
            MayorNumSocio:= MayorNumSocio(a^.hd);
end;


{ ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un 
módulo recursivo que retorne dicho socio. }
procedure MenorSocio(a: arbol; var minSocio: arbol);
begin
    if(a = nil) or (a^.hi = nil) then
        minSocio:= a
    else
        MenorSocio(a^.hi, minSocio);
end;



// Programa principal.      
// Get-Content input-p3e1.txt | .\p3e1.exe
var
    a: arbol; 
    nroSocMax: integer;
    minSocio: arbol;
begin
    CargarArbol(a);

    // I)
    writeln('El nro de socio ingresado mas grande es: ', MayorNumSocio(a));  // Si la lista está vacía devuelve -1;
    
    // II)
    MenorSocio(a, minSocio);
    writeln('Los datos del socio con nro menor son: ');
    writeln(minSocio^.dato.nro);

end.