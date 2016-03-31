library data_attribute.app_element;

import 'package:angular2/core.dart'
    show Attribute, Component, ElementRef, Input, OnInit, Output, View;
import 'dart:html' show Element;

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<test-element
  data-topic='id'
  topic='topicid'
  some-attr='attr'
></test-element>
''',
    directives: const [TestElement])
class AppElement {}

@Component(
    selector: 'test-element',
    template: '''
<h1>test-element</h1>
<div>constructorDataTopic: {{constructorDataTopic}}</div>
<div>data-topic: {{dataTopic}}</div> <!-- seems to work in TS but not in Dart -->
<div>attr.data-topic: {{attrDataTopic}}</div>
<div>some-attr: {{someAttr}}</div>
<div>topic: {{topic}}</div>
<div>topicFromRef: {{topicFromRef}}</div>
''')
class TestElement implements OnInit {
  String constructorDataTopic;

  @Input('data-topic') // data-xxx only works with @Attribute in constructor
  String dataTopic;

  @Input('attr.data-topic')
  String attrDataTopic;

  @Input('topic')
  String topic;

  @Input('some-attr')
  String someAttr;

  String topicFromRef;

  ElementRef _elementRef;
  TestElement(
      this._elementRef, @Attribute('data-topic') this.constructorDataTopic);

  void ngOnInit() {
    topicFromRef = (_elementRef.nativeElement as Element).dataset['topic'];
  }
}
