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
public class AlumnoGrado extends Alumno{
    private String carrera;

    public AlumnoGrado(String carrera, int dni, String nombre, int max) {
        super(dni, nombre, max);
        this.carrera = carrera;
    }

    @Override
    public String toString() {
        String aux = super.toString() + "\n" + this.carrera;
        return aux;
    }
    
    
    
    
}
