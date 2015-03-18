import 'package:polymer/polymer.dart';
import 'dart:typed_data' as td;
import 'dart:html' as dom;

@CustomTag('custom-tabs')

class CustomTabs extends PolymerElement {

  CustomTabs.created() : super.created() {}

  @observable
  List<String> tabHeaders = toObservable([]);

  attached() {
    super.attached();

    updateTabHeaders();
  }

  void updateTabHeaders() {
    tabHeaders.clear();
    ($['content'] as dom.ContentElement).getDistributedNodes().forEach((e) {
      tabHeaders.add((e as dom.Element).attributes['name']);
    });
  }
}
