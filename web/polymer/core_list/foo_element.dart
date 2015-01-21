import 'package:polymer/polymer.dart';
import 'foo.dart';

@CustomTag('foo-element')
class FooElement extends PolymerElement {

  /// Constructor used to create instance of FooElement.
  FooElement.created() : super.created() {
  }

  Foo _foo;
  @PublishedProperty(reflect: true)
  dynamic get foo => _foo;

  void  set foo(foo) {
    _foo = foo;
  }
}
