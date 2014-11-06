import 'dart:io';
void main() {
  Process.run('ls', ['-c', '/home/zoechi/*'], runInShell: true).then((ProcessResult results) {
    print(results.stdout);
  });
}
