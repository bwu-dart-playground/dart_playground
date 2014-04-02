import "dart:typed_data";
import "dart:math";

void main() {
  int rs = 1 << 20;
  int iter = 50;
  Float64List rnd = new Float64List(rs);
  Random r = new Random(1);
  for (int i = 0; i < rs; i++) {
    rnd[i] = r.nextDouble() * PI;
  }

  Stopwatch sw = new Stopwatch();
  sw.start();
  double total = 0.0;
  for (int j = 0; j < iter; j++) {
    for (int i = 0; i < rs; i++) {
      //total += 0.1;
      total += rnd[i];
    }
  }
  sw.stop();
  var e = sw.elapsedMilliseconds;
  print("Time: $e");
}