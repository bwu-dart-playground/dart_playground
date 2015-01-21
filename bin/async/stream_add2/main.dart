import 'dart:async' show Stream, Future, StreamController;

class ViewModelBase{
   //final List<PropertyChangedRecord> _changeRecords = new List<PropertyChangedRecord>();
   //Stream<PropertyChangedRecord> _changes;

  final StreamController _changeRecords = new StreamController<PropertyChangedRecord>();

   Stream<PropertyChangedRecord> get changes => _changeRecords.stream;

  _raisePropertyChanged(oldValue,newValue,propertySymbol){
    if(oldValue!=newValue){
      _changeRecords.add(new PropertyChangedRecord(this, propertySymbol,oldValue,newValue));
    }
    return newValue;
  }
}

class PropertyChangedRecord{
  final ViewModelBase viewModel;
  final Symbol propertySymbol;
  final Object newValue;
  final Object oldValue;
  PropertyChangedRecord(this.viewModel,this.propertySymbol,this.oldValue,this.newValue);
}

void main() {
  var p = new Person('waa',13);
  p.age = 33334;
  p.name = 'dfa';
  p.changes.listen((p)=>print(p));
  p.age = 333834;
  p.name = 'dfia';
}

class Person extends ViewModelBase{
  String _name;
  String get name => _name;
  set name(String value) => _name = _raisePropertyChanged(_name,value,#name);

  int _age;
  int get age => _age;
  set age(int value) => _age = _raisePropertyChanged(_age,value,#age);

  Person(this._name,this._age);
}
