import 'dart:html';

void main() {
  document.registerElement(SaveBtn.tag, SaveBtn);
  document.registerElement(MegaButton.tag, MegaButton, extendsTag: 'button');
  //document.body.append(new SaveBtn());
  document.body.append(new SaveBtn('blub'));
  document.body.append(new MegaButton());
}

class SaveBtn extends HtmlElement {
  static final tag = 'save-button';

  factory SaveBtn([String name]) => (new Element.tag(tag) as SaveBtn)..name = name..style.width;

  ButtonElement innerButton;
  ShadowRoot shadow;

  SaveBtn.created() : super.created() {
    //  Create a Shadow Root
    var shadow = this.createShadowRoot();
    // Create a standard element and set it's attributes.
    innerButton = new ButtonElement();
    shadow.nodes.add(innerButton);
  }

  String name;

  @override
  void attached() {
    super.attached();
    innerButton.text = name != null ? name : this.dataset['name'];
    //this.getComputedStyle(':after').content = '<div>bla</div>';
  }
}


class MegaButton extends ButtonElement {
  static final tag = 'mega-button';

  factory MegaButton()=> new Element.tag('button', tag);

  MegaButton.created() : super.created() {
    var shadow = this.createShadowRoot();
    shadow.text = 'save';
  }

  void attached() {
    this.onClick.listen((e) => print('Thanks!'));
  }
}
