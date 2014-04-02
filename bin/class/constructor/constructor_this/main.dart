library x;

abstract class Parent {
  String parentField;
}

class Child extends Parent {
  final String childField;

  Child(parentField, childField){
    this.parentField = parentField;
    this.childField = childField;
  }
}

void main(List<String> args) {

}