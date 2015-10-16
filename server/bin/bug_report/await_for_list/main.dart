main() {
  someAsync();
}

someAsync() async {
  var list = ['a', 'b', 'c'];
  await for(var l in list) {
    print(l);
  }
}
