<h1 align="center"> Arboles </h1>

Indice
=================

- [Indice](#indice)
- [Declaracion](#declaracion)
- [Cargar](#cargar)
- [Imprimir](#imprimir)


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

Imprimir
===========
<table>
<tr>
<td> En Orden </td> <td> Pos Orden </td><td> Pre Orden </td>
</tr>
<tr>
<td>

```pascal
procedure EnOrden(a: arbol);
begin 
    if (a <> nil) then begin
        EnOrden(a^.hi);
        writeln(a^.dato);
        EnOrden(a^.hd);
    end;
end;
```
</td>
<td>

```pascal
Procedure PreOrden (a: arbol);
begin 
    if (a <> nil) then begin
        writeln (a^.dato);   
        PreOrden(a^.hi);
        PreOrden(a^.hd);
    end;
end;
```
</td>
 <td>
  
```pascal
Procedure PosOrden (a: arbol);
begin 
    if (a <> nil) then begin
        PreOrden (a^.hi);
        PreOrden (a^.hd);
        writeln (a^.dato);
    end;
end;
```
</td>
</tr>
 
</table>
