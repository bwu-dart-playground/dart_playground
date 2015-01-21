import 'dart:html';

void main() {
  document.registerElement('x-c', C);
  document.registerElement('x-b', B);
}

class ViewBase extends HtmlElement {
  TemplateElement t;
  ViewBase.created() : super.created() {
    print("ViewBase, ${this.runtimeType}");
    var shadow = this.createShadowRoot();
    shadow.append(document.importNode((this.querySelector('template') as TemplateElement)
        .content, true));
  }
}

class B extends ViewBase {
  B.created() : super.created() {
    print("B, ${this.runtimeType}");
  }
}

class C extends ViewBase {
  C.created() : super.created(){
    print("C, ${this.runtimeType}");
  }
}
