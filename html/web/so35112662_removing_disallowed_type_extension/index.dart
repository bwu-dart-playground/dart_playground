import 'dart:html';

void main() {
  document.registerElement('db-edit', DBEditText, extendsTag: 'input');
  document.querySelector('button').onClick.listen((e) {
    var inp = document.querySelector('input');
    print(inp.runtimeType);
  });
}

class DBEditText extends InputElement {
  String _FieldName = "";

  DBEditText.created() : super.created() {
    //type = "text";
    this.classes.add("editElement");
  }

  String DBGetValue() {
    return this.value;
  }

  void DBSetValue(String val) {
    this.value = val;
  }
}
