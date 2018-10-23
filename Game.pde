//<>// //<>// //<>//
Tabuleiro tabuleiro;
int state = 1, dado, cont = 0, jogador =  1, terrenoFinal;
float x0 = 0, xF = 0, y0=0, yF=0, mIrla = 0;
boolean clicked = false, finished = true, moving = false, movedOne = false, resto = true, girarDado = false, show =  true, mudou = true;
Peao peao;
PImage img, iconeIrlanda, iconeItalia, iconeRussia, iconeChina;
int largura, altura, esp = 7, casas = 0, capangas=0;
float restox, restoy;

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
  //this.tabuleiro.getImg().resize(width,height);
  img = loadImage("Imagem de fundo.png");
  iconeChina = loadImage("Ficha_MafiaChinesa.png");
  iconeIrlanda = loadImage("Ficha_MafiaIrlandesa.png");
  iconeItalia = loadImage("Ficha_MafiaItaliana.png");
  iconeRussia = loadImage("Ficha_MafiaRussa.png");
}

void draw() {
  switch(state) {
  case 0:
    backGround();
    this.tabuleiro.updatePeao();
    fill(100, alpha(color(0, 126, 255, 200)));
    noStroke();
    rect(width/2-200, height/2-200, 400, 400);
    fill(255);
    dados();
    //rect(width/2+170, height/2-200,30,30);
    //image(loadImage("Botao_Fechar.png"),width/2+170, height/2-200,30,30);
    //if((mouseX > width/2+170 && mouseX < width/2+170+30) && (mouseY > height/2-200 && mouseY < height/2-200 + 30)){
    //    image(loadImage("Botao_FecharPressionado.png"),width/2+170, height/2-200,30,30);
    //}
    if (mousePressed) {
      if (mouseButton == LEFT && (mouseX > (width/2-200) + 200 - height*0.06 && mouseX < (width/2-200) + 200 - height*0.06+height*0.06) && (mouseY > (height/2-200)+200 && mouseY < (height/2-200)+200 + height * 0.06)) {
        state = 1;
        dado = 2;//round(random(1, 6)) + round(random(1, 6));
        clicked = true;
        girarDado = true;
      }
    }
    break;
  case 1:
    backGround();
    this.tabuleiro.updatePeao();
    //posição inicial do peão
    if (girarDado) {
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
        x0 = peao.getLocalizacao().x;      
        y0 = peao.getLocalizacao().y;
        terrenoFinal = peao.getTerrenoAtual()+dado; 
        if (terrenoFinal > 31) {
          terrenoFinal -= 32;
        }
        clicked = false;
        finished = false;
      }

      //movimentação
      if (peao.getTerrenoAtual() != terrenoFinal) {
        int i = peao.getTerrenoAtual();
        float x = 0, y = 0;
        if (i >= 0 && i < 8 && !moving) {
          x = -((tabuleiro.getTerrenos().get(i).getLarg() + tabuleiro.getTerrenos().get(i+1).getLarg())/2.0);      
          moving = true;
          largura = -int(x);
          esp = -abs(esp);
        } else if (i >= 8 && i < 16 && !moving) {
          y = -((tabuleiro.getTerrenos().get(i).getAlt() + tabuleiro.getTerrenos().get(i+1).getAlt())/2.0);
          moving = true;
          altura = -int(y);
          esp = -abs(esp);
        } else if ((i >= 16 && i < 24 ) && !moving) {
          x = (tabuleiro.getTerrenos().get(i).getLarg() + tabuleiro.getTerrenos().get(i+1).getLarg())/2.0;
          moving = true;
          largura = int(x);
          esp = abs(esp);
        } else if (i >= 24 && i < 32 && !moving) {
          if (i+1 == 32) {
            y = tabuleiro.getTerrenos().get(0).getAlt();
          } else {
            y = tabuleiro.getTerrenos().get(i).getAlt();
          }
          moving = true;
          altura = int(y);
          esp = abs(esp);
        }

        if (resto) {
          restox = abs(x) - largura;
          restoy = abs(y) - altura;
          resto = false;
        }

        while (!(largura % abs(esp) == 0) || !(altura % abs(esp) == 0)) {
          if (!(largura % abs(esp) == 0)) {
            largura--;
            if (x < 0) {
              restox = -abs(restox);
              restox--;
            } else {
              restox++;
            }
          }       
          if (!(altura % abs(esp) == 0)) {
            altura--;
            if (y < 0) {
              restoy = -abs(restoy);
              restoy--;
            } else {
              restoy++;
            }
          }
        }


        if (moving) {
          if (largura != 0) {
            largura -= abs(esp);
            this.tabuleiro.updateLocalizacao(peao, esp, 0);
          } else if (altura != 0) {
            altura -= abs(esp);
            this.tabuleiro.updateLocalizacao(peao, 0, esp);
          } else {
            this.tabuleiro.updateLocalizacao(peao, restox, restoy);
            moving = false; 
            movedOne = true;
            resto = true;
          }
        }

        if (movedOne) {
          if (i + 1 > 31) {
            i = 0;
          } else {
            i = i +1;
          }
          peao.setTerrenoAtual(i);
          movedOne = false;
        }
      } else {
        state = 2;
        //clicked = false;
        //finished = true;
        //resto = true;
        //girarDado = false;
        if (jogador+1 > 4) {
          jogador = 1;
          println("Jogador "+jogador);
        } else {
          jogador++;
          println("Jogador "+jogador);
        }
      }
    }
    if (mousePressed) {
      if (mouseButton == LEFT && ((mouseX > width*0.85 && mouseX < width*0.85 + 100 && mouseY > height*0.7 && mouseY < height*0.7 + 50)||
        (mouseX > width*0.1 && mouseX < width*0.1 + 100 && mouseY > height*0.7 && mouseY < height*0.7 + 50) || 
        (mouseX > width*0.1 && mouseX < width*0.1 + 100 && mouseY > height*0.2 && mouseY < height*0.2 + 50) ||
        (mouseX > width*0.85 && mouseX < width*0.85 + 100 && mouseY > height*0.2 && mouseY < height*0.2 + 50))) {
        state = 0;
      }
    }
    break;
  case 2:
    backGround();
    this.tabuleiro.updatePeao();

    //Mostrar o que tem em cada casa ("janela" do lado da casa)
    if (peao.getTerrenoAtual() >= 0 && peao.getTerrenoAtual() <= 8) {
      fill(200, alpha(color(0, 126, 255, 200)));
      if (tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getDono() != null) {
        rect(tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getX(), tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getY()+tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getAlt(), tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getLarg(), 50);
      }
    } else if (peao.getTerrenoAtual() > 8 && peao.getTerrenoAtual() <= 16) {
      fill(200, alpha(color(0, 126, 255, 200)));
      if (tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getDono() != null) {
        rect(tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getX()-50, tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getY(), 50, tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getAlt());
      }
    } else if (peao.getTerrenoAtual() > 16 && peao.getTerrenoAtual() <= 24) {
      fill(200, alpha(color(0, 126, 255, 200)));
      if (tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getDono() != null) {
        rect(tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getX(), tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getY()-50, tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getLarg(), 50);
      }
    } else if (peao.getTerrenoAtual() > 24 && peao.getTerrenoAtual() < 32) {
      fill(200, alpha(color(0, 126, 255, 200)));
      if (tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getDono() != null) {
        rect(tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getX()+tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getLarg(), tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getY(), 50, tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getAlt());
      }
    }

    //lógica de compra e venda de terrenos
    if (tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getDono() == null) {
      //Terreno sem dono
      if (show) {
        fill(100, alpha(color(0, 126, 255, 200)));
        noStroke();
        rect(width/2-150, height/2-100, 300, 200);
        fill(255);
        rect(width/2 - 50, height/2-65, 100, 50); // Comprar
        rect(width/2 - 50, height/2-5, 100, 50); // Não comprar
      }

      //Verificação se o jogador compra o terreno ou não
      if (mousePressed && show) {
        if (mouseButton == LEFT && (mouseX > width/2 - 50 && mouseX < width/2 - 50+100 && mouseY > height/2-65 && mouseY < height/2-65+50)) {
          //Comprou o terreno
          show = false;
          clicked = true;
        } else if (mouseButton == LEFT && (mouseX > width/2 - 50 && mouseX < width/2 - 50+100 && mouseY > height/2-5 && mouseY < height/2-5+50)) {
          //Não comprou o terreno
          clicked = false;
          finished = true;
          resto = true;
          girarDado = false;
          show = true;
          state = 1;
        }
      }

      //Finalização da compra
      if (state == 2 && !show) {
        finalizarCompra();
        if (mousePressed && mudou) {
          mudou = false;
          if (mouseButton == LEFT && (mouseX > width/2-100 && mouseX < width/2-100+25 && mouseY > height/2 && mouseY < height/2+25)) {
            if (casas > 0) {
              casas--;
            }
          } else if (mouseButton == LEFT && (mouseX > width/2-40 && mouseX < width/2-40+25 && mouseY > height/2 && mouseY < height/2+25)) {
            casas++;
          } else if (mouseButton == LEFT && (mouseX > width/2-100 && mouseX < width/2-100+25 && mouseY > height/2+30 && mouseY < height/2+30+25)) {
            if (capangas > 0) {
              capangas--;
            }
          } else if (mouseButton == LEFT && (mouseX > width/2-40 && mouseX < width/2-40+25 && mouseY > height/2+30 && mouseY < height/2+30+25)) {
            capangas++;
          } else if (mouseButton == LEFT && (mouseX > width/2+50 && mouseX < width/2+50+70 && mouseY > height/2 && mouseY < height/2+30)) {
            //OK
          } else if (mouseButton == LEFT && (mouseX > width/2+50 && mouseX < width/2+50+70 && mouseY > height/2+40 && mouseY < height/2+40+30)) {
            //Cancelar
            clicked = false;
            finished = true;
            resto = true;
            girarDado = false;
            show = true;
            state = 1;
            casas = 0;
            capangas = 0;
          }
        } else {
          mudou = true;
        }
      }
    } else if (tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getDono() != null && tabuleiro.getTerrenos().get(peao.getTerrenoAtual()).getDono() != peao.getMafia()) {
      //Terreno possui dono e não é o jogador da vez
    }

    break;
  }
}

private void finalizarCompra() {
  fill(100, alpha(color(0, 126, 255, 200)));
  noStroke();
  rect(width/2-150, height/2-100, 300, 200);
  fill(0);
  textSize(15);
  text("Valor do terreno", width/2-65, height/2-50);
  fill(255);
  //Casas
  rect(width/2-100, height/2, 25, 25); //diminuir casas
  //rect(width/2-70, height/2, 25, 25);
  fill(0);
  text(casas+"", width/2-62, height/2+15);
  fill(255);
  rect(width/2-40, height/2, 25, 25); //aumentar casas
  //Capangas
  rect(width/2-100, height/2+30, 25, 25); //diminuir capangas
  //rect(width/2-70, height/2+30, 25, 25);
  fill(0);
  text(capangas+"", width/2-62, height/2+45); 
  fill(255);
  rect(width/2-40, height/2+30, 25, 25); // aumentar capangas
  //Ok
  rect(width/2+50, height/2, 70, 30);
  //Cancelar
  rect(width/2+50, height/2+40, 70, 30);
}

private void backGround() {
  img.resize(width, height);
  image(img, 0, 0);
  image(tabuleiro.getImg(), (width/2 - height*0.8/2), height*0.1, height*0.8, height*0.8);
  iconeJogador();
  if (finished) {
    girarDado();
  }
}

private void girarDado() {
  if (jogador == 1) {
    rect(width*0.85, height*0.7, 100, 50);
  } else if (jogador == 2) {
    rect(width*0.1, height*0.7, 100, 50);
  } else if (jogador == 3) {
    rect(width*0.1, height*0.2, 100, 50);
  } else if (jogador == 4) {
    rect(width*0.85, height*0.2, 100, 50);
  }
}

private void dados() {
  rect((width/2-200) + 200 - height*0.06, (height/2-200)+200, height*0.06, height*0.06);
  rect((width/2-200) + 200 - height*0.06 + height*0.07, (height/2-200)+200, height*0.06, height*0.06);
}

private void iconeJogador() {

  fill(0);
  rect(0, 0, (height*0.8) *0.5, height*0.1);//Barra
  //fill(255);
  //rect(0, 0, (height*0.8) *0.5*0.25, height*0.1);//Icone
  image(iconeItalia, 0, 0, (height*0.8) *0.256, (height*0.8) *0.256);
  //fill(0); // South-West
  rect(0, height*0.9, (height*0.8) *0.5, height*0.1);//Barra
  //fill(255);
  //rect(0, height*0.9, (height*0.8) *0.5*0.25, height*0.1);//Icone
  image(iconeChina, 0, height*0.8, (height*0.8) *0.256, (height*0.8) *0.256);
  //fill(0); // North-East
  rect(width- (height*0.8) *0.5, 0, (height*0.8) *0.5, height*0.1);//Barra
  //fill(255);
  //rect(width - (height*0.8) *0.5*0.25, 0, (height*0.8) *0.5*0.25, height*0.1);//Icone
  image(iconeRussia, width - (height*0.8) *0.256, 0, (height*0.8) *0.256, (height*0.8) *0.256);
  //fill(0); // South-East
  rect(width- (height*0.8) *0.5, height*0.9, (height*0.8) *0.5, height*0.1);//Barra
  //fill(255);
  //rect(width- (height*0.8) *0.5*0.25, height*0.9, (height*0.8) *0.5*0.25, height*0.1);//Icone
  image(iconeIrlanda, width- (height*0.8) *0.256, height*0.8, (height*0.8) *0.256, (height*0.8) *0.256);
}
