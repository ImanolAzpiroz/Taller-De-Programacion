{
    2.  Escribir un programa que: 
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee 
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de 
producto 0. Un producto puede estar en más de una venta. Se pide: 

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de 
producto. 

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por 
código de producto. Cada nodo del árbol debe contener el código de producto y la 
cantidad total de unidades vendida. 
Nota: El módulo debe retornar los dos árboles. 

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne 
la cantidad total de unidades vendidas de ese producto. 

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne 
la cantidad total de unidades vendidas de ese producto. 
}

program p3e2;

type
    venta = record
        cod: integer;
        fecha: integer;
        cant: integer;
    end;

    producto = record
        cod: integer;
        cantTotal: integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato: venta;
        hi: arbol;
        hd: arbol;
    end;

    arbol2 = ^nodo2;
    nodo2 = record
        dato: producto;
        hi: arbol2;
        hd: arbol2;
    end;

procedure CargarArbol(var a: arbol; var a2: arbol2);

    procedure LeerVenta(var v: venta);
    begin
        writeln('Ingrese el codigo de producto: ');
        readln(v.cod);
        if(v.cod <> 0) then begin
            writeln('Ingrese la fecha: ');
            readln(v.fecha);
            writeln('Ingrese la cantidad de productos vendidos ');
            readln(v.cant);
        end;
        writeln('-------');
    end;

    procedure Cargar(var a: arbol; v: venta);
    begin
        if(a = nil) then begin
            new(a);
            a^.dato:= v;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else
            if(v.cod <= a^.dato.cod) then   
                Cargar(a^.hi, v)
            else
                Cargar(a^.hd, v);    
    end;

    procedure Cargar2(var a2: arbol2; v: venta);
    begin
        if(a2 = nil) then begin
            new(a2);
            a2^.dato.cod:= v.cod; a2^.dato.cantTotal:= v.cant;
            a2^.hi:= nil;
            a2^.hd:= nil;
     
        end
        else  
            if(a2^.dato.cod = v.cod) then
                a2^.dato.cantTotal:=  a2^.dato.cantTotal + v.cant
            else
                if(v.cod < a2^.dato.cod) then
                    Cargar2(a2^.hi, v)
                else
                    Cargar2(a2^.hd, v);
    end;





var
    v: venta;
begin
    a:= nil; 
    a2:= nil;
    LeerVenta(v);
    while (v.cod <> 0) do begin
        Cargar(a, v);
        Cargar2(a2, v);
        LeerVenta(v);
    end;
end;

procedure imprimir(a: arbol);
begin
    if(a <> nil) then begin
        imprimir(a^.hi);
        writeln(a^.dato.cod);
        writeln(a^.dato.cant);
        imprimir(a^.hd);
    end;
end;

procedure imprimir2(a2: arbol2);
begin
    if(a2 <> nil) then begin
        imprimir2(a2^.hi);
        writeln(a2^.dato.cod);
        writeln(a2^.dato.cantTotal);
        imprimir2(a2^.hd);
    end;
end;


function SumarVentas(a: arbol; cod: integer): integer;
begin
    if(a = nil) then
        SumarVentas:= 0
    else
        if(a^.dato.cod = cod) then
            SumarVentas:= a^.dato.cant + SumarVentas(a^.hi, cod) + SumarVentas(a^.hd, cod)
        else
            if(cod < a^.dato.cod) then
                SumarVentas:= SumarVentas(a^.hi, cod)
            else
                SumarVentas:= SumarVentas(a^.hd, cod);
end;

function SumarVentas2(a2: arbol2; cod: integer): integer;
begin
    if(a2 = nil) then    
        SumarVentas2:= 0
    else
        if(a2^.dato.cod = cod) then
            SumarVentas2:= a2^.dato.cantTotal
        else
            if(cod < a2^.dato.cod)then
                SumarVentas2:= SumarVentas2(a2^.hi, cod)
            else    
                SumarVentas2:= SumarVentas2(a2^.hd, cod);
end;




var
    a: arbol; a2: arbol2;

    totalVentas1: integer;
    cod: integer;
begin
    CargarArbol(a, a2);

    writeln('Primero');
    imprimir(a);
    
    writeln('Segundo');
    imprimir2(a2);

    writeln('Ingrese un codigo a buscar: ');
    readln(cod);
    writeln('La cantidad de ventas del codigo ingresado es: ', SumarVentas(a, cod));
    writeln('La cantidad de ventas del codigo ingresado es: ', SumarVentas2(a2, cod));
end.