
public class Mafia {
  private String nome;
  private Peao peao;
  //private Peao[] peoes = new Peao[4];

  public Mafia(String nome, float x, float y) {
    this.nome = nome;
    this.peao = new Peao(nome, x, y, this);
    //adicionarNoVetor(this.getPeao());
  }

  public String getNome() {
    return this.nome;
  }

  public Peao getPeao() {
    return this.peao;
  }

  //private void adicionarNoVetor(Peao peao){
  //  for(int i=0;i<peoes.length;i++){
  //    if(peoes[i] == null){
  //      peoes[i] = null;
  //      break;
  //    }
  //  }
  //}
}
