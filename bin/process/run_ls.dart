import 'dart:io';
void main() {
  Directory.current = new Directory('dirWherePubspec.yaml_is');
  Process.run('ls', ['-c', '/home/zoechi/*'], runInShell: true).then((ProcessResult results) {
    print(results.stdout);
  });
}
