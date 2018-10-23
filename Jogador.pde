public class Jogador {
  private Mafia mafia;
  private float dinheiro;
  private int capangas;

  public Jogador() {
    this.dinheiro = 1000000;
  }

  public void setCapangas(int capangas) {
    this.capangas += capangas;
  }

  public int getCapangas() {
    return this.capangas;
  }

  public void setMafia(Mafia mafia) {
    this.mafia = mafia;
  }

  public Mafia getMafia() {
    return this.mafia;
  }

  public void setDinheiro(float dinheiro) {
    this.dinheiro += dinheiro;
  }

  public float getDinheiro() {
    return this.dinheiro;
  }
}
