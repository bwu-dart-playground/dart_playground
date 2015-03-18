import 'dart:html' as dom;
import 'package:polymer/polymer.dart';
import 'package:template_binding/template_binding.dart' as tb;

@CustomTag('nested-templates')
class NestedTemplates extends PolymerElement {
  NestedTemplates.created() : super.created();

  @observable List<Outer> outer = toObservable([new Outer('o1', toObservable(
      [new Inner('a'), new Inner('b')])), new Outer('o2', toObservable([new Inner(
      'c'), new Inner('d')]))], deep: true);

  void innerClickHandler(dom.Event e) {
    shadowRoot.querySelectorAll('li.selected').forEach((e) => (e as
        dom.HtmlElement).classes.remove('selected'));
    (e.target as dom.HtmlElement).classes.add('selected');

    tb.TemplateInstance ti = tb.nodeBind(e.target).templateInstance; // get access to the TemplateInstance of the element

    // TemplateInstance provides access to the model and the actual value
    var value = ti.model.value as Inner;

    print('name: ${value.name}'); // works
    print('equals: ${value == (e.target as dom.HtmlElement).attributes['template-value']}'); // prints "false"
    print(
        '${(e.target as dom.HtmlElement).attributes['template-value']}'); // prints "Instance of 'Inner'"

    // shows that the attribute only has the result of 'toString()' but not the actual value of type 'Inner'
    print(
        '${(e.target as dom.HtmlElement).attributes['template-value'].runtimeType}'); // prints "String"
  }
}

class Inner extends Observable {
  @observable String name;

  Inner(this.name);
}

class Outer extends Observable {
  @observable String name;
  List<Inner> inner;

  Outer(this.name, this.inner);
}
