List associations = [
                     {'name': 'NaVi', 'description': 'Natus Vincere'},
                    {'name': 'EG', 'description': 'Evil Genius'}
                    ];

List members = [
{'associationName': 'NaVi', 'firstName': 'John', 'lastName': 'Malkovich', 'email': 'jm@gmail.com'},
{'associationName': 'EG', 'firstName': 'Charles', 'lastName': 'Darwin', 'email': 'cd@gmail.com'},
{'associationName': 'EG', 'firstName': 'Bob', 'lastName': 'Dylan', 'email': 'bd@gmail.com'}
];

void main(List<String> args) {
  members.sort((m1, m2) {
    var r = m1["lastName"].compareTo(m2["lastName"]);
    if (r != 0) return r;
    return m1["firstName"].compareTo(m2["firstName"]);
  });

  print(members);
}

