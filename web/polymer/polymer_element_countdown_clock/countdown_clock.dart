//import 'dart:async';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('countdown-clock')
class CountdownClock extends DivElement with Polymer{
  CountdownClock() : super.created();


  @observable Duration timeLeft = new Duration(seconds: 72);
}