
<h1 align='center'> Listas </h1>

Indice
=================
   * [Declaracion](#Declaracion)
   * [Agregar Adelante](#Agregar_Adelante)
   * [Agregar Atras](#Agregar_Atras)
   * [Agregar Ordenado](#Agregar_Ordenado)
   * [Imprimir](#imprimir)
   * [Imprimir Recursivo](#imprimir_rec)
   

Declaracion
===========
```pascal
lista = ^nodo;
nodo = record
    dato: tipoDato;
    sig: lista;
end;
```

Agregar_Adelante
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
Agregar_Atras
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
Agregar_Ordenado
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


<h2 align="center">Recursivo</h2>

Imprimir_Rec
```pascal
procedure ImprimirRec(l: lista);
begin
    if(l <> nil) then begin
        writeln(l^.dato);
        ImprimirRec(l^.sig);
    end;
end;
```