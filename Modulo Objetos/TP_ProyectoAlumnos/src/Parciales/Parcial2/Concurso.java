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
public class Concurso {
    
    private Alumno[][] matrizAlumno;
    private int[] vectorDim;
    private int N;

    
    public Concurso(int N) {
        this.N = N;
        this.matrizAlumno = new Alumno[5][N];
        this.vectorDim = new int[N];
        
        int i;
        for(i = 0; i < 5; i++){
            this.vectorDim[i]= 0;
        }
    }
    
    public void agregarAlumno(Alumno unAlumno,int nroGenero){
        if(this.vectorDim[nroGenero] < this.N){
            this.matrizAlumno[nroGenero][vectorDim[nroGenero]] = unAlumno;
            this.vectorDim[nroGenero]++;
        }
    }
    
    
    public void asignarPuntaje(String nombre, int puntaje){
        boolean esta = false;
        for( int i = 0; i < 5 && !esta; i++){
            for(int j = 0; j < this.vectorDim[i] && !esta; j++ ){
                if(this.matrizAlumno[i][j].getNombre().equals(nombre)){
                    esta = true;
                    this.matrizAlumno[i][j].setPuntaje(puntaje);
                }
            }
        }
    }
    
    public int generoMasInscriptos(){
        int max = -1;
        int generoMax = -1;
        for(int i = 0; i < 5; i++){
            if(this.vectorDim[i] > max){
                max = this.vectorDim[i];
                generoMax = i;
            }
        }
        return generoMax;
    }

    @Override
    public String toString() {
        String aux= "";
        
        for( int i = 0; i < 5; i++){
            for(int j = 0; j < this.vectorDim[i]; j++ ){
                aux +=  " Genero:" +  i + this.matrizAlumno[i][j].toString();
            }
            aux+= "\n";
        }
        return aux;
    }
    
    
}
