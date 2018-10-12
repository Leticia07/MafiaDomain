public class Peao {
  private String nome;
  private PImage icone;
  private PVector localizacao;
  private int terrenoAtual = 0;
  //private PVector velocidade;
  
  public Peao(String nome, float x, float y){
    this.nome = nome;
    this.localizacao = new PVector(x,y);
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
  
  public void setTerrenoAtual(int terrenoAtual){
    this.terrenoAtual = terrenoAtual;
  }
  
  public int getTerrenoAtual(){
    return this.terrenoAtual;
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
