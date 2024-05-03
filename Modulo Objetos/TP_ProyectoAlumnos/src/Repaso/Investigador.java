/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Imanol
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] vectorSubsidio;
    
    private int dimL;
    private int dimF;
    
    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.vectorSubsidio = new Subsidio[5];
        this.dimL = 0;
        this.dimF = 5;
    }

    @Override
    public String toString() {
        String aux = "Investigador{" + "nombre=" + nombre + ", categoria=" + categoria + ", especialidad=" + especialidad + ", Total dinero= " + this.montoSubsidios() + '}';
        
        return aux;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if(dimL < dimF){
            this.vectorSubsidio[dimL] = unSubsidio;
            dimL++;
        }
    }
    
    public double montoSubsidios(){
        double aux = 0.0;
        for(int i = 0; i < dimL; i++){
            if(this.vectorSubsidio[i].isOtorgado()){
                aux += this.vectorSubsidio[i].getMonto();
            }
            
        }
        return aux;
    }
    
    public void otorgarTodos(){
        for( int i = 0; i < dimL; i++){
            this.vectorSubsidio[i].otorgarSubsidio();
        }
        
    }

    public String getNombre() {
        return nombre;
    }
    
    
}
