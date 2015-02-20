import 'package:polymer/polymer.dart';

import 'package:polymer/polymer.dart';

//import 'package:epimss_shared/epimss_shared_client.dart' hide DataEvent;

@CustomTag('style-provider')
class AppElement extends PolymerElement {
  String topic = '';

  @observable String lb50 = "red";
  @observable String lb100 = "green";
  @observable String lb200 = "blue";

  AppElement.created() : super.created();

  @published
  String get width => readValue(#width);
  set width(String value) => writeValue(#width, value);

  @override
  void attached() {
    super.attached();
    topic = this.dataset['topic'];
  }
}
