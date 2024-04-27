

public class P3E1 {
    public static void main(String[] args){
        
        Triangulo t = new Triangulo(2.0, 4.0, 2.5, "Rojo", "Negro");
       
        System.out.println(t.toString());
        System.out.println("El perimetro es: " + t.calcularPerimetro());
        System.out.println("El area es: " + t.calcularArea());
    }
}