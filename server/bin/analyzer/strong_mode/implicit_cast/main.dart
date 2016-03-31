import 'dart:convert';

const String sampleJSON = '''
{
    "member": {
        "meaningOfLife": 42
    }
}
''';

Map<String, dynamic> getResource() {
  // do some magic
  // ignore: STRONG_MODE_DOWN_CAST_COMPOSITE
  return JSON.decode(sampleJSON);

}
