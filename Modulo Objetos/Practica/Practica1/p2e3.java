/*
3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class p2e3 {

    public static void main(String[] args) {
        int i, j;
	//Paso 2. iniciar el generador aleatorio     
        //GeneradorAleatorio.iniciar();
        
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
       int matriz [][];
       matriz = new int[5][5];
       
       for (i = 0; i < 5; i++){
           for(j = 0; j < 5; j++){
               matriz[i][j] = GeneradorAleatorio.generarInt(30);
           }
               
       }
           
        //Paso 4. mostrar el contenido de la matriz en consola
        
        for (i = 0; i < 5; i++)
           for(j = 0; j < 5; j++)
               System.out.println("Fila " + i + " Column " + j + " " + matriz[i][j]);
        
    
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int sumaFila1 = 0;
        for(i = 0; i < 5; i++)
            sumaFila1 += matriz[1][i];    // Suma los valores de la fila 1 (la segunda fila)
        System.out.println(sumaFila1);
        
        
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        // Declaro vector
        int vector [];
        vector = new int[5];
        
        // Inicializo en cero (
        for (j = 0; j < 5; j++){
            vector[j] = 0;
        }
        
        // Recorro la matriz y sumo por columnas al vector
        for(i = 0; i < 5; i++){
            for(j = 0; j < 5; j++){
                vector[j] += matriz[i][j];
            }  
        }
            
        // Imprimo
        for (j = 0; j < 5; j++)
            System.out.println(vector[j]);
        
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        boolean esta = false;
        
        System.out.println("Ingrese un numero entero: ");
        int nro = PaqueteLectura.Lector.leerInt();
        
        for(i = 0; ((i < 5) && (!esta)); i++){
            for(j = 0; j < 5 && !esta ; j++){
                if(matriz[i][j] == nro)
                    esta = true;
            }  
        }
        
        if(esta)
            System.out.println("El nro se encuentra en: [" + (i - 1) + "] [" + (j - 1) + "]");
        else
            System.out.println("El nro no se encuentra");
    }
}