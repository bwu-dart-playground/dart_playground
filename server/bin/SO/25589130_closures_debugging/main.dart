List<Shader> allShaders = [new Shader()];

void main() {
  var x;
  x = 10;

  Shader.loadAndCompileAll(
          () { print("Loaded shaders"); },
          () { print("Failed to load shaders"); }
  );
}

class Shader {
  static loadAndCompileAll(Function onLoad, Function onFail) {
    Function functionQueue = () {
      onLoad();
    };

    for (int i = 0; i < allShaders.length; ++i) {
      Shader s = allShaders[i];
      Function previous = functionQueue;
      functionQueue = () {
        s.loadAndCompile(() => previous(), onFail);
      };
    }

    functionQueue();
  }

  void loadAndCompile(Function f, Function onFail) {
    f();
    //onFail();
  }
}


