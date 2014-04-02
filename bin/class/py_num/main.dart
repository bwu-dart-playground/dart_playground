//import 'lib/inbuilts.dart';
import 'dart:io';

fib(n) {
  if (n <= new $PyNum(2)) {
    return new $PyNum(1);
  } else {
    return (fib((n - new $PyNum(1))) + fib((n - new $PyNum(2))));
  }
}

fib2(n) {
  if (n <= const $PyNum2(2)) {
    return const $PyNum2(1);
  } else {
    return (fib2((n - const $PyNum2(1))) + fib2((n - const $PyNum2(2))));
  }
}

fib3(n) {
  if(n <= 2)      return 1;
  else
      return fib3 (n - 1) + fib3 (n - 2);
}

main() {
  Stopwatch watch = new Stopwatch()..start();
  stdout.writeln(fib3(36));
  watch.stop();
  print('\$PyNum3: ${watch.elapsed}');

  watch.reset();
  watch.start();
  stdout.writeln(fib2(new $PyNum2(36)));
  watch.stop();
  print('\$PyNum2: ${watch.elapsed}');

  watch.reset();
  watch.start();
  stdout.writeln(fib(new $PyNum(36)));
  watch.stop();
  print('\$PyNum: ${watch.elapsed}');

}

class $PyNum {
  num _value;

  $PyNum(value) {
    switch ($getType(value)) {
      case 6:
        _value = value;
        break;
      case 7:
        try {
          _value = num.parse(value);
        } catch (ex) {
          print("Invalid string literal for num parsing");
          exit(1);
        }
        break;
      case 5:
        _value = value.value();
        break;
      default:
        throw "Invalid input for num conversion";
    }
  }

  value() => _value;
  toString() => _value.toString();

  operator +(other) => new $PyNum(_value + other.value());
  operator -(other) => new $PyNum(_value - other.value());
  operator *(other) => new $PyNum(_value * other.value());
  operator ~/(other) => new $PyNum(_value ~/ other.value());
  operator %(other) => new $PyNum(_value % other.value());
  operator ==(other) {
    switch ($getType(other)) {
      case 6:
        return _value == other;
      case 5:
        return _value == other.value();
      default:
        return false;
    }
  }
  operator <(other) {
    switch ($getType(other)) {
      case 6:
        return _value < other;
      case 5:
        return _value < other.value();
      default:
        return true;
    }
  }
  operator >(other) => !(this < other) && (this != other);
  operator <=(other) => (this < other) || (this == other);
  operator >=(other) => (this > other) || (this == other);
}

$getType(variable) {
  if (variable is bool) return 0; else if (variable is List) return 4; else if
      (variable is $PyNum) return 5; else if (variable is num) return 6; else return
      -1;
}

$getType2(variable) {
  if (variable is bool) return 0; else if (variable is List) return 4; else if
      (variable is $PyNum2) return 5; else if (variable is num) return 6; else return
      -1;
}

class $PyNum2 {
  final num _value;

  const $PyNum2(this._value);

  factory $PyNum2.from(value) {
    switch ($getType2(value)) {
      case 6:
        return new $PyNum2(value);
        break;
      case 7:
        try {
          return new $PyNum2(num.parse(value));
        } catch (ex) {
          print("Invalid string literal for num parsing");
          exit(1);
        }
        break;
      case 5:
        return new $PyNum2(value.value());
        break;
      default:
        throw "Invalid input for num conversion";
    }
  }

  value() => _value;
  toString() => _value.toString();

  operator +(other) => new $PyNum2(_value + other.value());
  operator -(other) => new $PyNum2(_value - other.value());
  operator *(other) => new $PyNum2(_value * other.value());
  operator ~/(other) => new $PyNum2(_value ~/ other.value());
  operator %(other) => new $PyNum2(_value % other.value());
  operator ==(other) {
    switch ($getType2(other)) {
      case 6:
        return _value == other;
      case 5:
        return _value == other.value();
      default:
        return false;
    }
  }
  operator <(other) {
    switch ($getType2(other)) {
      case 6:
        return _value < other;
      case 5:
        return _value < other.value();
      default:
        return true;
    }
  }
  operator >(other) => !(this < other) && (this != other);
  operator <=(other) => this.value() <= other.value(); //(this < other) || (this == other);
  operator >=(other) => (this > other) || (this == other);
}
