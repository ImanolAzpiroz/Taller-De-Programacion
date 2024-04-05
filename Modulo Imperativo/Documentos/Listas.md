
<h1 align='center'> Listas </h1>

Indice
=================

   * [Declaracion](#Declaracion)
   * [Imprimir](#imprimir)


Declaracion
===========
```pascal
lista = ^nodo;
nodo = record
    dato: tipoDato;
    sig: lista;
end;
```

Agregar Adelante
===========
```pascal
procedure AgregarAdelante(var l: lista; d: tipoDato);
var
    nue: lista;
begin
    new(nue);
    nue^.dato:= d;
    nue^.sig:= l;
    l:= nue;
end;
```
Agregar Atras
===========
```pascal
procedure AgregarAtras(var pri, ult: lista; d: tipoDato);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= d;
	nue^.sig:= nil;
	if(pri <> nil) then begin
		ult^.sig:= nue
	else
		pri:= nue;
	ult:= nue;
end;
```
Agregar Ordenado
===========
```pascal
procedure AgregarOrdenado(var l: lista; d: tipoDato);

end;
```

Imprimir
===========
```pascal
procedure Imprimir(l: lista);
begin
    while(l <> nil) do begin
        writeln(l^.dato);
        l:= l^.sig;
    end;
end;
```