{
    3)  Una obra social dispone de un árbol binario de búsqueda con la información de sus 
afiliados. De cada afiliado se conoce: Número de afiliado, Nro de CUIL, Plan (1..10) y año 
de ingreso a la obra social. El árbol se encuentra ordenado por número de afiliado. Se 
solicita:
Implementar un módulo que reciba el árbol de afiliados, Nro de CUIL Num1, Nro de CUIL  
Num2 y un número de Plan, y retorne un vector ordenado por Nro de CUIL del afiliado. El 
vector debe contener el número de afiliado y CUIL de aquellos afiliados cuyo Nro de CUIL 
se encuentra comprendido entre Num1 y Num2 (siendo Num1 menor que Num2) y el Plan
se corresponda con el recibido por parámetro. Por norma de la obra social, cada Plan 
puede contar con a lo sumo 250 afiliados. 
}

program p3;

const
    dimF = 250;
type
    rango = 1..10;
    afiliado = record
        nroAf: integer;
        nroCuil: integer;
        plan: rango;
        anio: integer;
    end;

    arbol = ^nodo;
    nodo = record    // Ordenado por nro de afiliado.
        dato: afiliado;
        hi: arbol;
        hd: arbol;
    end;

    afiliado2 = record
        nroAf: integer;
        nroCuil: integer;
    end;

    vector = array[1..dimF] of afiliado2;


procedure CargarArbol(var a: arbol);

    procedure LeerAfiliado(var af: afiliado);
    begin;
        writeln('Ingrese el nro de afiliado');
        readln(af.nroAf);
        if(af.nroAf <> 0) then begin
            writeln('Ingrese el nro de cuil');
            readln(af.nroCuil);
            writeln('Ingrese el plan');
            readln(af.plan);
            //writeln('Ingrese el anio de ingreso');
            //readln(af.anio);
        end;
    end;

    procedure Agregar(var a: arbol; af: afiliado);
    begin
        if(a = nil) then begin
            new(a);
            a^.dato:= af;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else
            if(af.nroAf <= a^.dato.nroAf) then
                Agregar(a^.hi, af)
            else
                Agregar(a^.hd, af);
    end;


var
    af: afiliado;
begin
    LeerAfiliado(af);
    while(af.nroAf <> 0) do begin
        Agregar(a, af);
        LeerAfiliado(af);
    end;
end;




function BuscarPos(v: vector; dimL: integer; x: integer): integer;
var
    pos: integer;

begin
    pos:= 1;
    while( pos <= dimL) and (x > v[pos].nroCuil) do 
        pos:= pos + 1;
    BuscarPos:= pos;
end;

procedure Insertar (var v: vector; var dimL: integer; pos, nroCuil, nroAf: integer);
var
    i: integer;
begin
    for i:= dimL downto pos do
        v[i + 1]:= v[i];
    v[pos].nroCuil:= nroCuil;
    v[pos].nroAf:= nroAf;
    dimL:= dimL + 1;
end;



procedure CargarVector(a: arbol; var v: vector; var dimL: integer; num1, num2: integer; plan: rango);
var
    pos: integer;
begin
    if(a <> nil) and (dimL < dimF) then begin
        CargarVector(a^.hi, v, dimL, num1, num2, plan);
        if(a^.dato.nroCuil > num1) and (a^.dato.nroCuil < num2) and (a^.dato.plan = plan) then begin
            pos:= BuscarPos(v, dimL, a^.dato.nroCuil);
            Insertar(v, dimL, pos, a^.dato.nroCuil, a^.dato.nroAf);
        end;
        CargarVector(a^.hd, v, dimL, num1, num2, plan);
    end;
end;

procedure ImprimirArbol(a: arbol);
begin
    if( a <> nil) then begin
        ImprimirArbol(a^.hi);
        writeln(a^.dato.nroAf);
        writeln(a^.dato.nroCuil);
        ImprimirArbol(a^.hd);
    end;    
end;

var
    a: arbol;
    num1, num2, i: integer;
    plan: rango;

    v: vector; 
    dimL: integer;
begin
    a:= nil;
    dimL:= 0;
    CargarArbol(a); // Se dispone    Ordenado por numero de afiliado
    ImprimirArbol(a);



    writeln('Ingrese los datos a cargar el vector');
    readln(num1);
    readln(num2);
    readln(plan);
    CargarVector(a, v, dimL, num1, num2, plan);  // Ordenado por numero de cuil.


    for i := 1 to dimL do begin
        writeln(v[i].nroCuil);
        writeln(v[i].nroAf);
        writeln('-------');
    end;
end.