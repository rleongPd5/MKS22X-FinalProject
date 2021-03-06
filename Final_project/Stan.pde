class Stan extends Monster {
  String type = "monster";
  Stan(int hp, int level, int xp, int power, int size, float x, float y, float xinc, float yinc, PImage img, int scoring) {
    super(hp, level, xp, power, size, x, y, xinc, yinc, img, scoring);
  }
  //float distanceTo(Collider c) {
  //  return distance(c.xcor, this.xcor + this.size/2, c.ycor, this.ycor + this.size/2) - (c.size/2) - (this.size/2);
  //}
  boolean move(ArrayList<Killable> k, ArrayList<Collider> c, ArrayList<Monster> m, ArrayList<Bullet> b, ArrayList<Itemdrop> i) {
    if (super.move(k, c, m, b, i)) {
      m.remove(this);
      dropItem(g.itemdropList);
      return true;
    }
    return false;
  }
  void shoot(ArrayList<Bullet> b, ArrayList<Collider> c) {
    if (g.stanCounter % 60 == 0) {
      Bullet bul = new Bullet(power, 1, 255, 124, 43, 10, xcor, ycor, -3*xinc, yinc, "monster");
      b.add(bul);
      c.add(bul);
    }
  }
  void display() {
    image(img, xcor, ycor, size, size);
  }
  void formation(ArrayList<Monster> mon, ArrayList<Collider> c) {
    mon.add(this);
    c.add(this);
    for (int i = 1; i < 3; i++) { 
      Stan temp1 = new Stan(hp, level, xp, power, size, xcor+size*i, ycor+size*i, xinc, yinc, img, scoring);
      Stan temp2 = new Stan(hp, level, xp, power, size, xcor+size*i, ycor-size*i, xinc, yinc, img, scoring);
      mon.add(temp1);
      mon.add(temp2);
      c.add(temp1);
      c.add(temp2);
    }
  }
}
