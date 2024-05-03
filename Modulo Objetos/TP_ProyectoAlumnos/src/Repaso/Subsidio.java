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
public class Subsidio {
    private Double monto;
    private String motivo;
    private boolean otorgado;

    public Subsidio(Double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.otorgado = false;
    }

    public Double getMonto() {
        return monto;
    }
    
    public void otorgarSubsidio(){
        this.otorgado = true;
    }

    public boolean isOtorgado() {
        return otorgado;
    }
    
    
}
