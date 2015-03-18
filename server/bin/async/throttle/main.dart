import "dart:async";
import "dart:collection";

/// This example shows how to run a limited number
/// of asynchronous operations in parallel, throttling
/// the number of concurrent computations so that you
/// don't exceed limited resources.
///
/// For example, if you have a list of files or directories,
/// you may only want to operate on at most 10 of them at once,
/// and wait to start a new operation until one of the outstanding
/// ones completes.
///
/// If you only want to run one operation at a time, the function
/// Future.forEach from dart:async will do it: it takes an iterable,
/// and applies a function to each element in turn, waiting until
/// the function returns and the future that it returns completes
/// before fetching the next element.
///
/// Our trick is to run 10 separate instances of Future.forEach, which
/// all pull their elements from the same Iterator.  An Iterator is
/// the object representing a single iteration through an Iterable object,
/// which returns each element in turn, and then reports that there are
/// no more elements.  Our trick only works because Future.forEach only
/// calls the Iterable.iterator getter once on its iterable argument, and
/// uses the result in the normal way to get elements and then finish.
///
/// We could do the same trick with Streams, to make a throttled
/// Stream.forEach, but it would be trickier.


class MultiplexBase {
  final Iterator iterator;  // Normally the iterator getter should return
  //  a new Iterator each time it is called. Returning the same one each time
  //  will break some methods of Iterable.

  MultiplexBase(Iterable source) : iterator = source.iterator;

  MultiplexBase._clone(MultiplexBase from) : iterator = from.iterator;
}

/// Extending with IteratableMixin implements all the other methods of
/// Iterable using only the iterator getter.
/// We don't actually need to do this, since Future.forEach only
/// uses the iterator getter.  But it makes an object type that the type
/// checker will allow as an input to Future.forEach.
class Multiplex extends MultiplexBase with IterableMixin implements Iterable {
  Multiplex(Iterable source) : super(source);
  Multiplex._clone(Multiplex from) : super(from);

  Multiplex clone() => new Multiplex._clone(this);
}

Future throttledForEach(Iterable input, Function f, int limit) {
  Multiplex base = new Multiplex(input);
  List asyncIterators = [];
  // Run Future.forEach limit times, all drawing on the same iterator of
  // input, which returns each element only once.
  for (var i = 0; i < limit; ++i) {
    asyncIterators.add(Future.forEach(base.clone(), f));
  }
  // Drop the List result of Future.wait.
  return Future.wait(asyncIterators).then((_) => null);
}

// An example function to run, that prints the input twice, with a
// one second delay between.
Future f(i) {
  print(i);
  return new Future.delayed(new Duration(seconds: 1), () => i)
    .then((i) => print(i));
}

main() {
  List squares = new List.generate(30, (i) => i);
  throttledForEach(squares, f, 5);
}
