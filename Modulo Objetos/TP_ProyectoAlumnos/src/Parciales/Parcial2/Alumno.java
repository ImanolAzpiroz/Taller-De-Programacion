/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales.Parcial2;

/**
 *
 * @author Imanol
 */
public class Alumno {
    private String nombre;
    private int edad;
    private String instrumento;
    private int puntaje;

    public Alumno(String nombre, int edad, String instrumento) {
        this.nombre = nombre;
        this.edad = edad;
        this.instrumento = instrumento;
        this.puntaje = -1;
    }

    public String getNombre() {
        return nombre;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    @Override
    public String toString() {
        return "{" + "nombre=" + nombre + ", edad=" + edad + ", instrumento=" + instrumento + ", puntaje=" + puntaje + '}';
    }
    
    
    
}
