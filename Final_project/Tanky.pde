class Tanky extends Monster {
  Tanky(int hp, int level, int xp, int power, int size, float xcor, float ycor, float xinc, float yinc, PImage img) {
    super(hp, level, xp, power, size, xcor, ycor, xinc, yinc, img);
  }
  void display() {
    image(img, xcor, ycor, size, size);
  }
  float distanceTo(Collider c) {
    return distance(c.xcor, this.xcor + this.size/2, c.ycor, this.ycor + this.size/2) - (c.size/2) - (this.size/2);
  }
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b, ArrayList<Itemdrop> i) {
    if (super.move(k, c, m, b, i)) {
      m.remove(this);
      return true;
    }
    return false;
  }
  void shoot(ArrayList<Bullet> b) {
    if (g.tankyCounter % 80 == 0) {
      b.add(new Bullet(power, 1,255, 124, 43, 10, xcor, ycor+size/2, -3*xinc, yinc));
    }
  }
  void formation(ArrayList<Monster> mon) {
    mon.add(this);
    for (int i = 1; i < 5; i++) {
      Tanky t;
      float chooseYcor;
      if (i % 2 == 1) {
        chooseYcor = height - ycor + size * i;
      } else {
        chooseYcor = ycor + size * i;
      }
      if (chooseYcor < 0) {
        chooseYcor += height;
      } else if (chooseYcor > height - size) {
        chooseYcor -= height - size;
      }
      t = new Tanky(hp, level, xp, power, size, xcor + 2 * size*i, chooseYcor, xinc, yinc, img);
      mon.add(t);
    }
  }
}
