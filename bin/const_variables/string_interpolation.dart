//class Test {
//    final Function xxx;
//
//    const Test(this.xxx);
//
//    String getString(context) => xxx(context);
//}
//
//String someString(String xx) => 'aaaaa${xx}bbbbb';
//
//void main() {
//    //var xx = 'yy';
//    var x = const Test(someString);
//    print(x.getString('rrr'));
//}


import 'dart:mirrors';

class Context {
  String name = "some name";
  String color = "some color";
  int age = 15;
}

void main() {
  var c = new Chicken('aaaa','blue',99);
  var templateValue = (reflectClass(Chicken).metadata.where((a)=>a.reflectee.runtimeType == Template).first.reflectee as Template).value(c);
  print(templateValue);
}

class Template{
  final Function value;
  const Template(this.value);
  String getValue(context) => value(context);
}

String templateStr(context) => '<div>name:${context.name} color:${context.color} age:${context.age}</div>';

@Template(templateStr)
class Chicken{
  String name;
  String color;
  int age;
  Chicken(this.name,this.color,this.age);
}

//    class interpolater{
//      static String interpolate(Object context,String s){
//        s = s.replaceAll('\\\$', '\$');
//        return s;
//      }
//    }