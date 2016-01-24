library data_attribute.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        ElementRef,
        FORM_DIRECTIVES,
        Input,
        OnInit,
        Output,
        View;
import 'dart:html' show Element;

@Component(selector: 'app-element')
@View(
    template: '''
<h1>app-element</h1>
<test-element data-topic="id" topic='topicid' some-attr="attr"></test-element>
''',
    directives: const [TestElement])
class AppElement {}

@Component(
    selector: 'test-element',
    template: '''
<h1>test-element</h1>
<div>data-topic: {{topic}}</div>
<div>some-attr: {{someAttr}}</div>
<div>topic: {{topic2}}</div>
<div>topicFromRef: {{topicFromRef}}</div>
''')
class TestElement implements OnInit {
  @Input('data-topic')
  String topic;

  @Input('topic')
  String topic2;

  @Input('some-attr')
  String someAttr;

  String topicFromRef;

  ElementRef _elementRef;
  TestElement(this._elementRef);

  void ngOnInit() {
    topicFromRef = (_elementRef.nativeElement as Element).dataset['topic'];
  }
}
