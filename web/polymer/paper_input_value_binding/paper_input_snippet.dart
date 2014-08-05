import 'package:polymer/polymer.dart';
import 'dart:html';

import 'package:paper_elements/paper_input.dart';
import 'package:core_elements/core_input.dart';

@CustomTag( 'paper-input-snippet' )
class PaperInputSnippet extends PolymerElement {
  @observable String val = 'Tommy';
  String receiver = '';
  @observable String path;

  PaperInputSnippet.created() : super.created() {
    print('PaperInputSnippet');
  }

  void zoom( Event e, var detail ) {
    print ( e.target );
    print ( val);
  }

  @override
  void attached() {
     super.attached();
     receiver = this.dataset['receiver'];
  }

  void firstNameChangeHandler() {
    val = ($['first_name'] as PaperInput).value;
  }

  void validHandler(Event e) {
    print('valid-handler: $e');
  }

  void invalidHandler(Event e) {
    print('inalid-handler: $e');
  }

  void validHandlerCore(Event e) {
    print('valid-handler: $e');
  }

  void invalidHandlerCore(Event e) {
    print('inalid-handler: $e');
  }
}