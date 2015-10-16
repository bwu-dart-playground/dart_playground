import 'package:polymer/polymer.dart';

class Project extends Observable {
  Project(this.name, this.dateCreated);
  @published var name;
  @published var dateCreated;
}

@CustomTag('tr-rep')
class MainApp extends PolymerElement {

  /// Constructor used to create instance of MainApp.
  MainApp.created() : super.created();

  /// Called when an instance of main-app is inserted into the DOM.
  attached() {
    createModelObjects();
    super.attached();
  }

  @published List<Project> projects = toObservable(new List());

  void createModelObjects() {
    print('createModelObjects');
    projects.add(new Project(
        "InterSections Santa Rosa South inspection", new DateTime.now()));
    projects.add(
        new Project("Playground Inspections Healdsburg ", new DateTime.now()));
    projects.add(new Project(
        "Pothole inspection Bloomfield Rd Sebastopol", new DateTime.now()));
  }
}
