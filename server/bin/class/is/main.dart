class TextEditor {}

class AddressEditor extends TextEditor {}
class TypeEditor extends TextEditor {}

void main() {
  check(new AddressEditor());
  check(new TypeEditor());
  check(new TextEditor());
}

void check(TextEditor editor) {
  if(editor is AddressEditor) print('AddressEditor: ${editor.runtimeType}');
  if(editor is TypeEditor) print('TypeEditor: ${editor.runtimeType}');
  if(editor is TextEditor) print('TextEditor: ${editor.runtimeType}');
}
