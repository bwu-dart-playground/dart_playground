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
FlatMapLatest flatMap(Mapper f) => new FlatMap(f);

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<input type="text" #symbol [ngFormControl]="searchText" placeholder="ticker symbol">
<ul>
  <li *ngFor="#tick of tickers.toList() | async">ticker: {{tick.name}}</li>
</ul>
<div>input: {{symbol.value}}</div>
<div>tickers: {{tickers.toList() | async}}</div>
''',
    directives: const [FORM_DIRECTIVES])
class AppElement {
  Control searchText = new Control();
  String outputText;
  TickerLoader _tickerLoader;
  Stream<Stream<Item>> tickers;
  AppElement(this._tickerLoader) {
    tickers = searchText.valueChanges
        .transform(debounce(200))
        .transform(flatMapLatest((String value) {
      var result = _tickerLoader.load(value);
      print(result);
      return result;
    })).asBroadcastStream();

    tickers.listen((value) =>
        print(value));
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
