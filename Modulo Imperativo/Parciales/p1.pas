{1) Una obra social dispone de un árbol binario de búsqueda con la información de sus 
afiliados. De cada afiliado se conoce: Número de afiliado, Nro de DNI, Plan (1..5) y año de
anio af la obra social. El árbol se encuentra ordenado por número de afiliado. Se 
solicita:
Implementar un módulo que reciba el árbol de afiliados, Nro de DNI Num1, Nro de DNI 
Num2 y un número de Plan, y retorne un vector ordenado por Nro de DNI del afiliado. El 
vector debe contener el número de afiliado y DNI de aquellos afiliados cuyo Nro de DNI se
encuentra comprendido entre Num1 y Num2 (siendo Num1 menor que Num2) y el Plan se
corresponda con el recibido por parámetro. Por norma de la obra social, cada Plan puede 
contar con af lo sumo 500 afiliados. }


program parcial1;
const
    dimF = 500;
    p = 5;
type
    rango= 1..p;
    afiliado = record
        nroAf: integer;
        nroDni: integer;
        plan: rango;
        anio: integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato: afiliado;
        hi: arbol;
        hd: arbol;
    end;

    afiliado2 = record
        nroAf: integer;
        nroDni: integer;
    end;

    vector = array[1..dimF] of afiliado2;

procedure CargarArbol(var a: arbol);

    procedure LeerAfiliado(var af: afiliado);
    begin
        writeln('Ingrese el nro de afiliado');
        readln(af.nroAf);
        if(af.nroAf <> 0) then begin
            writeln('Ingrese el nro de dni');
            readln(af.nroDni);
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
    while(pos <= dimL) and (x > v[pos].nroDni) do 
        pos:= pos + 1;
    BuscarPos:= pos;
end;

procedure Insertar(var v: vector; var dimL: integer; pos: integer; nroDni, nroAf: integer);
var
    i: integer;
begin
    for i:= dimL downto pos do
        v[i + 1]:= v[i];
    v[pos].nroDni:= nroDni;
    v[pos].nroAf:= nroAf;
    dimL:= dimL + 1;
end;

procedure CargarVector(a: arbol; var v: vector; var dimL: integer; num1, num2, plan: integer);
var
    pos: integer;
begin
    if(a <> nil) and (dimL < dimF) then begin
        CargarVector(a^.hi, v, dimL, num1, num2, plan);
        if(a^.dato.nroDni >= num1) and (a^.dato.nroDni <= num2) and (a^.dato.plan = plan) then begin
            
            pos:= BuscarPos(v, dimL, a^.dato.nroDni);
            Insertar(v, dimL, pos, a^.dato.nroDni, a^.dato.nroAf);
            
            //dimL:= dimL + 1;
            //v[dimL].nroAf:= a^.dato.nroAf;
            //v[dimL].nroDni:= a^.dato.nroDni;
        end;
        CargarVector(a^.hd, v, dimL, num1, num2, plan);
    end;

end;


var
    a: arbol;
    num1, num2, plan: integer;
    v: vector;
    dimL, i: integer;
begin
    CargarArbol(a); // Se dispone
    writeln('Ingrese el num1: ');
    readln(num1); 
    writeln('Ingrese el num2: ');
    readln(num2); 
    writeln('Ingrese el plan: ');
    readln(plan);
    CargarVector(a, v, dimL, num1, num2, plan);



    writeln('Resultado:');
    for i:= 1 to dimL do begin
        writeln(v[i].nroDni);
        writeln(v[i].nroAf)
    end;

end.