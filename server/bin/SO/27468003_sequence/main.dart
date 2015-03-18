
import 'dart:async';

Duration d1 = new Duration(seconds: 5);
Duration d2 = new Duration(seconds: 10);
Duration d3 = new Duration(seconds: 15);

bool r1 = false;
bool r2 = false;
bool r3 = false;

void cb1() {
    print('Entering CB1');
    r1 = true;
    print('Leaving CB1');
}

void cb2() {
    print('Entering CB2');
    r2 = true;
    print('Leaving CB2');
}

void cb3() {
    print('Entering CB3');
    r3 = true;
    print('Leaving CB3');
}

Future<bool> start1() {
    print('Entering start1');
    r.future.then((_) {
        while (!r1) {

        }
        print('Completing start1');
        r.complete(true);
    });

    print('Leaving start1');
    return r.future;
}

Future<bool> start2() {
    print('Entering start2');
    Completer<bool> r = new Completer();
    r.future.then((_) {
        while (!r2) {

        }
        print('Completing start2');
        r.complete(true);
    });

    print('Leaving start2');
    return r.future;
}

Future<bool> start3() {
    print('Entering start3');
    Completer<bool> r = new Completer();
    r.future.then((_) {
        while (!r3) {

        }
        print('Completing start3');
        r.complete(true);
    });

    print('Leaving start3');
    return r.future;
}

Future<bool> f1() {
    print('Entering f1');
    print('Leaving f1');
    return new Future.delayed(d1, cb1)
    .then((_) => start1());
}

Future<bool> f2() {
    print('Entering f2');
    print('Leaving f2');
    return new Future.delayed(d2, cb2)
    .then((_) => start2());
}

Future<bool> f3() {
    print('Entering f3');
    print('Leaving f3');
    return new Future.delayed(d3, cb2)
    .then((_) => start3());
}

void main() {
    print('Starting main');
    f1().then((_) {
        f2().then((_) {
            f3().then((_) {

            });
        });
    });
    print('Leaving main');
}

//  print('Starting main');
//  List<Future> futures = new List<Future>();
//  Future v1 = f1();
//  Future v2 = f2();
//  Future v3 = f3();
//  futures.add(v1);
//  futures.add(v2);
//  futures.add(v3);
//  Future.wait(futures);
//  print('Leaving main');
