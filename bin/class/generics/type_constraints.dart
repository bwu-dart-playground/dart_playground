
class Question<T extends IAnswer>{ // seems only extends is supported in constraints
  String body;
  T answer;
}

//an interface
class IAnswer{
  String Value()=>this.toString();
}

void main(args){

}