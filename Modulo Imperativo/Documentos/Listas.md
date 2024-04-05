
<h1 align='center'> Listas </h1>

Indice
=================
- [Declaracion](#declaracion)
- [Agregar Adelante](#agregar_adelante)
- [Agregar Atras](#agregar_atras)
- [Agregar Ordenado](#agregar_ordenado)
- [Imprimir](#imprimir)
- [Imprimir Rec](#imprimir_rec)


Recursivo
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
Procedure AgregarOrdenado (var l: lista; d: dato);
var
    nue,ant,act: lista;
Begin
    new(nue);
    nue^.dato:= d;
    act:= l;
    while (act <> Nil) and (dato < act^.dato) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (l = act) then
        l := nue
    else
        ant^.sig:= nue;
    nue^.sig:= act;
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
```

<h2 align="center"> Recursivo </h2>


Imprimir_Rec
===========
```pascal
procedure ImprimirRec(l: lista);
begin
    if(l <> nil) then begin
        writeln(l^.dato);
        ImprimirRec(l^.sig);
    end;
end;
```