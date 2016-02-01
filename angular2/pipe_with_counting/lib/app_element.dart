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

@Component(selector: 'app-element')
@View(
    template: '''
<h1>app-element</h1>
<tr *ngFor="#singleCustomerData of customerData | myFilter:[searchTerm, filteredCount]">
  <div></div>
</tr>
''',
    directives: const [MyFilter])
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
@Injectable()
class MyFilter implements PipeTransform {
  transform(List customerData, List args) {
    Map counter;

    if (args[0] is Map && (args[0] as Map).containsKey('count')) {
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
        customerData.where((item) => re.hasMatch(item['customerId']));
    if (counter != null) {
      counter['count'] = matchingItems;
    }

    return matchingItems;
  }
}
