library app.models;

import 'dart:mirrors';

void main() {
  var item = new Item('Car');
  print('Model: ${item.model}, NumEngines: ${item.numEngines}, Arg1: ${item.arg1Name}, Arg2: ${item.arg2Name}');
}

class Item {
  factory Item(String type) {
    MirrorSystem libs = currentMirrorSystem();
    LibraryMirror lib = libs.findLibrary(new Symbol('app.models'));
    Map<Symbol, Mirror> classes = lib.declarations;
    // To do: handle exception if class not found
    ClassMirror cls = classes[new Symbol(type)];
    // TODO:
    //  verify each subclass has no-arg ctor
    //  determ how to pass args to ctor.
    InstanceMirror inst = cls.newInstance(new Symbol(''), ['a', 1],
        namedArguments: {#arg1Name: 'arg1Value', #arg2Name: 'arg2Value'});
    return inst.reflectee;
	}

  Item._internal();
}

class Car extends Item {
	final String model;
  final int numEngines;
  final String arg1Name;
  final String arg2Name;

  Car(this.model, this.numEngines, {this.arg1Name, this.arg2Name}) : super._internal();

}
