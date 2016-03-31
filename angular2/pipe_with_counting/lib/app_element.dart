library pipe_with_counting.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        FORM_DIRECTIVES,
        Input,
        Output,
        Pipe,
        PipeTransform,
        View,
        Injectable;

// http://stackoverflow.com/questions/35127257/how-to-get-the-size-of-a-filtered-piped-set-in-angular2

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<tr *ngFor="#singleCustomerData of customerData | myFilter:searchTerm">
  <div></div>
</tr>
''',
    pipes: const [MyFilter])
class AppElement {
  Map filteredCount = {'count': 0};
  List customerData = [
    {'customerId': 'xxxxxx'},
    {'customerId': 'aaaaa'},
    {'customerId': 'bbbbb'},
    {'customerId': 'gggggg'},
  ];
  String searchTerm = '.*[abcde].*';
}

@Pipe(name: 'myFilter')
// Why is it annotated with injectable
// https://github.com/angular/angular.io/pull/365/files
class MyFilter implements PipeTransform {
  dynamic transform(List customerData, List args) {
    Map counter;

    if (args[0] is Map  && (args[0] as Map).containsKey('count')) {
      counter = args[0];
    }
    if (customerData == null) {
      if (counter != null) {
        counter['count'] = 0;
      }
      return null;
    }
    var re = new RegExp(args[0]);
    List matchingItems =
        customerData.where((item) => re.hasMatch(item['customerId'])).toList();
    if (counter != null) {
      counter['count'] = matchingItems;
    }

    return matchingItems;
  }
}
