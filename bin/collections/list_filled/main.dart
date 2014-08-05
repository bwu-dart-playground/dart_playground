void main() {
  int n = 2;
  List<List<int>> numbers = new List.generate(n, (i) => []);
  print(numbers);
  for(int i=0; i<n; i++) {
    for(int j=i+1; j<n; j++ ){
      print(numbers);
      numbers[i].add(0);
      print(numbers);
      numbers[j].add(1);
      print(numbers);
    }
  }
  print(numbers);
}
