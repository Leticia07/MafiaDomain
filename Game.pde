 //<>// //<>//
Tabuleiro tabuleiro;
int state = 1, dado, cont = 0, jogador =  0;
float x0 = 0, xF = 0, y0=0, yF=0, mIrla = 0;
boolean clicked = false,finished = true;
Peao peao;

//jogador 1 = mafia irlandesa 
//jogador 2 = mafia chinesa
//jogador 3 = mafia italiana
//jogador 4 = mafia russa

void setup() {
  fullScreen();
  //size(1000,768);
  surface.setLocation(0, 0);
  surface.setResizable(true);
  this.tabuleiro = new Tabuleiro();
  this.tabuleiro.inicializarTerrenos();
  this.tabuleiro.inicializarMafias();
  peao = this.tabuleiro.getMafiaChinesa().getPeao();
  //this.tabuleiro.getImg().resize(width,height);
}

void draw() {
  switch(state) {
  case 0:
    break;
  case 1:
    //Posição onde vai ficar a imagem dos jogadores
    backGround();
    this.tabuleiro.updatePeao();
    //movimentação
    if (mousePressed) {
      if (!clicked && finished && mouseButton == LEFT && ((mouseX > width-(height*0.8)*0.4 && mouseX < width-(height*0.8)*0.4 + height*0.06) && (mouseY > height*0.8 && mouseY < height*0.8 + height*0.06))){
        dado = round(random(1,12));
        clicked = true;
        println("Dado: "+dado);      
        if (jogador+1 > 4) {
          jogador = 1;
          println("Jogador "+jogador);
        } else {
          jogador++;
          println("Jogador "+jogador);
        }
      }
      
      //posição inicial do peão
      if (clicked) {
          if (jogador == 1) {
            peao = this.tabuleiro.getMafiaIrlandesa().getPeao();
          } else if (jogador == 2) {
            peao = this.tabuleiro.getMafiaChinesa().getPeao();
          } else if (jogador == 3) {
            peao = this.tabuleiro.getMafiaItaliana().getPeao();
          } else if (jogador == 4) {
            peao = this.tabuleiro.getMafiaRussa().getPeao();
          }
          if (clicked) {
            //println("Entrou no XX");
            //x0 = peao.getLocalizacao().x;
            //xF = (x0 - this.tabuleiro.getTerrenos().get(dado).getLarg() * dado);
            //yF = peao.getLocalizacao().y;
            //clicked = false;
            //finished = false;
          //} else {
            //println("Entrou no YY");
            x0 = peao.getLocalizacao().x;
            xF = this.tabuleiro.getTerrenos().get(dado).getX();
            y0 = peao.getLocalizacao().y;
            yF = this.tabuleiro.getTerrenos().get(dado).getY();
            clicked = false;
            finished = false;
          }
      }
    
    }
      if (peao.getLocalizacao().x > xF && (xF > this.tabuleiro.getTerrenos().get(8).getX() || xF < this.tabuleiro.getTerrenos().get(31).getX())) {
        this.tabuleiro.updateLocalizacao(peao, (xF - x0)*0.02, 0);
        backGround();
        this.tabuleiro.updatePeao();
      } else if (peao.getLocalizacao().y > yF && (peao.getLocalizacao().y > this.tabuleiro.getTerrenos().get(0).getY() || peao.getLocalizacao().y < this.tabuleiro.getTerrenos().get(16).getY())) {
        //println("Altera o Y");
        this.tabuleiro.updateLocalizacao(peao, 0, (yF - y0)*0.02);
        backGround();
        this.tabuleiro.updatePeao();
      } else { // if (peao.getLocalizacao().x < xF && peao.getLocalizacao().y < yF) {
        //println("Entrou aqui");
        x0 = peao.getLocalizacao().x;
        y0 = peao.getLocalizacao().y;
        clicked = false;
        finished = true;
      }
    break;
  case 2:

    break;
  }
}

private void backGround() {
  background(100);
  imageMode(CENTER);
  image(tabuleiro.getImg(), width/2, height/2, height*0.8, height*0.8);  
  iconeJogador();
  dados();
}

private void dados() {
  //dados canto inferior esquerdo
  rect(width-(height*0.8)*2, height*0.8, height*0.06, height*0.06); 
  rect(width-(height*0.8)*2+height*0.07, height*0.8, height*0.06, height*0.06); 
  //dados canto inferior direito
  rect(width-(height*0.8)*0.4, height*0.8, height*0.06, height*0.06); 
  rect(width-(height*0.8)*0.4+height*0.07, height*0.8, height*0.06, height*0.06);
  //dados canto superior esquerdo
  rect(width-(height*0.8)*2, height*0.13, height*0.06, height*0.06); 
  rect(width-(height*0.8)*2+height*0.07, height*0.13, height*0.06, height*0.06);
  //dados canto superior direito
  rect(width-(height*0.8)*0.4, height*0.13, height*0.06, height*0.06); 
  rect(width-(height*0.8)*0.4+height*0.07, height*0.13, height*0.06, height*0.06);
}

private void iconeJogador() {

  fill(0);
  rect(0, 0, (height*0.8) *0.5, height*0.1);//Barra
  fill(255);
  rect(0, 0, (height*0.8) *0.5*0.25, height*0.1);//Icone
  fill(0); // South-West
  rect(0, height*0.9, (height*0.8) *0.5, height*0.1);//Barra
  fill(255);
  rect(0, height*0.9, (height*0.8) *0.5*0.25, height*0.1);//Icone
  fill(0); // North-East
  rect(width- (height*0.8) *0.5, 0, (height*0.8) *0.5, height*0.1);//Barra
  fill(255);
  rect(width - (height*0.8) *0.5*0.25, 0, (height*0.8) *0.5*0.25, height*0.1);//Icone
  fill(0); // South-East
  rect(width- (height*0.8) *0.5, height*0.9, (height*0.8) *0.5, height*0.1);//Barra
  fill(255);
  rect(width- (height*0.8) *0.5*0.25, height*0.9, (height*0.8) *0.5*0.25, height*0.1);//Icone
}
