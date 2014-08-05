import 'dart:async';
import 'dart:html';
import 'dart:convert';

class SomeClass {
  static Future<SomeClass> create(String val) {
    return new SomeClass._()._load(val);
  }

  SomeClass._();

  Future _load(String val) {
    return new Future.value('bla');
  }
}


class MenuList {
  String path;
  List my_json;

  static Future<MenuList> create(String path) {
    return new MenuList()._load(path);
  }

  Future<MenuList>_load(String path) {
    Completer completer = new Completer();
    this.path = path;
    var httpRequest = new HttpRequest();
    httpRequest
        ..open('GET', path)
        ..onLoadEnd.listen((e) {
          requestComplete(httpRequest);
          completer.complete(this);
        })
        ..send('');
    return completer.future;
  }

  requestComplete(HttpRequest request) {
    if (request.status == 200) {
      this.my_json = JSON.decode(request.responseText);
    }else{
      this.my_json = null;
    }
  }
}



class MyCustomTag {
  MyCustomTag(){

      var menu_list = MenuList.create('menu_items.json')
      .then((menu_list) {
        addElementToMenu(list_value){
          var newElement = new Element.tag('core-item');
          newElement.setAttribute("icon", list_value["icon"]);
          newElement.setAttribute("label", list_value["label"]);
          newElement.onClick.listen((e) => click_menu_item(list_value["label"]));
          shadowRoot.querySelector('#core_menu_item').children.add(newElement);
        };

        menu_list.my_json.forEach(addElementToMenu);
      });
    }
}