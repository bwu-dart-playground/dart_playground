lazyTest(msg) => print(msg);

class Printer{
  Printer(msg){
    print(msg);
  }
  static final finalClassVariable = lazyTest("final class variable");
}

var globalsAreLazy = lazyTest("top-level");
var lazyInitialized = lazyTest("lazy initialized");

void main() {

   final localFinal = new Printer("local final");
   var initialize = lazyInitialized;
}