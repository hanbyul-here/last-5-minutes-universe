
class Scroller {

  float acc = 2;
  float damp = .9;

  float h_vector = 0;
  float v_vector = 0;
  float z_vector = 0;
  float d_vector = 0;

  float rh_vector = 0;
  float rv_vector = 0;

  float z = 0;
  float x = 0;
  float y = 0;

  float d = 200;

  float rx = 0;
  float ry = 0;

  Scroller() {

    mouseX = width/2;
    mouseY = height/2;
  }

  Scroller(float acc, float damp) {

    this.acc = acc;
    this.damp = damp;

    mouseX = width/2;
    mouseY = height/2;
  }

  Scroller(float x, float y, float z, float depth) {

    this.x = x;
    this.y = y;
    this.z = z;

    this.d = depth;

    mouseX = width/2;
    mouseY = height/2;
  }

  Scroller(float x, float y, float z, float acc, float damp) {

    this.acc = acc;
    this.damp = damp;

    this.x = x;
    this.y = y;
    this.z = z;

    mouseX = width/2;
    mouseY = height/2;
  }

  void update() {
//

    x += h_vector;
    y += v_vector;
    z += z_vector;
    d += d_vector;

    rx += rh_vector;
    ry += rv_vector;
  }
}

