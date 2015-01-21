import 'package:polymer/polymer.dart';
import 'package:observe/observe.dart';
import 'dart:mirrors';
import 'dart:async';
import 'dart:math';

class Column extends Observable {
  @observable String name;
  @observable String displayName;
  Column(this.name,this.displayName);
}

class Model extends Observable {
  @observable String fname;

  @observable String lname;

  @observable int age;

  @observable String get dummy => '$fname$lname$age';


  getValue(String colName, String dummy) {
    return this[colName];
  }

  Model(this.fname, this.lname, this.age) {
    changes.listen((List<ChangeRecord> c) {
      c.forEach((PropertyChangeRecord r) {
        if(r.name != #dummy) {
          notifyPropertyChange(#dummy, null, dummy);
        }
      });
    });
  }

  operator [](String fieldName){
    var im = reflect(this);
    return im.getField(new Symbol(fieldName)).reflectee;
  }
}


@CustomTag('app-element')
class MainApp extends PolymerElement {
  @observable ObservableList<Object> data;
  @observable ObservableList<Column> columns;

  MainApp.created() : super.created(){
    columns = new ObservableList.from([new Column("fname","First Name"), new Column("lname","Last name"),new Column("age","Age")]);
    emulateDataChanging();
  }

  emulateDataChanging(){
    var r = new Random();
    var names = ["aaa","bbb","ccc","ddd","eee"];
    //add some models to data first
    data = toObservable([]); //new ObservableList();
    for(int i=0;i<5;i++){
      data.add(new Model(names[r.nextInt(4)],names[r.nextInt(4)],r.nextInt(99)));
    }

    //modify couple random props every second
    new Timer.periodic(new Duration(seconds: 1),(t){

      Model m;
      int row = r.nextInt(data.length);
      m = (data[row] as Model)
          ..lname = names[r.nextInt(4)];
      m = (data[r.nextInt(data.length)] as Model)
          ..fname = names[r.nextInt(4)];
      m = (data[r.nextInt(data.length)] as Model)
          ..age = r.nextInt(4);

      //add a random model
      //data.add(new Model(names[r.nextInt(4)],names[r.nextInt(4)],r.nextInt(99)));
    });
  }
}
