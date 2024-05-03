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
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDir;
    private Investigador[] vectorInvestigador;
    
    private int dimL;
    private int dimF;
    public Proyecto(String nombre, int codigo, String nombreDir) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDir = nombreDir;
        this.vectorInvestigador = new Investigador[50];
        this.dimL = 0;
        this.dimF = 50;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if(dimL < dimF){
            this.vectorInvestigador[dimL] = unInvestigador;
            dimL++;
        }
    }

    public double montoTotal(){
        double aux = 0.0;
        for(int i = 0; i < dimL; i++){
            aux += this.vectorInvestigador[i].montoSubsidios();
        }
        
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = "Proyecto{" + "nombre=" + nombre + ", codigo=" + codigo + ", nombreDir=" + nombreDir + ", MontoTotal= "+ this.montoTotal() + ", Investigadores= ";
        for(int i = 0; i < dimL; i++){
            aux +=  "\n" + this.vectorInvestigador[i].toString() ;
        }
        
        
        return aux;   
    }
    
    public void otorgarTodos(String nombre){
        boolean esta = false;
        int i = 0;
        while ((i < dimL) && (!esta)){
            if(this.vectorInvestigador[i].getNombre().equals(nombre)){
                esta = true;
                this.vectorInvestigador[i].otorgarTodos();
            }
            i++;
        }
        
    }
    
}
