library x;

abstract class Resource
{
  String name;
  String description;
  Resource(this.name, this.description);

  Resource.map(Map data)
  {

   // ...
    _getDb()[this] = data;
  }

  Map _getDb();
}

class Skill extends Resource
{
  static Map _skills = {};
  Skill.map(Map data) : super.map(data);

  Map _getDb()
  {
    return _skills;
  }
}



void main(List<String> args) {
//  useVMConfiguration();

  //test('constructor', () {

    Skill skill = new Skill.map({
                                  'name': 'foo'
                                  });
    print(skill._getDb());
  }
