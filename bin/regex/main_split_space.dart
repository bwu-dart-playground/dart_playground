var str = '''location place starta stopb bus 
car train 
 walk''';

void main(args) {
  str.split(new RegExp(r'\s+')).forEach((s){
    print(s);
  });
}