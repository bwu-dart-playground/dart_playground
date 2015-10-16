import 'package:polymer/polymer.dart';
import 'dart:html' as dom;
import 'dart:js' as js;
import 'package:paper_elements/paper_item.dart';

import 'package:paper_elements/paper_input.dart';
import 'package:template_binding/template_binding.dart' as tb;

@CustomTag('app-element')
class AppElement extends PolymerElement {
  AppElement.created() : super.created();

  @observable int selectedMenuIndex;

  final List<Country> countries = [
    const Country('Afghanistan', 'AF'),
    const Country('Åland Islands', 'AX')];


  void onCoreSelectCountryHandler(dom.CustomEvent e, var detail) {
    var d = new js.JsObject.fromBrowserObject(e)['detail'];
    print(countries[$['country'].selected].name);
    detail['item'].text;


//      if (detail['isSelected']) {
//      // DOES NOT WORK - HOW DO I GET THE SELECTION ATTEMPTED BELOW
//      // The detail should be related to the Country class but
//       // I can't seem to relate it so I could get the selection.
//      var kuntry = (detail['item'] as PaperItem).text;
//    }
  }
  void togglePanelButton(dom.MouseEvent e) {
    print('clicked');
  }

  void selectedMenuIndexChanged(old) {
    print(selectedMenuIndex);
  }

  @override
  void attached() {
     super.attached();
  }
}


class Country {
  final String name;
  final String code;
  const Country(this.name, this.code);
}
