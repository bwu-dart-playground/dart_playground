import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created();

  @observable DateTime today = new DateTime.now();
  @observable var aDate;


   void onChangeFired(e) {
     print(aDate);
   }
}
