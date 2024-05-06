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
public abstract class Alumno{
    private int dni;
    private String nombre;
    private Materia[] vectorMaterias;
    private int cantAprob;
    private int max;

    public Alumno(int dni, String nombre, int max) {
        this.dni = dni;
        this.nombre = nombre;
        this.vectorMaterias = new Materia[max];
        this.max = max;
        this.cantAprob = 0;
    }
    
    public void agregarMateria(Materia materia){
        if(cantAprob < max){
            this.vectorMaterias[cantAprob] = materia;
            cantAprob++;
        }
    }

    
    public boolean estaGraduado(){
        boolean esta = false;
        int i = 0;
        if(cantAprob == max){
            while(i < max && !esta){
                if(this.vectorMaterias[i].getNombre().equals("Tesis")){
                    esta = true;
                }
                i++;
            }   
        }
        return esta;
    }
    
    
    
    
    
    @Override
    public String toString() {
        String aux = "Alumno{" + "dni=" + dni + ", nombre=" + nombre + '}';
        for (int i = 0; i < cantAprob; i++){
            aux += "\n" + this.vectorMaterias[i].toString();
        }
        if(this.estaGraduado()){
            aux += "\n" + "Está graduado";
        }
        else
            aux += "\n" + "No está graduado";
        return aux;
    }
    
    
}
