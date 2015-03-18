void main() {
  //[null, 0.00].firstWhere((value) => value != null);

  print([1.00, 0.00].firstWhere((value) => value != null).toStringAsFixed(4));
}
