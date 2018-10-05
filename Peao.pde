public class Peao {
  private String nome;
  private PImage icone;
  private PVector localizacao;
  private Terreno terreno;
  //private PVector velocidade;
  
  public Peao(String nome, float x, float y){
    this.nome = nome;
    this.localizacao = new PVector(x,y);
    this.terreno = null;
    //this.velocidade = new PVector();
    this.setImagem();
  }
  
  public PVector getLocalizacao(){
    return this.localizacao;
  }
  
 // public PVector getVelocidade(){
   // return this.velocidade;
  //}
  
  //public void setVelocidade(float x, float y){
    //this.velocidade.x = x;
    //this.velocidade.y = y;
  //}
  
  public void setTerreno(Terreno terreno){
    this.terreno = terreno;
  }
  
  public Terreno getTerreno(){
    return this.terreno;
  }
  
  public String getNome(){
    return this.nome;
  }
  
  public PImage getImagem(){
    return this.icone; 
  }
  
  private void setImagem(){
     if(this.getNome().equals("Irlandesa")){
       icone = loadImage("Peao_MafiaIrlandesa.png"); 
     }else if(this.getNome().equals("Chinesa")){
       icone = loadImage("Peao_MafiaChinesa.png"); 
     }else if(this.getNome().equals("Russa")){
       icone = loadImage("Peao_MafiaRussa.png"); 
     }else if(this.getNome().equals("Italiana")){
       icone = loadImage("Peao_MafiaItaliana.png"); 
     }
  }
}
