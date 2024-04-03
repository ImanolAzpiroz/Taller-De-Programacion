<h1 align="center"> Arboles </h1>

Indice
=================

   * [Declaracion](Declaracion)
   * [Cargar](#Cargar)


Declaracion
===========
```pascal
type
    arbol = ^nodo;
    nodo = record
        dato: tipoDato;
        hi: arbol;
        hd: arbol;
    end;
```

Cargar
===========
``` pascal
procedure Cargar(var a: arbol; d: tipoDato);
begin
    if(a = nil) then begin
        new(a);
        a^.dato:= d;
        a^.hi:= nil;
        a^.hd:= nil;
    end
    else
        if(d <= a^.dato) then
            Cargar(a^.hi, d)
        else
            Cargar(a^.hd, d);
end;
```