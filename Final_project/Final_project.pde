import java.util.*;
class Game {
  //create method called endScreen
  Player p;

  ArrayList<Monster> m;
  ArrayList<Bullet> b;
  ArrayList<Killable> k;

  Game() {
    m = new ArrayList<Monster>();
    b = new ArrayList<Bullet>();
    k = new ArrayList<Killable>();
    p = new Player(1, "Sadboi", width/2, height/2, 20);
  }

  void display() {
  }

  void update() {
  }
}
void setup() {
  size(500, 500);
  Game g = new Game();
  g.b.add(new Bullet(2, 25, 10, 89, 5, 10, 10));
}
void draw() {
  //setup();
  Game g = new Game();
  g.b.add(new Bullet(2, 25, 10, 89, 20, 100, 100));
  for (Bullet bul : g.b) {
    bul.display();
  }
  g.p.display();
  g.p.keyPressed(g.b);
}

void endScreen() {
  textSize(100);
  fill(255, 0, 0);
  text("YOU DIED.", height/2, width/2);
}
