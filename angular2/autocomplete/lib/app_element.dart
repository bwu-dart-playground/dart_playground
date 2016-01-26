library autocomplete.app_element;

import 'package:angular2/core.dart'
    show Component, Injectable, Input, Output, View;
import 'package:angular2/common.dart' show Control, FORM_DIRECTIVES;
import 'package:stream_transformers/stream_transformers.dart'
    show Debounce, FlatMapLatest, Mapper;
import 'dart:async';

Debounce debounce(int milliseconds) =>
    new Debounce(new Duration(milliseconds: milliseconds));
// seems to be a different name for switchMap
FlatMapLatest flatMapLatest(Mapper f) => new FlatMapLatest(f);

@Component(selector: 'app-element')
@View(
    template: '''
<h1>app-element</h1>
<input type="text" #symbol [ngFormControl]="searchText" placeholder="ticker symbol">
<ul>
  <li *ngFor="#tick of tickers | async">{{tick.name}}</li>
</ul>
{{symbol.value}} - {{outputText}}
''',
    directives: const [FORM_DIRECTIVES])
class AppElement {
  Control searchText = new Control();
  String outputText;
  TickerLoader _tickerLoader;
  Stream tickers;
  AppElement(this._tickerLoader) {
    tickers = searchText.valueChanges
        .transform(debounce(200))
        .transform(flatMapLatest((String value) => _tickerLoader.load(value)));


        //.listen((String value) => outputText = value);
  }
}

@Injectable()
class TickerLoader {
  Stream<Item> load(String value) {
    StreamController<Item> _controller = new StreamController<Item>();

    new Future.delayed(const Duration(milliseconds: 200), () {
      _controller.add(new Item('==== $value ===='));
      _controller.close();
    });
    return _controller.stream;
  }
}

class Item {
  final String name;
  Item(this.name);
}
