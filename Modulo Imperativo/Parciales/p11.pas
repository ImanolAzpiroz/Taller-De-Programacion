{11) Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente 
registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y
costo abonado por sesión. Implemente un programa que: 
a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con 
dni 0. 
A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con dni y cód de paciente de los pacientes de ioma, ordenados 
por dni descendente.
c) Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el
paciente puede no existir. 
NOTA: Realice el programa principal que invoque a los módulos desarrollados
}


program p11;

type
    paciente = record
        dni: integer;
        cod: integer;
        obraSoc: integer;
        costo: real;
    end;

    arbol = ^nodo;
    nodo= record
        dato: paciente;
        hi: arbol;
        hd: arbol;
    end;


    paciente2 = record
        dni: integer;
        cod: integer;
    end;

    lista = ^nodoL;
    nodoL = record
        dato: paciente2;
        sig: lista;
    end;

procedure CargarArbol(var a: arbol);

    procedure LeerPaciente(var p: paciente);
    begin
        writeln('Ingrese el dni');
        readln(p.dni);
        if(p.dni <> 0) then begin
            writeln('Ingrese el cod');
            readln(p.cod);
            writeln('Ingrese la obra social');
            readln(p.obraSoc);
            //writeln('Ingrese el costo');
            //readln(p.costo);
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
            if(p.dni <= a^.dato.dni) then
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


procedure CargarLista(a: arbol; var l, ult: lista);

    procedure AgregarAdelante(var l, ult: lista; dni, cod: integer);
    var
        nue: lista;
    begin
        new(nue);
        nue^.dato.cod:= cod;
        nue^.dato.dni:= dni;
        nue^.sig:= nil;
        if(l <> nil) then
            ult^.sig:= nue
        else
            l:= nue;
        ult:= nue;
    end;



begin
    if(a <> nil) then begin
        CargarLista(a^.hd, l, ult);
        if(a^.dato.obraSoc = 1) then
            AgregarAdelante(l, ult,a^.dato.dni, a^.dato.cod); 
        CargarLista(a^.hi, l, ult);
    end;    
end;


procedure ImprimirArbol(a: arbol);
begin
    if(a <> nil) then begin
        ImprimirArbol(a^.hi);
        writeln('Dni: ', a^.dato.dni);
        writeln('Obra soc: ', a^.dato.obraSoc);
        ImprimirArbol(a^.hd);
    end;
end;

procedure ImprimirLista(l: lista);
begin
    while (l <> nil) do begin
        writeln(l^.dato.cod);
        writeln(l^.dato.dni);
        l:= l^.sig;
    end;
end;


procedure ModificarObra(a: arbol; dni, obraSocNue: integer; var ok: boolean);
begin
    if (a <> nil) and (not ok) then begin
        if(a^.dato.dni = dni) then begin
            a^.dato.obraSoc:= obraSocNue;
            ok:= true;
        end
        else
            if(dni < a^.dato.dni) then
                ModificarObra(a^.hi, dni, obraSocNue, ok)
            else
                ModificarObra(a^.hd, dni, obraSocNue, ok);
    end;
end;


var
    a: arbol;
    l, ult: lista;

    ok: boolean;
    dni, obraSocNue: integer;
begin
    l:= nil; 
    CargarArbol(a);

    ok:= false;
    writeln('Ingrese el dni a modificar: ');
    readln(dni);
    writeln('Ingrese la obra social nueva: ');
    readln(obraSocNue);
    ModificarObra(a, dni, obraSocNue, ok);


    writeln('Arbol: ');
    ImprimirArbol(a);
    CargarLista(a, l, ult);
    writeln('Lista: ');
    ImprimirLista(l);



end.