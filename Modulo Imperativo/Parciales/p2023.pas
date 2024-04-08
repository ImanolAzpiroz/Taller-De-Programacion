{
    Un supermercado quiere llevar un registro de todas sus ventas, de cada venta se lee el codigo, dni del cliente, suscursal en la que compró (1..5) y monto gastado,
     la lectura se detiene con el código de venta 0, se pide:

A- crear una estructura eficiente para la busqueda por dni de cliente, de cada cliente se guarda el monto gastado en cada sucursal

B-un módulo que reciba la estructura generada en A y un número de sucursal y retorne la cantidad de clientes que no gastaron nada en la sucursal

C-un modulo que reciba la estructura generara en A y un dni y retorne el monto total general gastado por dicho dni (es decir, la suma de los montos de todas las sucursales)
}



program p52;

type
    venta = record
        cod: integer;
        dni: integer;
        suc: integer;  //1..5
        monto: real;
    end;

    vectorSuc = array [1..5] of real;

    cliente = record
        dni: integer;
        vs: vectorSuc;
    end;

    arbol = ^nodo;
    nodo = record
        dato: cliente;
        hi: arbol;
        hd: arbol;
    end;


procedure CargarArbol(var a: arbol);


    procedure InicializarVector(var v: vectorSuc);
    var
        i: integer;
    begin
        for i:= 1 to 5 do
            v[i]:= 0;
    end;

    procedure LeerVenta(var v: venta);
    begin
        writeln('Ingrese el cod: ');
        readln(v.cod);
        if(v.cod <> 0) then begin
            writeln('Ingrese el dni: ');
            readln(v.dni);
            writeln('Ingrese la sucursal: ');
            readln(v.suc);
            writeln('Ingrese el monto: ');
            readln(v.monto);
        end;
        writeln('--------');
    end;


    procedure Agregar(var a: arbol; v: venta);
    begin
        if(a= nil) then begin
            new(a);
            InicializarVector(a^.dato.vs);
            a^.dato.vs[v.suc]:= a^.dato.vs[v.suc] + v.monto;
            a^.dato.dni:= v.dni;

            a^.hi:= nil;
            a^.hd:= nil;
        end
        else
            if(a^.dato.dni = v.dni) then begin
                a^.dato.vs[v.suc]:= a^.dato.vs[v.suc] + v.monto;
            end
            else
                if(v.dni < a^.dato.dni) then
                    Agregar(a^.hi, v)
                else
                    Agregar(a^.hd, v);
    end;


var
    v: venta;
begin
    LeerVenta(v);
    while(v.cod <> 0) do begin
        Agregar(a, v);
        LeerVenta(v);
    end;
end;


procedure Imprimir(a: arbol);
var
    i: integer;
begin
    if(a <> nil) then begin
        Imprimir(a^.hi);
        writeln('Dni: ', a^.dato.dni);
        for i:= 1 to 5 do
            writeln('Suc nro ', i, ': ', a^.dato.vs[i]:1:2);
        Imprimir(a^.hd);
    end;
end;


procedure RetornarVacios(a: arbol; nroSuc: integer; var cant: integer);
begin
    if(a <> nil) then begin
        RetornarVacios(a^.hi, nroSuc, cant);
        if(a^.dato.vs[nroSuc] = 0) then
            cant:= cant + 1;
        RetornarVacios(a^.hd, nroSuc, cant);
    end;
end;


procedure RetornarTotal(a: arbol; dni: integer; var total: real);

    procedure RecorrerVector(v: vectorSuc; var total: real);
    var
        i: integer;
    begin
        for i:= 1 to 5 do 
            total:= total + v[i];
    end;

begin
    if(a <> nil) then begin
        if(a^.dato.dni = dni) then
            RecorrerVector(a^.dato.vs, total);
    end
    else
        if( dni < a^.dato.dni) then
            RetornarTotal(a^.hi, dni, total)
        else
            RetornarTotal(a^.hd, dni, total);
end;




var
    a: arbol;

    nroSuc: integer; cantVacios: integer;
    dni: integer; total: real;
begin
    CargarArbol(a);
    Imprimir(a);


    cantVacios:= 0;
    writeln('Ingrese el nro de sucursal a buscar: ');
    readln(nroSuc);
    RetornarVacios(a, nroSuc, cantVacios);
    writeln('La cantidad de clientes que no compraron nada en esa sucursal es: ', cantVacios);


    total:= 0;
    writeln('Ingrese el dni: ');
    readln(dni);
    RetornarTotal(a, dni, total);
    writeln('El total es: ', total:1:2);
end.
