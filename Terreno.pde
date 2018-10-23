public class Terreno {
  private String cor;
  private Mafia dono;
  private float valor;
  private int casas;
  private int capangas;
  private float x, y, larg, alt;

  public Terreno(String cor, float valor) {
    this.cor = cor;
    this.valor = valor;
  }

  public Terreno(float x, float y, float larg, float alt) {
    this.x = x;
    this.y = y;
    this.larg = larg;
    this.alt = alt;
  }

  public void setCapangas(int c) {
    this.capangas += c;
  }

  public int getCapangas() {
    return this.capangas;
  }

  public void setCasas(int c) {
    this.casas += c;
  }

  public int getCasas() {
    return this.casas;
  }

  private void setValor(float valor) {
    this.valor += valor;
  }

  public float getValor() {
    return this.valor;
  }

  public void setDono(Mafia dono) {
    this.dono = dono;
  }

  public Mafia getDono() {
    return this.dono;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public float getLarg() {
    return this.larg;
  }

  public float getAlt() {
    return this.alt;
  }
}
