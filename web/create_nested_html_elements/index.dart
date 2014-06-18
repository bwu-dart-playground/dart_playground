import 'dart:html';
import 'dart:async';
import 'dart:convert';


main () {
  List<String> placeholders = ['№', 'Name', 'LastName', 'Register No', 'University', 'Occupation', 'Grade', 'Date'];

  TableRowElement tr = new Element.tr()
      ..classes.add("table-header-student");

  placeholders.forEach((ph) {
    tr.append(new TableCellElement()..append(new InputElement()..placeholder = ph));
  });

  querySelector('table').append(tr);
}

