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
public class AlumnoDoctorado extends Alumno {
    private String titulo; 
    private String universidad;

    public AlumnoDoctorado(String titulo, String universidad, int dni, String nombre, int max) {
        super(dni, nombre, max);
        this.titulo = titulo;
        this.universidad = universidad;
    }

    
    
    @Override
    public String toString() {
        String aux = super.toString() + "\n" + "Titulo=" + titulo + ", universidad=" + universidad + '}';;
        return aux;
    }

    
    
    
}
