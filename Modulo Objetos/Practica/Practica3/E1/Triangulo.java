
public class Triangulo {
    
    private Double lado1;
    private Double lado2;
    private Double lado3;
    private String colorRelleno;
    private String colorLinea;

    
    public Triangulo(Double lado1, Double lado2, Double lado3, String colorRelleno, String colorLinea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    public Double getLado1() {
        return lado1;
    }

    public Double getLado2() {
        return lado2;
    }

    public Double getLado3() {
        return lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setLado1(Double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(Double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(Double lado3) {
        this.lado3 = lado3;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    
    @Override
    public String toString() {
        return "Triangulo{" + "lado1= " + lado1 + ", lado2= " + lado2 + ", lado3= " + lado3 + ", colorRelleno= " + colorRelleno + ", colorLinea= " + colorLinea + '}';
    }
    
    public Double calcularPerimetro(){
        return (lado1 + lado2 + lado3);
    }

    public double calcularArea(){
        double s = (lado1+ lado2 + lado3) / 2;
        double aux = Math.sqrt(s*(s - lado1)*(s - lado2)*(s - lado3));
        return aux;
        
    }
    
}
