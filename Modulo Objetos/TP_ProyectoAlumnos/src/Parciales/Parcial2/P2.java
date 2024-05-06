/*
MÓDULO OBJETOS. Cree un proyecto y resuelva en Java. IMPORTANTE: Utilice su apellido como nombre
del proyecto. Entrega: comprima el desarrollo en .zip (no debe incluir ningún archivo .jar) y envíe por correo.

Una escuela de música necesita un sistema para realizar un concurso entre sus alumnos. El concurso está
dividido en cinco géneros musicales y en cada género se pueden inscribir hasta N alumnos como máximo. De
cada alumno registra su nombre, edad, el instrumento que toca y puntaje obtenido.

1- Genere las clases necesarias. Implemente constructores para iniciar el concurso sin alumnos inscriptos,
recibiendo N (el máximo de alumnos por género musical). Los alumnos deben instanciarse dando valor a todos
sus atributos y con puntaje -1.

2- Implemente métodos en las clases que corresponda para permitir:

a. Dado un alumno y un género musical válido, inscriba al alumno en dicho género. Asuma que hay lugar.

b. Dado un puntaje y un nombre de alumno, asigne el puntaje a dicho alumno. NOTA: El alumno podría no
estar inscripto en el concurso.

c. Devolver el género musical con más alumnos inscriptos.

3- Realice un programa que instancie un concurso con un máximo de 20 alumnos por género. Instancie 5
alumnos e inscriba a cada uno en algún género musical. Asigne puntaje a cada uno. Imprima el resultado de la
consulta pedida.
 */
package Parciales.Parcial2;

/**
 *
 * @author Imanol
 */
public class P2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Concurso c = new Concurso(20);
        Alumno a1 = new Alumno("Imanol", 27, "Guitarra");
        Alumno a2 = new Alumno("Valen", 23, "Bajo");
        Alumno a3 = new Alumno("Fiora", 10, "Teclado");
        Alumno a4 = new Alumno("Mishu", 1, "Guiro");
        Alumno a5 = new Alumno("Mabel", 10, "Bateria");
        
        
        c.agregarAlumno(a1, 3);
        c.agregarAlumno(a2, 2);
        c.agregarAlumno(a3, 2);
        c.agregarAlumno(a4, 1);
        c.agregarAlumno(a5, 0);
        
        c.asignarPuntaje("Imanol", 6);
        c.asignarPuntaje("Valen", 7);
        c.asignarPuntaje("Fiora", 10);
        c.asignarPuntaje("Mishu", 9);
        c.asignarPuntaje("Mabel", 3);
        
        System.out.println(c.generoMasInscriptos());
        System.out.println(c.toString());
    }
    
}
