/*
2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI.
 */
package tema2;

import PaqueteLectura.Lector;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Imanol
 */
public class P2E2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Persona[] vp = new Persona[15];
        String nombre;
        int edad;
        int dni;
        int i = 0;
        GeneradorAleatorio.iniciar();
        int mayor65 = 0;
        Persona pMenorDni = null;
        int menorDni = 99999;

        
        nombre = GeneradorAleatorio.generarString(10);
        dni = GeneradorAleatorio.generarInt(30000);
        edad = GeneradorAleatorio.generarInt(100);

        while(i < 15 && edad != 0){
            
            Persona p = new Persona(nombre,dni,edad);
            vp[i]= p;
            i++;
            
            edad = GeneradorAleatorio.generarInt(100);
            if(edad != 0){
                nombre = GeneradorAleatorio.generarString(10);
                dni = GeneradorAleatorio.generarInt(30000);
            }
        }
        
        System.out.println("--------------------");
        for(int j = 0; j < i; j++){
            if(vp[j].getEdad() > 65){
                mayor65++;
            }
            
            if(vp[j].getDNI() < menorDni){
                menorDni = vp[j].getDNI();
                pMenorDni = vp[j];
            }
            
            
            System.out.println(vp[j].toString());
        }
        
        System.out.println(edad);
        System.out.println("La cantidad de personas con edad mayor a 65 son: " + mayor65);
        System.out.println("Datos de la persona con menor dni: " + pMenorDni.toString());
    }
    
}
