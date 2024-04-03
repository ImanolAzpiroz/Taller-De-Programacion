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
retorne dicho valor. 

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



{iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que 
retorne dicho valor. }
procedure BuscarSocMayorEdad(a: arbol; var mayEdad, SocMayEdad: integer);
begin
    if(a <> nil) then begin
        if(a^.dato.edad > mayEdad) then begin
            mayEdad:= a^.dato.edad;
            SocMayEdad:= a^.dato.nro;
        end;
        BuscarSocMayorEdad(a^.hi, mayEdad, SocMayEdad);
        BuscarSocMayorEdad(a^.hd, mayEdad, SocMayEdad);
    end;
end;


{iv. Aumente en 1 la edad de todos los socios. }
procedure AumentarEdad(a: arbol);
begin
    if(a <> nil) then begin
        a^.dato.edad:= a^.dato.edad + 1;
        AumentarEdad(a^.hi);
        AumentarEdad(a^.hd);
    end;
end;

{
    v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a 
un módulo recursivo que reciba el valor leído y retorne verdadero o falso. 
}

procedure Buscar(a: arbol; x: integer; var ok: boolean);
begin
    if(a = nil) then   
        ok:= false
    else
        if(a^.dato.nro = x) then
            ok:= true
        else
            if(x < a^.dato.nro) then
                Buscar(a^.hi, x, ok)
            else
                Buscar(a^.hd, x, ok);
end;


{
    vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a 
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso. 
}

procedure BuscarNombre(a: arbol; nombre: string; var ok: boolean);
begin
    if(a = nil) then
        ok:= false
    else
        if(a^.dato.nombre = nombre) then
            ok:= true
        else begin
            BuscarNombre(a^.hi, nombre, ok);
            if(not ok) then
                BuscarNombre(a^.hd, nombre, ok);
        end;

end;


{
    vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha 
    cantidad. 
}

procedure ContarSocios(a: arbol; var cant: integer);
begin
    if(a <> nil) then begin
        cant:= cant + 1;
        ContarSocios(a^.hi, cant);
        ContarSocios(a^.hd, cant);
    end;
end;

{
    viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del 
inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios. }
function CalcularPromedio(a: arbol): integer;

    procedure SumarTotal(a: arbol; var total: integer);
    begin
        if(a <> nil) then begin
            total:= total + a^.dato.edad;
            SumarTotal(a^.hi, total);
            SumarTotal(a^.hd, total);
        end;
    end;

var
    cant, total: integer;
begin
    cant:= 0; total:= 0;
    ContarSocios(a, cant);
    SumarTotal(a, total);

    CalcularPromedio:= total div cant;
end;

{xi. Informe los números de socio en orden creciente.  }
procedure ImprimirCreciente(a: arbol);
begin
    if(a <> nil) then begin
        ImprimirCreciente(a^.hi);
        writeln(a^.dato.nro);
        ImprimirCreciente(a^.hd);
    end;
end;

{
    x. Informe los números de socio pares en orden decreciente. 
}
procedure InformarPares(a: arbol);
    function esPar(nro: integer): boolean;
    begin
        if(nro mod 2 = 0) then
            esPar:= true
        else
            esPar:= false;
    end;

begin
    if(a <> nil) then begin
        InformarPares(a^.hd);
        if(esPar(a^.dato.nro)) then begin
            writeln(a^.dato.nro);
        end;
        InformarPares(a^.hi);
    end;
end;

// Programa principal.      
// Get-Content input-p3e1.txt | .\p3e1.exe
var
    a: arbol; 
    minSocio: arbol;

    mayEdad, SocMayEdad: integer;

    x: integer; ok: boolean;
    nom: string; estaNom: boolean;

    cant:integer;
begin
    CargarArbol(a);

    // I)
    writeln('El nro de socio ingresado mas grande es: ', MayorNumSocio(a));  // Si la lista está vacía devuelve -1;
    
    // II)
    MenorSocio(a, minSocio);
    writeln('Los datos del socio con nro menor son: ');
    writeln('Nro: ', minSocio^.dato.nro);
    writeln('Nombre: ', minSocio^.dato.nombre);
    writeln('Edad: ', minSocio^.dato.edad);

    // III)
    mayEdad:= -1;
    BuscarSocMayorEdad(a, mayEdad, SocMayEdad);
    writeln('El nro de socio con mayor edad es ', SocMayEdad, ' con ', mayEdad);

    // IV) VII)
    AumentarEdad(a);
    cant:= 0;
    ContarSocios(a, cant);

    // V)
    
    writeln('Ingrese el numero a buscar: ');
    readln(x); 
    ok:= false;
    Buscar(a, x, ok);
    if(ok)then
        writeln('El nro de socio se encuentra en el arbol.')
    else
        writeln('No se encuentra');

    // VI)
    writeln('Ingrese el nombre a buscar: ');
    readln(nom); estaNom:= false;
    BuscarNombre(a, nom, estaNom);
    if(estaNom) then
        writeln('EL nombre se encuentra')
    else
        writeln('EL nombre no se encuentra');
    
    
    // VIII)
    writeln('El promedio de edad de los socios es: ', CalcularPromedio(a));
    ImprimirCreciente(a);

    InformarPares(a);
end.