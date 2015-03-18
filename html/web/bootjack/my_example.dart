library x;

import 'dart:html';
@MirrorsUsed(targets: 'Element,Node', symbols: 'title,text')
import 'dart:mirrors';
import 'package:polymer/polymer.dart';

@CustomTag('my-example')
class MyExample extends PolymerElement {
  MyExample.created() : super.created(){
    articles.addAll(this.querySelectorAll("div"));
  }
  
  
  
  
  
  
  
  
  
  final List<HtmlElement> articles = toObservable([]);
}