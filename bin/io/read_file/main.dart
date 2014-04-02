library x;

import 'dart:async';
import 'dart:io';
import 'package:yaml/yaml.dart';

void main(List<String> args) {

  var file = new File('/home/zoechi/source/my/dart/polymer_try_1/pubspec.yaml');
  Future<String> finishedReading = file.readAsString();
  finishedReading.then((text) {
    print(text);
    print(loadYaml(text));
  });

}