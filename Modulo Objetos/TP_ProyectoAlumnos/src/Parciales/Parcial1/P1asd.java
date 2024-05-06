/*
Representar alumnos de una facultad. De cualquier alumno se conoce: DNI, nombre y sus materias aprobadas (como
máximo N). De las materias aprobadas se registra: nombre, nota y fecha. Además de los alumnos de grado se tiene la
carrera, mientras que de los alumnos de doctorado el título universitario y universidad de origen.

1- Genere las clases necesarias. Provea constructores para iniciar las materias aprobadas y los alumnos a partir de la
información necesaria (estos para un máximo de N materias aprobadas y sin materias aprobadas inicialmente).

2- Implemente los métodos necesarios, en las clases que corresponda, para:
a) Dada una materia aprobada, agregarla a las materias aprobadas del alumno.

b) Determinar si el alumno está graduado, teniendo en cuenta que para ello deben tener un total de N materias
aprobadas y deben tener aprobada la materia “Tesis”.

c) Obtener un String que represente al alumno siguiendo el ejemplo:
Ej. alumnos de grado “DNI; Nombre; Materias aprobadas: nombre, nota y fecha de c/u; Está graduado: …; Carrera”
Ej. alumnos de doctorado “DNI; Nombre; Materias aprobadas: nombre, nota y fecha de c/u; Está graduado: …; Título;
Universidad de Origen”

3- Realice un programa que instancie un alumno de cada tipo. Cargue información de materias aprobadas a cada
uno. Informe en consola el resultado del inciso c).
 */
package Parciales.Parcial1;

/**
 *
 * @author Imanol
 */
public class P1asd {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        AlumnoDoctorado a1 = new AlumnoDoctorado("Lic Informatica", "Unlp", 33123, "Ima", 3);
        AlumnoGrado a2 = new AlumnoGrado("Tecnico Sonido", 22222, "Imi", 4);
        
        Materia m1 = new Materia("Tesis", 8, 10);
        Materia m2 = new Materia("Biologia", 7, 11);
        Materia m3 = new Materia("Matematica", 7, 11);
        Materia m4 = new Materia("Filosofia", 10, 4);
        
        a1.agregarMateria(m1);
        a1.agregarMateria(m2);
        a1.agregarMateria(m3);
        
        a2.agregarMateria(m1);
        a2.agregarMateria(m2);
        a2.agregarMateria(m3);
        a2.agregarMateria(m4);
        
        System.out.println(a1.toString());
        System.out.println("--------------");
        System.out.println(a2.toString());
    }
    
}
