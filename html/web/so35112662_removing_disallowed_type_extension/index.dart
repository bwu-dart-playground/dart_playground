import 'dart:html';

void main() {
  document.registerElement('db-edit', DBEditText, extendsTag: 'input');
  document.querySelector('button').onClick.listen((e) {
    var inp = document.querySelector('input');
    print(inp.runtimeType);
  });

  NodeValidator validator = new NodeValidatorBuilder()..allowCustomElement('INPUT', attributes: ['is']);
  document.querySelector('body').appendHtml("<input type='text' id='enum' is='db-edit' size=15>", validator: validator);
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
