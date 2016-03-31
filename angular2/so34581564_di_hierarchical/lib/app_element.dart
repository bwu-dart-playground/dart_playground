library so34581564_di_hierarchical.app_element;

import 'package:angular2/angular2.dart';

@Component(selector: 'app-element', providers: const [SomeService],templateUrl: 'app_element.html' //,
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement {
  SomeService _service;
  AppElement(this._service);
}

@Injectable()
class SomeService {
  OtherService _other;

  SomeService(Injector injector) {
    _other = injector.getOptional(OtherService);
    if (_other == null) {
      _other = injector.resolveAndCreateChild([
        provide(OtherService, useClass: OtherServiceImpl)
      ]).get(OtherService);
    }
    _other.doSomething();
  }
}

abstract class OtherService {
  doSomething() {
    print('SomeOtherService');
  }
}

@Injectable()
class OtherServiceImpl implements OtherService {
  doSomething() {
    print('SomeOtherServiceImpl');
  }
}

@Injectable()
class OtherServiceImpl2 implements OtherService {
  doSomething() {
    print('SomeOtherServiceImpl 2');
  }
}
