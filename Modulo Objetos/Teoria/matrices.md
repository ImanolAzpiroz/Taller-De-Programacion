


<h1 align="center">Matrices</h1>


<h2>Recorrido Total</h2>

```java
for(int i = 0, i < cantFilas, i++){
    for(int j = 0, j < cantColumnas, j++){
        matriz[i][j].algunaFuncion();
    }
}
```

<h2>Recorrido con vector de Dimension Logica </h2>

``` java
int[] vectorDimL = new int[cantFilas];

for(int i = 0; i < cantFilas; i++){
    for(int j = 0; j < vectorDimL[i]; j++){
        matriz[i][j].algunaFuncion();
    }
}
```

<h2>Recorrido Parcial (Seguro se encuentra)</h2>

```java
int i = 0;
int j = 0;
boolean esta = false;
while(i < cantFilas && !esta){
    while(j < cantColum && !esta){
        if (matriz[i][j].algunaFuncion()){
            esta = true;
        }    
        j++;
    }
    j = 0;
    i++;
}

```