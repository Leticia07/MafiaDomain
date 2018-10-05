public class Terreno{
    private String tipo;
    private String cor;
    private Mafia dono;
    private float valor;
    private float x,y,larg,alt;
    
    public Terreno(String tipo,String cor,float valor){
       this.tipo = tipo;
       this.cor = cor;
       this.valor = valor;
    }
    
    public Terreno(float x, float y, float larg, float alt){
      this.x = x;
      this.y = y;
      this.larg = larg;
      this.alt = alt;
    }
    
    public float getX(){
      return this.x; 
    }

    public float getY(){
      return this.y; 
    }
    
    public float getLarg(){
      return this.larg;
    }
    
    public float getAlt(){
       return this.alt; 
    }
}
