import 'dart:async' as async;
import 'package:observe/observe.dart';

class Product extends Object with ChangeNotifier {

  double _price = 0.0;

  @reflectable double get price => _price;
  @reflectable void set price(double value) {
    if (value == null) throw new ArgumentError();
    _price = notifyPropertyChange(#price, price, value);
  }

  @override
  String toString() => 'Product - price: $price';
}

class Order extends Object with ChangeNotifier {

  final ObservableList<Product> products = new ObservableList<Product>();

  // keep listeners to be able to cancel them
  final List<async.StreamSubscription> subscriptions = [];

  Order() {
    products.changes.listen((cr) {
      // only react to length changes (isEmpty, isNotempty changes are redundant)
      var lengthChanges = cr.where((c) => c.name == #length);
      if(lengthChanges.isNotEmpty) {
        lengthChanges.forEach((lc) =>
        notifyChange(lc));
        // we can't know if only additions/removals were done therefore we
        // cancel all existing listeners and set up new ones for all items
        // after each length change
        _updateProductsListeners();
      }
    });
    // initial setup
    _updateProductsListeners();
  }

  // cancel all product change listeners and create new ones
  void _updateProductsListeners() {
    print('updateListeners');
    subscriptions.forEach((s) => s.cancel());
    subscriptions.clear();
    products.forEach((p)
    => subscriptions.add(p.changes.listen((crs) =>
    crs.forEach((cr) =>
      notifyPropertyChange(cr.name, cr.oldValue, cr.newValue)))));
  }

  double get total {
    double sum = 0.0;
    for (var item in products) {
      sum += item.price;
    }
    return sum;
  }
}

void main() {
// Synchronizes the view total with the order total.
// Or rather, I'd like it to do that.
  var order = new Order();
  order.changes.listen((records) {
    //view.total = order.total;
    records.forEach(print);
  });

  // a PathObserver example but it doesn't seem to be more convenient
  var op = new PathObserver(order, 'products[3].price')..open((c) =>
    print(c));

  var prods = [new Product()..price = 1.0, new Product()..price = 2.0, new Product()..price = 3.0, new Product()..price= 4.0];
  var prods2 = [new Product()..price = 5.0, new Product()..price = 6.0];

  order.products.addAll(prods);

  // use Future to allow change notification propagate between changes
  new async.Future(() =>
  order.products..addAll(prods2)..removeWhere((p) => p.price < 3.0))
  .then((_) => new async.Future(() => order.products[3].price = 7.0));

  new async.Future.delayed(new Duration(seconds: 1), () => print('done'));
}
