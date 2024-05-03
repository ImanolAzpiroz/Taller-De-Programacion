/*
1- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto
tiene: nombre, código, nombre completo del director y los investigadores que participan
en el proyecto (50 como máximo). De cada investigador se tiene: nombre completo,
categoría (1 a 5) y especialidad. Además, cualquier investigador puede pedir hasta un
máximo de 5 subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.

i) Implemente el modelo de clases teniendo en cuenta:
a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
director.
b. Un investigador sólo debería poder construirse con nombre, categoría y
especialidad.
c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
Un subsidio siempre se crea en estado no-otorgado.

ii) Implemente los métodos necesarios (en las clases donde corresponda) que permitan:

a. void agregarInvestigador(Investigador unInvestigador);
// agregar un investigador al proyecto.

b. void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador.

c. double dineroTotalOtorgado();
//devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
todos los subsidios otorgados de todos los investigadores)

d. void otorgarTodos(String nombre_completo);
//otorgar todos los subsidios no-otorgados del investigador llamado
nombre_completo

e. String toString();
// devolver un string con: nombre del proyecto, código, nombre del director, el
total de dinero otorgado del proyecto y la siguiente información de cada
investigador: nombre, categoría, especialidad, y el total de dinero de sus
subsidios otorgados.
 */
package Repaso;

/**
 *
 * @author Imanol
 */
public class P5E1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Proyecto p = new Proyecto("Proyecto 1", 1, "Ima");
        Investigador i1 = new Investigador("Pedro", 3, "Informatica");
        Investigador i2 = new Investigador("Marcelo", 5, "Ingenieria");
        Investigador i3 = new Investigador("Moria", 2, "Biologia");
        
        Subsidio s1 = new Subsidio(300.0, "Motivo 1");
        Subsidio s2 = new Subsidio(450.0, "Motivo 2");
        
        i1.agregarSubsidio(s1);
        i1.agregarSubsidio(s2);
        i1.otorgarTodos();
        
        i2.agregarSubsidio(s1);
        i2.otorgarTodos();
        
        
        
        p.agregarInvestigador(i1);
        p.agregarInvestigador(i2);
        p.agregarInvestigador(i3);
        System.out.println(p);
    }
    
}
