void main() {
  var p = new Person()
    ..name = '0123456789012345678901234567890123456789'
    ..age = 15;
  print(p.validate());
}

class Person {
  static const maxNameLength = 32;
  static const minAge = 18;
  static const maxNameLengthExceededMessage = 'The maximum name length is $maxNameLength';
  static const minAgeBelowMinAgeMessage = 'The minimum age is $minAge to register for this service.';
  static const nameMandatoryMessage = '"name" is mandatory.';
  static const ageMandatoryMessage = '"age" is mandatory.';

  String name;
  int age;

  List<String> validate() {
    var errors = [];
    if (name == null || name.isEmpty) {
      errors.add(nameMandatoryMessage);
    } else if (name.length > maxNameLength) {
      errors.add(maxNameLengthExceededMessage);
    }

    if (age == null) {
      errors.add(ageMandatoryMessage);
    } else if (age < minAge) {
      errors.add(minAgeBelowMinAgeMessage);
    }
    return errors;
  }
}
