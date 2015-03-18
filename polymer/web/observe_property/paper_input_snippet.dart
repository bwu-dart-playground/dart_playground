import 'package:polymer/polymer.dart';

@CustomTag( 'paper-input-snippet' )
class PaperInputSnippet extends PolymerElement {

  PaperInputSnippet.created() : super.created() {
    print('PaperInputSnippet');
  }

  @observable String authorGivenName = '';
  @observable String authorFamilyName = '';
  @observable String get fullName => '${authorGivenName} ${authorFamilyName}';

  @ObserveProperty('authorGivenName authorFamilyName')
  void updateFullName(old) {
    notifyPropertyChange(#fullName, old, fullName);
  }
}