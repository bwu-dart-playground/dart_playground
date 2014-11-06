import "dart:mirrors";

class meta {
    final String data;

    const meta(this.data);
}


@meta("Tag")
doSomething() => print("You have to do something");

void main() {
    doSomething();

  var decls = currentMirrorSystem().libraries; //.rootLibrary.declarations;
  print(decls.keys.where((k) => decls[k] is MethodMirror &&
      decls[k].metadata.where((k) => k.reflectee is meta).isNotEmpty));
}
