class User {
  String name;
  User(this.name);
}


void main(args) {
  var users = <User>[new User('Freewind')];
  var list = new List<User>.from(users);
  print(list.first.name);
}