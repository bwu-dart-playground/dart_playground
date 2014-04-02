library x;

class Person {
   String name;
   String age;

   Person({this.name : "defaultName", this.age : "defaultAge"});
}

void main(List<String> args) {
  var personAlpha = new Person(name: "Jordan");
  print(personAlpha.age);
}