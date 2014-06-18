import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('nested-templates')
class NestedTemplates extends PolymerElement {

    @observable List<Outer> outer = toObservable([
            new Outer('o1', toObservable([ new Inner('a'), new Inner('b')])),
            new Outer('o2', toObservable([ new Inner('c'), new Inner('d')]))
    ], deep: true);

    void innerClickHandler(Event e, Map detail, HtmlElement target) {
        target.classes.add('selected');

        outer[1].inner.add(new Inner('e'));
    }

    NestedTemplates.created() : super.created();
}

class Inner extends Observable {
    String name;

    Inner(this.name);
}

class Outer extends Observable {
    String name;
    List<Inner> inner;

    Outer(this.name, this.inner);
}