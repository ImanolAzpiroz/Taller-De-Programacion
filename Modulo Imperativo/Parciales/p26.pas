{26) Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente 
registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y
costo abonado por sesión. Implemente un programa que:
a) Genere un ABB ordenado por cód. de paciente. Para ello, genere información hasta el 
paciente con dni 0.

A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con código y dni de los pacientes de osde, sabiendo que cómo 
máximo son 100. La estructura debe ordenarse por código ascendentemente .

c) Dado un código de paciente, aumentar el costo abonado por sesión en un monto 
recibido. Considere que el paciente puede no existir.
NOTA: Realice el programa principal que invoque a los módulos desarrollados.}

program p16;

const
    dimF = 100;
type
    paciente = record
        dni: integer;
        cod: integer;
        obSoc: integer;
        costo: real;
    end;

    Arbol = ^nodo;   // Ordenado por cod
    nodo = record
        dato: paciente;
        hi: arbol;
        hd: arbol;
    end;

    paciente2 = record
        cod: integer;
        dni: integer;
    end;

    vector = array[1..dimF] of paciente2;   // Ordenado por cod

procedure CargarArbol(var a: arbol);
    procedure LeerPaciente(var p: paciente);
    begin
        writeln('Ingrese el nro de dni: ');
        readln(p.dni);
        if(p.dni <> 0) then begin
            writeln('Ingrese el codigo: ');
            readln(p.cod);
            writeln('Ingrese la obra social: ');
            readln(p.obSoc);
            writeln('Ingrese el costo: ');
            readln(p.costo);
        end;
        writeln('-----');
    end;


    procedure Agregar(var a: arbol; p: paciente);
    begin
        if(a = nil) then begin
            new(a);
            a^.dato:= p;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else
            if(p.cod < a^.dato.cod) then
                Agregar(a^.hi, p)
            else
                Agregar(a^.hd, p);
    end;

var
    p: paciente;
begin
    a:= nil;
    LeerPaciente(p);
    while(p.dni <> 0) do begin
        Agregar(a, p);
        LeerPaciente(p);
    end;
end;



procedure CargarVector(a: arbol; var v: vector; var dimL: integer);

begin
    if (a <> nil) and (dimL < dimF) then begin
        CargarVector(a^.hi, v, dimL);
        if(a^.dato.obSoc = 3) then begin
            dimL:= dimL + 1;
            v[dimL].dni:= a^.dato.dni;
            v[dimL].cod:= a^.dato.cod;
        end;
        CargarVector(a^.hd, v, dimL);
    end;
end;


procedure AumentarCosto(a: arbol; cod: integer; monto: real; var ok: boolean);
begin
    if(a <> nil) and (not ok) then begin
        if(a^.dato.cod = cod ) then begin
            a^.dato.costo:= a^.dato.costo + monto;
            ok:= true;
        end
        else    
            if(cod < a^.dato.cod) then
                AumentarCosto(a^.hi, cod, monto, ok)
            else
                AumentarCosto(a^.hd, cod, monto, ok);
    end;    
end;



procedure ImprimirArbol(a: arbol);
begin
    if(a <> nil) then begin
        ImprimirArbol(a^.hi);
        writeln('Cod: ', a^.dato.cod);
        writeln('Dni: ', a^.dato.dni);
        writeln('Costo: ', a^.dato.costo:1:2);
        ImprimirArbol(a^.hd);
    end;
end;

procedure ImprimirVector(v: vector; dimL: integer);
var 
    i: integer;
begin
    writeln('--- Vector --- ');
    for i:= 1 to dimL do begin
        writeln('Cod: ', v[i].cod);
        writeln('Dni: ', v[i].dni);
    end;
end;




// PROGRAMA PRINCIPAL
var
    a: arbol;
    v: vector; dimL: integer;
    cod: integer; monto: real; ok: boolean;
begin
    CargarArbol(a);
    ImprimirArbol(a);

    dimL:= 0;
    CargarVector(a, v, dimL);
    ImprimirVector(v, dimL);


    ok:= false;
    writeln('Ingrese el cod a aumentar: ');
    readln(cod);
    writeln('Ingrese el monto a aumentar: ');
    readln(monto);
    AumentarCosto(a, cod, monto, ok);
    if(ok) then
        writeln('Se aumento el costo.')
    else
        writeln('No existe paciente con el cod ingresado.');


    ImprimirArbol(a);
end.