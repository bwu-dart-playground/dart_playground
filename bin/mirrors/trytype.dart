library x;

void main(List<String> args) {
  Type myType = String;
  String myExample = "Example";
  
  if(myExample.runtimeType == myType) {
    print('is');
  } else {
    print('is not');
  }
}