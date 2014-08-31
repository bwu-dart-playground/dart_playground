import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_item.dart';

/**
 * A Polymer app-element element.
 */
@CustomTag('app-element')

class AppElement extends PolymerElement {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
  }

  var yearsList = <int>[ 1, 2, 3, 4];
  @observable int year = 0;

  var age = new Age();

  void inputHandler() {
    if (age.birthday != '') {
      DateTime now = new DateTime.now();
      DateTime birthday = DateTime.parse(age.birthday.replaceAll(r'-', ''));

      //Duration dayz = ( birthday.difference( new DateTime.now() ) ).inDays;
      Duration duration = new DateTime.now().difference(birthday);

      // calculate years since birth
      int days = duration.inDays;
      age.years = days ~/ 365;

      // attempting to set the PaperItem label to the calculated age
      var yearsPprItm = $[ 'years-ppr-itm' ] as PaperItem;

      // neither of the following resets the PaperItem label to the age variable
      yearsPprItm.setAttribute('label', age.years.toString());
      //year = age.years.toString();
    }
  }
}

class Age {
  int years = 0;
  String birthday = '';
}
