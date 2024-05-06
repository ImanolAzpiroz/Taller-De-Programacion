/*
3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.

Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Imanol
 */
public class P2E3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        //GeneradorAleatorio.iniciar();
        String nombre;
        int dni;
        int edad;
        
        Persona[][] mp = new Persona[5][8]; 
        int i = 0; int dimDia= 0;
        int j = 0; int dimTur = 0;
        
        
        
        nombre = GeneradorAleatorio.generarString(1);
        dni = GeneradorAleatorio.generarInt(30000);
        edad = GeneradorAleatorio.generarInt(100);
        
        
        
        
        
        for (i = 0; i < 5 && !nombre.equals("z"); i++){
            for(j = 0; j < 8 && !nombre.equals("z"); j++){
                mp[i][j] = new Persona(nombre, dni, edad); 
                
                
                nombre = GeneradorAleatorio.generarString(1);
                dni = GeneradorAleatorio.generarInt(30000);
                edad = GeneradorAleatorio.generarInt(100);
                System.out.println("(" + i + "," + j + ")"  + mp[i][j]);
                
            }
        }
        
        /*
        System.out.println("---Para verificar---");
        System.out.println(nombre);
        System.out.println(i);
        System.out.println(j);
        */
        
        i = 0; j = 0;
        
        //for (i = 0; mp[i][j] != null && i < 5; i++){
         //   for(j = 0; mp[i][j] != null && j < 8; j++){
                //System.out.println("(" + i + "," + j + ")"  + mp[i][j]);
                
       //     }
      //  }
        
        
     
        
        
      
        
    }
    
}
