/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales.Parcial1;

/**
 *
 * @author Imanol
 */
public class Materia {
    private String nombre;
    private int nota;
    private int fecha;

    public Materia(String nombre, int nota, int fecha) {
        this.nombre = nombre;
        this.nota = nota;
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Materia{" + "nombre=" + nombre + ", nota=" + nota + ", fecha=" + fecha + '}';
    }

    public String getNombre() {
        return nombre;
    }
    
    
    
}
