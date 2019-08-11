import 'dart:math';

class RandromGenerator{
 static Generate(){
    var rng = new Random();
    int next(int min, int max) => min + rng.nextInt(max - min);
    return next(11111, 99999);
  }
}