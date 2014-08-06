/*if( playground == 'core_elements' ) <!-- copyright notice core-elements -->*/

library playground.my_item;

import 'dart:html' as dom;
import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_item.dart';

@CustomTag('my-item')
class MyItem extends PaperItem {
  MyItem.created() : super.created();
}
