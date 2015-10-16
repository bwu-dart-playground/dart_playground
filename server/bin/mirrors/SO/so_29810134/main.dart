import 'dart:typed_data';
import 'dart:mirrors';

main() {
  var array = new Float32List(10);

  var bytesPerElement = reflectClass(Float32List).getField(#BYTES_PER_ELEMENT).reflectee;
  print(bytesPerElement);

}
