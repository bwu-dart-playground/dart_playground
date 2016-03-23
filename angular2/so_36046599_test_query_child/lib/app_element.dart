library so_36046599_test_query_child.app_element;

import 'package:angular2/core.dart' show Component, View, Input, Output, EventEmitter;

///
@Component(
    selector: 'app-element',
    directives: const [CustomListComponent],
    template: '''
<h1>app-element</h1>
<custom-list-component></custom-list-component>
''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
}

///
class CustomListItem {
    String text;
    bool hidden;

    ///
    CustomListItem(String text, bool hidden) {
        this.text = text;
        this.hidden = hidden;
    }
}

///
@Component(
    selector: 'custom-list-component',
    inputs: const ['itemClass', 'items'],
    outputs: const ['onChange'],
    template: r'''
    <ul class="list-unstyled">
      <li *ngFor="#item of items" [hidden]="item.hidden">
        <div [class]="itemClass" (click)="onItemClicked(item)">
            {{item.text}}
        </div>
      </li>
    </ul>
    '''
)
class CustomListComponent {
    ///
    String itemClass;
    ///
    List<CustomListItem> items;
    ///
    EventEmitter<CustomListItem> onChange;

    ///
    CustomListComponent() {
        this.items = new List<CustomListItem>();
        this.onChange = new EventEmitter();
    }
       ///
    void onItemClicked(CustomListItem item) {
        var clone = new CustomListItem(item.text, item.hidden);
        this.onChange.emit(clone);
    }
}
