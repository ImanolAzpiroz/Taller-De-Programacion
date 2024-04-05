<h1 align='center'> Vectores </h1>

Indice
=================
- [Declaracion](#declaracion)
- [Cargar](#cargar)
- [Recorrido](#recorrido)

Recursivo
- [Imprimir Recursivo](#imprimir_rec)

Ordenar
- [Seleccion](#seleccion)
- [Insercion](#insercion)

Declaracion
===========
```pascal
vector = array[1..Dimf] of tipoDato;
```

Cargar
===========
```pascal
procedure CargarVector(var v: vector; var dimL: integer);
var
    num: integer;
begin
    dimL:= 0;
    readln(num);
    while(dimL < dimF) and (num <> 0)do begin
        dimL:= dimL + 1;
        v[dimL]:= num;
        readln(num);
    end;
end;
```



Recorrido
==========
<table>
<tr>
    <td align="center"> Recorrido Total </td> <td align="center"> Recorrido Parcial </td><td align=""> Recorrido Parcial 2 </td>
</tr>
<tr>
<td>
 
```Pascal
procedure RecorridoTotal(v: vector; dimL: integer);
var
    i:integer;
begin
    for i:=1 to dimL do
       writeln(v[i]);
end;
```
</td>
<td>
 

```Pascal
procedure RecorridoParcial(v: vector; dimL: integer);
var //(Seguro Existe)
    i:integer;
begin
    i:=1;
    while (v[i] <> 0) do
    begin
       writeln(v[i]);
       i:=i+1;
    end;
end;
```
 
</td>

 <td>
 
```Pas
procedure RecorridoParcial2(v: vector; dimL: integer);
var //(Puede no Existir)
    i:integer;
begin
    i:=1;
    while (i <= dimF) and (v[i] <> 0) do
       i:=i+1;
    if (i <= dimF ) then
       writeln ('Existe');
    else
       writeln ('No Existe');
end;
```
</td>
</tr>
</table>




Imprimir_Rec
==========
```pascal
procedure ImprimirRecursivo(v: vector; dimL: integer);
begin
    if(dimL <> 0) then begin
        writeln(v[dimL]);
        ImprimirRecursivo(v, dimL - 1);
    end;
end;
```