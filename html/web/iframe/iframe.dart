import 'dart:html' as dom;

void main() {
  dom.window.onMessage.listen((dom.MessageEvent e) {
    print("source: ${e.source}, data: ${e.data}, origin: ${e.origin}, path: ${e.path}, currentTarget: ${e.currentTarget}, target: ${e.target}, type: ${e.type}");
  });
}