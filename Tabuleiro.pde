
import java.util.ArrayList;

public class Tabuleiro {
  private PImage img;
  private ArrayList<Terreno> terrenos;
  private Jogador[] jogadores;
  private Mafia mafiaIrlandesa, mafiaChinesa, mafiaItaliana, mafiaRussa;

  public Tabuleiro() {
    this.img = loadImage("Tabuleiro.png");
    this.terrenos = new ArrayList<Terreno>();
    this.jogadores = new Jogador[4];
  }

  public void adicionarJogadores(Jogador jogador) {
    for (int i=0; i<4; i++) {
      if (this.jogadores[i] == null) {
        this.jogadores[i] = jogador;
        break;
      }
    }
    jogador.getMafia().setJogador(jogador);
  }

  public PImage getImg() {
    return this.img;
  }

  public void inicializarMafias() {
    mafiaIrlandesa = new Mafia("Irlandesa", ((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 250*(height*0.8/2500)), height*0.9 - 27*(height*0.8/2500) - 300*(height*0.8/2500));
    mafiaChinesa = new Mafia("Chinesa", ((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 150*(height*0.8/2500)), height*0.9 - 27*(height*0.8/2500) - 300*(height*0.8/2500));
    mafiaItaliana = new Mafia("Italiana", ((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 250*(height*0.8/2500)), height*0.9 - 27*(height*0.8/2500) - 200*(height*0.8/2500));
    mafiaRussa = new Mafia("Russa", ((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 150*(height*0.8/2500)), height*0.9 - 27*(height*0.8/2500) - 200*(height*0.8/2500));
  }

  public void updatePeao() {
    image(mafiaIrlandesa.getPeao().getImagem(), mafiaIrlandesa.getPeao().getLocalizacao().x, mafiaIrlandesa.getPeao().getLocalizacao().y, 316*(height*0.8/2500)*0.25, 316*(height*0.8/2500)*0.4);
    image(mafiaChinesa.getPeao().getImagem(), mafiaChinesa.getPeao().getLocalizacao().x, mafiaChinesa.getPeao().getLocalizacao().y, 316*(height*0.8/2500)*0.25, 316*(height*0.8/2500)*0.4);  
    image(mafiaItaliana.getPeao().getImagem(), mafiaItaliana.getPeao().getLocalizacao().x, mafiaItaliana.getPeao().getLocalizacao().y, 316*(height*0.8/2500)*0.25, 316*(height*0.8/2500)*0.4);  
    image(mafiaRussa.getPeao().getImagem(), mafiaRussa.getPeao().getLocalizacao().x, mafiaRussa.getPeao().getLocalizacao().y, 316*(height*0.8/2500)*0.25, 316*(height*0.8/2500)*0.4);
  }

  public void updateLocalizacao(Peao peao, float x, float y) {  
    peao.getLocalizacao().x += x;
    peao.getLocalizacao().y += y;
  }

  public Mafia getMafiaIrlandesa() {
    return mafiaIrlandesa;
  }

  public Mafia getMafiaChinesa() {
    return mafiaChinesa;
  }

  public Mafia getMafiaItaliana() {
    return mafiaItaliana;
  }

  public Mafia getMafiaRussa() {
    return mafiaRussa;
  }

  public void inicializarTerrenos() {

    //East

    Terreno jatinho = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500), 316*(height*0.8/2500), 316*(height*0.8/2500), 100000);
    Terreno t25 = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500), 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t26 = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*1, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t27 = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*2, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t28 = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*3, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t29 = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*4, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t30 = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*5, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t31 = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*6, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);

    //North

    Terreno t18 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500), height*0.1+(27*height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num2
    Terreno t19 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*1, height*0.1+(27*height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num3
    Terreno t20 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*2, height*0.1+(27*height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num4
    Terreno t21 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*3, height*0.1+(27*height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num5
    Terreno t22 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*4, height*0.1+(27*height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num6
    Terreno t23 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*5, height*0.1+(27*height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num7
    Terreno t24 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*6, height*0.1+(27*height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num8

    //West

    Terreno casino = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500), 316*(height*0.8/2500), 316*(height*0.8/2500), 100000);
    Terreno t16 = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500), 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t15 = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*1, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t14 = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*2, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t13 = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*3, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t12 = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*4, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t11 = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*5, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);
    Terreno t10 = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.1 + 27*(height*0.8/2500) + 316*(height*0.8/2500) + (259*(height*0.8/2500))*6, 316*(height*0.8/2500), 259*(height*0.8/2500), 100000);

    //Sul
    Terreno prisao = new Terreno((width/2.0)-((height*0.8)/2.0) + 27*(height*0.8/2500), height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 316*(height*0.8/2500), 316*(height*0.8/2500), 100000);///////////////////////////////////////////////////////////////////////////////////////////////
    Terreno t8 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500), height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num2
    Terreno t7 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*1, height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num3
    Terreno t6 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*2, height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num4
    Terreno t5 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*3, height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num5
    Terreno t4 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*4, height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num6
    Terreno t3 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*5, height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num7
    Terreno t2 = new Terreno((width/2.0+(27*width*0.8/2500))-((height*0.8)/2.0+(27*height*0.8/2500))+316*(height*0.8/2500)+259*(height*0.8/2500)*6, height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 259*(height*0.8/2500), 316*(height*0.8/2500), 100000); // num8
    Terreno go = new Terreno((width/2.0)+((height*0.8)/2.0) - 27*(height*0.8/2500) - 316*(height*0.8/2500), height*0.9 - 27*(height*0.8/2500) - 316*(height*0.8/2500), 316*(height*0.8/2500), 316*(height*0.8/2500), 100000);

    terrenos.add(go);
    terrenos.add(t2);
    terrenos.add(t3);
    terrenos.add(t4);
    terrenos.add(t5);
    terrenos.add(t6);
    terrenos.add(t7);
    terrenos.add(t8);
    terrenos.add(prisao);
    terrenos.add(t10);
    terrenos.add(t11);
    terrenos.add(t12);
    terrenos.add(t13);
    terrenos.add(t14);
    terrenos.add(t15);
    terrenos.add(t16);
    terrenos.add(casino);
    terrenos.add(t18);
    terrenos.add(t19);
    terrenos.add(t20);
    terrenos.add(t21);
    terrenos.add(t22);
    terrenos.add(t23);
    terrenos.add(t24);
    terrenos.add(jatinho);
    terrenos.add(t25);
    terrenos.add(t26);
    terrenos.add(t27);
    terrenos.add(t28);
    terrenos.add(t29);
    terrenos.add(t30);
    terrenos.add(t31);
  }

  public int getPosicaoTerreno(Terreno terreno) {
    for (int i=0; i<this.terrenos.size(); i++) {
      if (this.terrenos.get(i).equals(terreno)) {
        return i;
      }
    }
    return -1;
  }

  public ArrayList<Terreno> getTerrenos() {
    return this.terrenos;
  }
}
