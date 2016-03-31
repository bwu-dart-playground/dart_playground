import 'package:so_36046599_test_query_child/app_element.dart'
    show CustomListComponent, CustomListItem;
import 'package:angular2_testing/angular2_testing.dart'
    show ComponentFixture, TestComponentBuilder, initAngularTests, ngTest;
import 'package:angular2/core.dart' show Component;
import 'package:test/test.dart' show group, test;
import 'dart:async' show Future;
import 'package:angular2/src/platform/dom/debug/by.dart';

///
void main() {
  initAngularTests();
  group('CustomListComponent', () {
    var el;
    var dropdownToggleBtn, dropdownListEl;
    var regularListEl;

    Future<ComponentFixture> createComponent(TestComponentBuilder tcb) {
      // ignore: STRONG_MODE_DOWN_CAST_COMPOSITE
      return tcb.createAsync(CustomListComponentDemo).then((
          ComponentFixture fixture) {
        el = fixture.debugElement.nativeElement;
        regularListEl = fixture.debugElement.query(By.css(".list-unstyled"));
//        dropdownListEl = fixture.debugElement
//            .query(By.css(".dropdown-menu"))
//            .nativeElement;
//        dropdownToggleBtn = fixture.debugElement
//            .query(By.css(".btn"))
//            .nativeElement;
        fixture.detectChanges();

        return fixture;
      });
    }

    ngTest('Event output properly when list item clicked',
        (TestComponentBuilder tcb) {
      return createComponent(tcb).then((fixture) {
        print("el (" + el + ")"); // => [object HTMLDivElement]
        print("dropdownToggleBtn (" + dropdownToggleBtn +
            ")"); // => [object HTMLButtonElement]
        print("dropdownListEl (" + dropdownListEl +
            ")"); // => [object HTMLDivElement]
        print("regularListEl (" + regularListEl + ")"); // => null
        //...further testing...
      });
    });
  });
}

///
@Component(
    selector: 'dummy',
    template: r'''
        <div class="btn-group" dropdown>
            <button id="dropdown-toggle-id" type="button" class="btn btn-light-gray" dropdownToggle>
                <i class="glyphicon icon-recent_activity dark-green"></i> Dropdown <span class="caret"></span>
            </button>
            <div class="dropdown-menu" role="menu" aria-labelledby="dropdown-toggle-id">
            <custom-list-component id="dropdown-list-id"
                 [items]="dropdownListItems" [itemClass]="'dropdown-item'"
                 (onChange)="onDropdownListChange($event)">
            </custom-list-component>
        </div>
        <span class="divider">&nbsp;</span>
    </div>
    <custom-list-component id="regular-list-id"
        [items]="regularListItems"
        (onChange)="onRegularListChange($event)">
    </custom-list-component>
    ''',
    directives: const [CustomListComponent]

)
class CustomListComponentDemo {
  ///
  List<CustomListItem> dropdownListItems;

  ///
  List<CustomListItem> regularListItems;

  ///
  CustomListComponentDemo();

  // {
//    //intialize the item lists
//  }

  ///
  void onDropdownListChange(CustomListItem item) {
    //print something to the console logs
  }

  ///
  void onRegularListChange(CustomListItem item) {
    //print something to the console logs
  }
}
