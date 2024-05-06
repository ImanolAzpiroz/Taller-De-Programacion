


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

<h2>2 Dimensiones Logicas </h2>

``` java
int dimFilas;
int dimColum;

for (int i = 0; i < dimFilas; i++) {
    // Verificar si estamos en la última fila
    boolean esUltimaFila = (i == dimFilas - 1);
    
    // Recorrer todas las columnas, excepto la última si no es la última fila
    int limiteColumnas;
    if (esUltimaFila) {
        limiteColumnas = dimColum;
    } 
    else {
        limiteColumnas = matriz[i].length;
    }

    for (int j = 0; j < limiteColumnas; j++) {
        // Acceder a la matriz[i][j] y realizar operaciones si es necesario
        System.out.println("matriz[" + i + "][" + j + "] = " + matriz[i][j]);
    }
}


```