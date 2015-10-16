void main() {
  bool isRelease = true;
  assert(() {
    isRelease = false;
    return true;
  });

  if (isRelease) {
    print('release');
  }
}
