<h1>Parciales Imperativo</h1>

![Screenshot_2](https://github.com/ImanolAzpiroz/Taller-De-Programacion/assets/122705871/b671c86f-976a-41c7-a577-566a79931b56)
<details><summary>Programa Completo</summary>

[Programa Completo](Modulo%20Imperativo/Parciales/p19.pas)
</details>

![139688955-b400c87a-b776-4224-b004-25e4c81d3044](https://github.com/ImanolAzpiroz/Taller-De-Programacion/assets/122705871/77e5b5a1-89db-4ff2-8473-c7d1489de853)
<details><summary>Programa Completo</summary>

```pascal
program parcial1;
const
    dimF = 500;
type
    afiliado = record
        nroAf: integer;
        nroDni: integer;
        plan: integer;
        anio: integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato: afiliado;
        hi: arbol;
        hd: arbol;
    end;

    afiliado2 = record
        nroAf: integer;
        nroDni: intger;
    end;

    vector = array[1..dimF] of afiliado2;


procedure Seleccion(var v: vector; dimL: integer);
var
    i, j, p: integer;
    item: afiliado2;
begin
    for i:= 1 to diml - 1 do begin
        p:= i;
        for j:= i + 1 to dimL do
            if(v[j].nroDni < v[p].nroDni) then
                p:= jl
        item:= v[p];
        v[p]:= v[i];
        v[i]:= item;
    end;
end;



procedure CargarVector(a: arbol; var v: vector; var dimL: integer; num1, num2, plan: integer);
begin
    if(a <> nil) and (dimL < dimF) then begin
        CargarVector(a^.hi, v, dimL, num1, num2, plan);
        if(a^.dato.nroDni >= num1) and (a^.dato.nro <= num2) and (a^.dato.plan = plan) then begin
            dimL:= dimL + 1;
            v[dimL].nroAf:= a^.dato.nroAf;
            v[dimL].nroDni:= a^.dato.nroDni;
        end;
        CargarVector(a^.hd, v, dimL, num1, num2, plan);
    end
    else
        Seleccion(v, dimL);
end;


var
    a: arbol;
    num1, num2, plan: integer;
    v: vector;
    dimL: integer;
begin
    CargarArbol(a); // Se dispone
    CargarVector(a, v, dimL, num1, num2, plan);
end;

```

</details>



![139703862-88f0d90c-7dfe-4b8d-a62e-da9307aeb9e7](https://github.com/ImanolAzpiroz/Taller-De-Programacion/assets/122705871/8270e2f5-0b99-48f6-b54a-245d19b7cc01)


![139769845-faf1eaf3-a1bf-46a3-a49b-9dcc73221c87](https://github.com/ImanolAzpiroz/Taller-De-Programacion/assets/122705871/75944998-e433-4772-b405-15a2ea41942c)



![139978268-16c92186-e810-489b-8ed4-536bc80c047f](https://github.com/ImanolAzpiroz/Taller-De-Programacion/assets/122705871/a83e2961-44d1-4301-97bc-05379949b2c8)


![140173507-610b7249-85fb-475e-afdf-f372ca615bd2](https://github.com/ImanolAzpiroz/Taller-De-Programacion/assets/122705871/d4d569ce-64d8-46bd-9a88-e483dc9f3f3b)
