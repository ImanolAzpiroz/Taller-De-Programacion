package tema1;

/*
2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
*/


public class p2e2 {

  
    public static void main(String[] args) {
        
        //Paso 2: Declarar la variable vector de double 
        Double alturas[]; 
        
        //Paso 3: Crear el vector para 15 double 
       alturas = new Double[15];
       
        //Paso 4: Declarar indice y variables auxiliares a usar
       int i, cantSup;  
       double promedio;
       
       cantSup = 0;
       
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < 15; i++)
            alturas[i]= GeneradorAleatorio.generarDouble(3);
        
   
            
       for (i = 0; i < 15; i++) System.out.println(alturas[i]);
        
            
        
       
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = 0;
        for (i = 0; i < 15; i++)
            promedio += alturas[i];
        promedio = promedio / 15;
        System.out.println("El promedio es: " + promedio);
        
            
            
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i = 0; i < 15; i++)
            if(alturas[i] > promedio)
                cantSup++;

        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad por encima del prom es: " + cantSup);
    }
    
}
