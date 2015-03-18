library x;

void main(List<String> args) {
  String s = null;

  print(s == null); // true
  print(s is Null); // produces warning
  print(s is String); // false as it's Null
  print(null == null);
}