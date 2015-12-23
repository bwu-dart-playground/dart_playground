//import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';
import 'package:di_simple/todo_list.dart';
import 'package:di_simple/my_http.dart';
import 'package:di_simple/my_oauth.dart';

void main() {
//  enableProdMode();
  bootstrap(TodoList, const [MyOAuth, MyHttp]);
}
