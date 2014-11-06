import 'dart:async';

class UnitOfWork {
  EntityResolver entityResolver;

  Future init() {
    return new Future(() => entityResolver.doSomething()) ;
  }
}

class MyUnitOfWork extends UnitOfWork {
  MyProject project;
  MyUnitOfWork(this.project) {
    entityResolver = new EntityResolver(() => print('entityResolver'));
  }
}

class EntityResolver {
  Function doSomething;
  EntityResolver(this.doSomething);
}

class MyProject {
  UnitOfWork createUnitOfWork() => new MyUnitOfWork(this);
}

void main() {
  var prj = new MyProject();
  var session = prj.createUnitOfWork()
    ..init();
}
