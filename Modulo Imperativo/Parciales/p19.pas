{
    19) Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente
registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y
costo abonado por sesión. Implemente un programa que:

a) Genere un ABB ordenado por cód. de paciente. Para ello, genere información hasta el
paciente con dni 0.
A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con código y dni de los pacientes de osde, sabiendo que cómo
máximo son 100. La estructura debe ordenarse por código ascendentemente .
c) Dado un código de paciente, aumentar el costo abonado por sesión en un monto
recibido. Considere que el paciente puede no existir.
NOTA: Realice el programa principal que invoque a los módulos desarrollados.

}

program parcial19;
const   
    dimF = 100;
type 
    paciente = record
        dni: integer;
        cod: integer;
        obraSoc: integer;
        costo: real;
    end;

    arbol = ^nodo;
    nodo = record
        dato: paciente;
        hi: arbol;
        hd: arbol;
    end;

    paciente2 = record
        dni: integer;
        cod: integer;
    end;

    vector = array[1..dimF] of paciente2;

procedure CargarArbol(var a: arbol);

    procedure LeerPaciente(var p: paciente);
    begin
        writeln('Ingrese el dni');
        readln(p.dni);
        if(p.dni <> 0) then begin
            writeln('Ingrese el cod');
            readln(p.cod);
            writeln('Ingrese el plan');
            readln(p.obraSoc);
            writeln('Ingrese el costo');
            readln(p.costo);
        end;
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
            if(p.cod<= a^.dato.cod) then
                Agregar(a^.hi, p)
            else
                Agregar(a^.hd, p);
    end;
var
    p: paciente;
begin
    LeerPaciente(p);
    while(p.dni <> 0) do begin
        Agregar(a, p);
        LeerPaciente(p);
    end;

end;



procedure CargarVector(a: arbol; var v: vector; var dimL: integer);
begin
    
    if(a <> nil) and (dimL < dimF) then begin
        CargarVector(a^.hi, v, dimL);
        if(a^.dato.obraSoc = 3) then begin
            dimL:= dimL + 1;
            v[dimL].dni:= a^.dato.dni;
            v[dimL].cod:= a^.dato.cod;
        end;
        CargarVector(a^.hd, v, dimL);

    end;
end;

procedure AumentarCosto(var a: arbol; x: integer; monto: real; var esta: boolean);
begin
    if(a <> nil) and (not esta) then begin
        if(x < a^.dato.cod) then
            AumentarCosto(a^.hi, x, monto, esta)
        else    
            AumentarCosto(a^.hd, x, monto, esta);
        if(a^.dato.cod = x) then begin
            a^.dato.costo:= a^.dato.costo + monto;
            esta:= true;
        end;
    end;
end;


procedure Imprimir(a: arbol);
begin
    if(a <> nil) then begin
        Imprimir(a^.hi);
        writeln(a^.dato.costo:1:2);
        Imprimir(a^.hd);
    end;
end;

var 
    a: arbol; v: vector; dimL: integer;
    i: integer;

    x: integer; monto: real; esta: boolean;
begin
    dimL:= 0;
    CargarArbol(a);
    CargarVector(a, v, dimL);

    writeln('Ingrese un codigo de paciente: ');
    readln(x);
    writeln('Ingrese un monto: ');
    readln(monto);
    AumentarCosto(a, x, monto, esta);

    if(esta) then
        writeln('Se aumento el costo al paciente')
    else
        writeln('No existe paciente con ese cod');

    Imprimir(a);

    //for i:= 1 to dimL do begin
    //    writeln(v[i].cod);
    //end;
end.